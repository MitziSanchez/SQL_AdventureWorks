-- Mostrar el top 3 productos más vendidos por categoría usando RANK().

WITH cte_rank AS (
	SELECT 
		OD.ProductID,
		SC.ProductCategoryID,
		SUM(OD.OrderQty) AS Qty,
		RANK() OVER (PARTITION BY SC.ProductCategoryID ORDER BY SUM(OD.OrderQty) DESC) AS Ranking
	FROM Sales.SalesOrderDetail AS OD
	LEFT JOIN Production.Product AS P
	ON OD.ProductID = P.ProductID
	LEFT JOIN Production.ProductSubcategory  AS SC
	ON P.ProductSubcategoryID = SC.ProductSubcategoryID
	GROUP BY OD.ProductID, SC.ProductCategoryID
)

SELECT *
FROM cte_rank
WHERE Ranking <= 3