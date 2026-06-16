-- Clientes que tienen más órdenes que el promedio de órdenes por cliente.

WITH cte AS (
	SELECT 
		CustomerID,
		COUNT(SalesOrderID) AS Qty_Orders
	FROM Sales.SalesOrderHeader AS OH
	GROUP BY CustomerID
)

SELECT * FROM cte 
WHERE Qty_Orders > (
	SELECT AVG(Qty_Orders) FROM cte
)
ORDER BY Qty_Orders ASC

