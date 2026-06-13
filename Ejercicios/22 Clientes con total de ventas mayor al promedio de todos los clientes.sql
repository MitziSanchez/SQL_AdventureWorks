-- Clientes cuya suma total de ventas sea mayor al promedio de ventas de todos los clientes

SELECT 
	CustomerID,
	SUM(TotalDue) AS Sales
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING SUM(TotalDue) > (SELECT AVG(TotalDue) FROM Sales.SalesOrderHeader)
ORDER BY Sales ASC