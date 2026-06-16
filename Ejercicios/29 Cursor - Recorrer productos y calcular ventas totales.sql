-- Declara un cursor que recorra los ProductID de la tabla Production.Product.
-- Por cada producto, calcula la suma de ventas (SUM(LineTotal)) en Sales.SalesOrderDetail.
-- Inserta los resultados en una tabla temporal con las columnas: ProductID, ProductName, TotalSales
-- Al finalizar, consulta la tabla temporal para mostrar los productos ordenados por ventas de mayor a menor.


-- Tabla de destino
CREATE TABLE #TEMP (
	ProductID INT,
	ProductName NVARCHAR(50),
	TotalSales MONEY
)

-- Variable
DECLARE @Product AS INT
DECLARE @NameP AS NVARCHAR(50)
DECLARE @TotalS AS MONEY

-- Cursor
DECLARE p_cursor CURSOR FOR
	SELECT 
		ProductID,
		Name
	FROM Production.Product

OPEN p_cursor
	FETCH NEXT FROM p_cursor INTO @Product, @NameP
	WHILE @@FETCH_STATUS = 0  
	BEGIN  

		SET @TotalS = (
			SELECT ISNULL(SUM(LineTotal),0)
			FROM Sales.SalesOrderDetail
			WHERE ProductID = @Product
		)

		INSERT INTO #TEMP VALUES (@Product, @NameP, @TotalS)

	
	FETCH NEXT FROM p_cursor INTO @Product, @NameP
END
CLOSE p_cursor
DEALLOCATE p_cursor


-- Consultar datos
SELECT * FROM #TEMP
ORDER BY TotalSales DESC

DROP TABLE #TEMP