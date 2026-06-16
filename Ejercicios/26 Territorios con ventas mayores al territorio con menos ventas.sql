-- Territorios con ventas mayores al territorio con menos ventas


WITH cte AS (
	SELECT 
		ST.Name,
		SUM(OH.TotalDue) AS TotalSales
	FROM Sales.SalesOrderHeader AS OH
	INNER JOIN Sales.SalesTerritory AS ST
	ON OH.TerritoryID = ST.TerritoryID
	GROUP BY ST.Name
)

SELECT * FROM cte 
WHERE TotalSales > (
	SELECT MIN(TotalSales) FROM cte
)
ORDER BY TotalSales ASC
