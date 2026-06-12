-- Contar cuantos clientes (Customer) hay por territorio (SalesTerritory)

SELECT 
	T.Name AS Territory_Name,
	COUNT(C.CustomerID) AS Cant_Customers
FROM Sales.Customer AS C
LEFT JOIN Sales.SalesTerritory AS T
ON C.TerritoryID = T.TerritoryID
GROUP BY T.Name
ORDER BY COUNT(C.CustomerID) DESC