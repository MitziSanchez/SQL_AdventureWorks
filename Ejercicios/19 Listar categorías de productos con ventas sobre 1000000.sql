-- Listar categorías de productos cuya suma de ventas acumuladas supere los $1.000.000

SELECT 
	SC.Name AS Category,
	SUM(LineTotal) AS Sales
FROM Sales.SalesOrderDetail AS OD
LEFT JOIN Production.Product AS P
ON OD.ProductID = P.ProductID
LEFT JOIN Production.ProductSubcategory AS SC
ON P.ProductSubcategoryID = SC.ProductSubcategoryID
GROUP BY SC.Name
HAVING SUM(LineTotal) > 1000000
