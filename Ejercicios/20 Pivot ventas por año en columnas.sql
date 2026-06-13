-- Mostrar ventas de cada año en formato columnas

-- Valores en filas
SELECT 
	YEAR(OrderDate) AS anio,
	SUM(TotalDue) AS sales
FROM Sales.SalesOrderHeader 
GROUP BY YEAR(OrderDate)
ORDER BY anio

-- Pivot
SELECT [2011], [2012], [2013], [2014]
FROM 
(
    -- Consulta base
    SELECT YEAR(OrderDate) AS anio, TotalDue
    FROM Sales.SalesOrderHeader
) AS Origen
PIVOT
(
    -- 2. Operación PIVOT: Agregamos el valor numérico y definimos qué columna rota
    SUM(TotalDue) -- Función de agregación
    FOR anio     -- Columna que se convertirá en los nuevos encabezados de columna
    IN ([2011], [2012], [2013], [2014]) -- Lista de valores únicos que serán columnas
) AS TablaPivote;