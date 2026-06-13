-- Productos mas caros que el promedio de su subcategoria
-- Utilizar precio de producto ListPrice

-- Promedios por subcategoria
SELECT 
	ISNULL(SC.Name, 'No Subcategory') AS Subcategory,
	AVG(P.ListPrice) AS AvgPrice
FROM Production.Product AS P
LEFT JOIN Production.ProductSubcategory AS SC
ON SC.ProductSubcategoryID = P.ProductSubcategoryID
GROUP BY SC.Name
ORDER BY ISNULL(SC.Name, 'No Subcategory') ASC

-- Opcion 1, subconsulta correlacionada
SELECT 
	SC1.Name AS Subcategory,
	P1.ProductID,
	P1.ListPrice
FROM Production.Product AS P1
LEFT JOIN Production.ProductSubcategory AS SC1
ON P1.ProductSubcategoryID = SC1.ProductSubcategoryID
WHERE ListPrice > (
	SELECT AVG(P2.ListPrice)
	FROM Production.Product AS P2	
	LEFT JOIN Production.ProductSubcategory AS SC2
	ON SC2.ProductSubcategoryID = P2.ProductSubcategoryID
	WHERE SC2.ProductSubcategoryID = SC1.ProductSubcategoryID
)
ORDER BY SC1.Name ASC


-- Opcion 2, cte + funcion ventana
WITH cte AS (
	SELECT 
		ISNULL(SC.Name, 'No Subcategory') AS Subcategory,
		P.ProductID,
		P.ListPrice,
		AVG(ListPrice) OVER(PARTITION BY P.ProductSubcategoryID) AS AvgPriceSubcategory
	FROM Production.Product AS P
	LEFT JOIN Production.ProductSubcategory AS SC
	ON P.ProductSubcategoryID = SC.ProductSubcategoryID
)

SELECT *
FROM cte
WHERE ListPrice > AvgPriceSubcategory
ORDER BY Subcategory ASC	