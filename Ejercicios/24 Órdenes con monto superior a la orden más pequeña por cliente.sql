-- Órdenes con monto superior a la orden más pequeña por cliente específico

SELECT 
	OH1.CustomerID,
	OH1.SalesOrderID,
	OH1.TotalDue
FROM Sales.SalesOrderHeader AS OH1
WHERE TotalDue > (
	-- Orden mas pequeña cliente especifico
	SELECT MIN(OH2.TotalDue)
	FROM Sales.SalesOrderHeader AS OH2
	WHERE OH2.CustomerID = OH1.CustomerID
)
ORDER BY CustomerID ASC, SalesOrderID ASC