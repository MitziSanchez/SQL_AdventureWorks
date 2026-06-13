-- Mostrar cuantos productos hay por subcategoria y distribuirlos por color (mostrar en columnas)

-- Resultado en filas
SELECT 
	ISNULL(SC.Name, 'No Category') AS Subcategoria,
	ISNULL(P.Color, 'No color') AS Color,
	COUNT(P.ProductID) AS Qty
FROM Production.Product AS P
LEFT JOIN Production.ProductSubcategory AS SC
ON P.ProductSubcategoryID = SC.ProductSubcategoryID
GROUP BY ISNULL(SC.Name, 'No Category'), ISNULL(P.Color, 'No color')
ORDER BY Subcategoria

-- Pivot
SELECT 
	Subcategoria, 
	[No Color], 
	[Multi], 
	[Black], 
	[Blue], 
	[Grey], 
	[Red], 
	[Silver], 
	[Silver/Black], 
	[White], 
	[Yellow] 
FROM (
	SELECT 
		ISNULL(SC.Name, 'No Category') AS Subcategoria,
		ISNULL(P.Color, 'No color') AS Color,
		P.ProductID	
	FROM Production.Product AS P
	LEFT JOIN Production.ProductSubcategory AS SC
	ON P.ProductSubcategoryID = SC.ProductSubcategoryID
) AS ORIGEN
PIVOT(
	COUNT(ProductID)
	FOR Color
	IN (
		[No Color], 
		[Multi], 
		[Black], 
		[Blue], 
		[Grey], 
		[Red], 
		[Silver], 
		[Silver/Black], 
		[White], 
		[Yellow] )
) AS PIVOTE_TABLE
ORDER BY Subcategoria
