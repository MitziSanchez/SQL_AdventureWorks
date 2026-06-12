-- Listar los productos cuyo precio es mayor al promedio de todos los productos.

-- Forma 1
SELECT
	ProductID,
	Name,
	ListPrice	
FROM Production.Product 
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product)
ORDER BY ListPrice ASC

-- Forma 2
DECLARE @AvgPrice AS MONEY 
SET @AvgPrice = (SELECT AVG(ListPrice) FROM Production.Product)

SELECT
	ProductID,
	Name,
	ListPrice	
FROM Production.Product 
WHERE ListPrice > @AvgPrice
ORDER BY ListPrice ASC