-- Recorrer con un cursor todos los clientes (Sales.Customers) y por cada uno, 
-- obtener el total de órdenes registradas en Sales.SalesOrderHeader

-- Tabla de destino
CREATE TABLE #TEMP (
	CustomerID int,
	QtyOrders int
)

-- Variables
DECLARE @Customer int 
DECLARE @Orders int 


-- Declarar cursor
DECLARE db_cursor CURSOR FOR 
	SELECT CustomerID 
	FROM Sales.Customer
 
-- Abrir Cursor
OPEN db_cursor
	FETCH NEXT FROM db_cursor INTO @Customer  
	WHILE @@FETCH_STATUS = 0  
	BEGIN  
	
		-- Obtener la suma totalidad de ordenes
		SET @Orders = (
			SELECT COUNT(SalesOrderID)
			FROM Sales.SalesOrderHeader
			WHERE CustomerID = @Customer
		)

		INSERT INTO #TEMP 
		VALUES (@Customer, @Orders)
 
	FETCH NEXT FROM db_cursor INTO @Customer
END 
CLOSE db_cursor  
DEALLOCATE db_cursor 


-- Consultar tabla temporal
SELECT * FROM #TEMP

-- Eliminar tabla temporal
DROP TABLE #TEMP