-- Usar un CTE para calcular ventas por cliente y luego aplicar una función ventana para ver su posición relativa.

WITH cte_ventas AS (
	SELECT
		CustomerID,
		SUM(TotalDue) AS Total
	FROM Sales.SalesOrderHeader
	GROUP BY CustomerId
)

SELECT 
	*,
	ROW_NUMBER() OVER(ORDER BY Total DESC) AS Ranking
FROM cte_ventas