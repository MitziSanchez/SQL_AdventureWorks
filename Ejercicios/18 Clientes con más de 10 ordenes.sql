-- Clientes con más de 10 ordenes registradas

SELECT 
	CustomerID,
	COUNT(SalesOrderID) AS Orders
FROM Sales.SalesOrderHeader 
GROUP BY CustomerID
HAVING COUNT(SalesOrderID) > 10
ORDER BY Orders 