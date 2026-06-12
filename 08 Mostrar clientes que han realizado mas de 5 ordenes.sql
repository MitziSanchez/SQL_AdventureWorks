-- Mostrar clientes que han realizado más de 5 órdenes.

-- Forma 1
SELECT *
FROM (
	SELECT
		C.CustomerID,
		COUNT(oh.SalesOrderID) AS CantOrders
	FROM Sales.SalesOrderHeader AS OH
	LEFT JOIN Sales.Customer AS C
	ON OH.CustomerID = C.CustomerID
	GROUP BY C.CustomerID
	) AS Orders
WHERE CantOrders > 5
ORDER BY CantOrders DESC


-- Forma 2 - cte expresion de tabla comun

WITH Cte_Orders AS (
	SELECT
		C.CustomerID,
		COUNT(oh.SalesOrderID) AS CantOrders
	FROM Sales.SalesOrderHeader AS OH
	LEFT JOIN Sales.Customer AS C
	ON OH.CustomerID = C.CustomerID
	GROUP BY C.CustomerID
)

SELECT * FROM Cte_Orders WHERE CantOrders > 5