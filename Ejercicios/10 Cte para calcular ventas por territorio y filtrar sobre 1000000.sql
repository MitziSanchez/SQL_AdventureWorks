-- Crear un CTE que calcule el total de ventas por territorio y luego filtrar los que superen $1,000,000.

WITH cte_ventas AS (
	SELECT DISTINCT
		ST.Name,
		SUM(OH.TotalDue) AS TotalDue
	FROM Sales.SalesOrderHeader AS OH
	LEFT JOIN Sales.SalesTerritory AS ST
	ON OH.TerritoryID = ST.TerritoryID
	GROUP BY ST.Name
)

SELECT *
FROM cte_ventas
WHERE TotalDue > 1000000
