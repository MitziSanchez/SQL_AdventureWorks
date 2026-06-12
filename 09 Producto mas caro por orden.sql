-- Encontrar el producto más caro vendido en cada orden.

-- Forma 1
SELECT 
	OD.SalesOrderID,
	OD.ProductID,
	P.Name,
	OD.UnitPrice
FROM Sales.SalesOrderDetail AS OD
INNER JOIN Production.Product AS P
ON OD.ProductID = P.ProductID
WHERE OD.UnitPrice = (
	SELECT MAX(OD2.UnitPrice)
	FROM Sales.SalesOrderDetail AS OD2
	WHERE OD.SalesOrderID = OD2.SalesOrderID
)
ORDER BY SalesOrderID DESC


-- Forma 2
WITH Cte_Price AS (
	SELECT 
		OD.SalesOrderID,
		OD.ProductID,
		P.Name,
		OD.UnitPrice,
		RANK() OVER(PARTITION BY OD.SalesOrderID ORDER BY OD.UnitPrice DESC) AS Rankeo
	FROM Sales.SalesOrderDetail AS OD
	INNER JOIN Production.Product AS P
	ON OD.ProductID = P.ProductID
)

SELECT 
	SalesOrderID,
	ProductID,
	Name,
	UnitPrice
FROM Cte_Price
WHERE Rankeo = 1
ORDER BY SalesOrderID DESC