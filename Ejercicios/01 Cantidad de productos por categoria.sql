-- Listar el número total de productos por categoría

SELECT 
	ISNULL(C.Name, 'Sin categoría') AS Category,
	COUNT(P.ProductID) AS Cant_Product
FROM Production.Product AS P
LEFT JOIN Production.ProductSubcategory AS SC
ON P.ProductSubcategoryID = SC.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS C
ON SC.ProductCategoryID = C.ProductCategoryID
GROUP BY ISNULL(C.Name, 'Sin categoría')
ORDER BY Cant_Product DESC