-- Calcular ventas acumuladas por cliente con SUM() OVER (PARTITION BY Customer ORDER BY OrderDate).

WITH cte_acumulado AS (
	SELECT 
		CustomerID,
		OrderDate,
		SUM(TotalDue) AS Total	
	FROM Sales.SalesOrderHeader
	GROUP BY CustomerID,OrderDate
)

SELECT 
	*,
	SUM(Total) OVER (PARTITION BY CustomerID 
					ORDER BY OrderDate ASC 
					ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
					) AS Total_Acumulado
FROM cte_acumulado
ORDER BY CustomerID, OrderDate	