-- Obtener las ordenes (SalesOrderHeader) con el nombre del cliente (Customer + Person)
-- Considera clientes empresa y clientes personas naturales

SELECT 
	OH.SalesOrderID,
	OH.OrderDate,
	OH.CustomerID,
	OH.TotalDue, 
	CASE WHEN P.BusinessEntityID IS NOT NULL 
		THEN (P.FirstName + ' ' + P.LastName) 
		ELSE S.Name
		END AS Customer_Name
FROM Sales.SalesOrderHeader AS OH
LEFT JOIN Sales.Customer AS C 
ON OH.CustomerID = C.CustomerID
LEFT JOIN Person.Person AS P
ON C.PersonID = P.BusinessEntityID
LEFT JOIN Sales.Store AS S
ON P.BusinessEntityID = S.BusinessEntityID