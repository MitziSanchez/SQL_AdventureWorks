-- Calcular el promedio de precio de lista (ListPrice) por subcategoría

SELECT 
	ISNULL(PS.Name, 'Sin Subcategoría') AS Subcategory,	
	AVG(P.ListPrice) AS AvgListPrice
FROM Production.Product AS P
LEFT JOIN Production.ProductSubcategory AS PS
ON P.ProductSubcategoryID = PS.ProductSubcategoryID
GROUP BY ISNULL(PS.Name, 'Sin Subcategoría')
ORDER BY AvgListPrice DESC