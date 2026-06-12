-- Crear una tabla temporal con los clientes VIP (ventas > $50,000) y luego unirla con órdenes.

-- Buscar clientes VIP
SELECT 
	CustomerID,
	SUM(TotalDue) AS Total
INTO #TEMP
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING SUM(TotalDue) > 50000

-- Obtener ordenes realizadas por clientes vip
SELECT 
	T.CustomerID,
	OH.SalesOrderID,
	OH.OrderDate,
	OH.TotalDue
FROM #TEMP AS T
INNER JOIN Sales.SalesOrderHeader AS OH
ON T.CustomerID = OH.CustomerID

-- Eliminar tabla temporal
DROP TABLE #TEMP