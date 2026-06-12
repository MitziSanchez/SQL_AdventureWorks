-- Construir un CTE que calcule ventas por año y luego usarlo en otra consulta para comparar crecimiento.

WITH cte_ventas AS (
	SELECT 
	 YEAR(OrderDate) AS Year,
	 SUM(TotalDue) AS Total_Sales
	FROM Sales.SalesOrderHeader
	GROUP BY YEAR(OrderDate)
)

SELECT 
	Year,
	Total_Sales,
	LAG(Total_Sales) OVER(ORDER BY Year) AS Previous_Total_Sales,
	Total_Sales - (LAG(Total_Sales) OVER(ORDER BY Year)) AS Growth,
	(Total_Sales - (LAG(Total_Sales) OVER(ORDER BY Year))) / (LAG(Total_Sales) OVER(ORDER BY Year)) AS Growth_Pct
FROM cte_ventas