-- Usar una variable de tabla para simular una lista de IDs de productos y filtrar ventas.

-- Obtener lista de productos
DECLARE @Productos  TABLE(
	ProductId INT PRIMARY KEY
)

INSERT INTO @Productos(ProductId)
SELECT ProductID
FROM Production.Product

DECLARE @Id AS INT
SET @Id = (SELECT TOP(1) ProductId FROM @Productos ORDER BY NEWID())
PRINT CONCAT('P: ', @Id)

-- Filtrar ventas 
SELECT 
	ProductID,
	SalesOrderID,
	OrderQty,
	UnitPrice,
	LineTotal
FROM Sales.SalesOrderDetail
WHERE ProductId = @Id