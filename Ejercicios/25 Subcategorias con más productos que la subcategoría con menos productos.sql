-- Subcategorías con más productos que la subcategoría con menos productos


-- Opcion 1
WITH cte AS (
	SELECT 
		ISNULL(SC.Name, 'No Category') AS Subcategory,
		COUNT(P.ProductID) AS Qty_Products,
		DENSE_RANK() OVER(ORDER BY COUNT(P.ProductID) ASC) AS Nro
	FROM Production.Product AS P
	INNER JOIN Production.ProductSubcategory AS SC
	ON P.ProductSubcategoryID = SC.ProductSubcategoryID
	GROUP BY ISNULL(SC.Name, 'No Category')
)

SELECT 
	Subcategory,
	Qty_Products
FROM cte
WHERE Nro > 1


-- Opcion 2
WITH cte2 AS (
	SELECT 
		ISNULL(SC.Name, 'No Category') AS Subcategory,
		COUNT(P.ProductID) AS Qty_Products
	FROM Production.Product AS P
	INNER JOIN Production.ProductSubcategory AS SC
	ON P.ProductSubcategoryID = SC.ProductSubcategoryID
	GROUP BY ISNULL(SC.Name, 'No Category')
)

SELECT *
FROM cte2 AS C1
WHERE C1.Qty_Products > (
	SELECT MIN(C2.Qty_Products)
	FROM cte2 AS C2
)


