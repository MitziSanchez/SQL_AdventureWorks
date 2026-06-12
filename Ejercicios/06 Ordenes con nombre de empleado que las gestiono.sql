-- Mostrar las órdenes con el nombre del empleado que las gestionó (Employee).

SELECT
	OH.SalesOrderID,
	OH.CustomerID,
	OH.OrderDate,
	OH.TotalDue,
	OH.SalesPersonID,
	ISNULL(P.FirstName + ' ' + P.LastName, 'Sin empleado asignado') AS NameEmployee
FROM Sales.SalesOrderHeader AS OH
LEFT JOIN Sales.SalesPerson AS SP
ON OH.SalesPersonID = SP.BusinessEntityID
LEFT JOIN HumanResources.Employee AS E
ON SP.BusinessEntityID = E.BusinessEntityID
LEFT JOIN Person.Person AS P
ON E.BusinessEntityID = P.BusinessEntityID

