-- Listar productos vendidos junto con el nombre de la subcategoría y categoría (Product, ProductSubcategory, ProductCategory).

SELECT DISTINCT 
	P.ProductID,
	P.Name AS Product,
	ISNULL(C.Name, 'Sin Categoría') AS Category,
	ISNULL(SC.Name, 'Sin Subcategoría') AS Subcategory
FROM Sales.SalesOrderHeader AS OH
LEFT JOIN Sales.SalesOrderDetail AS OD
ON OH.SalesOrderID = OD.SalesOrderID
LEFT JOIN Production.Product AS P
ON OD.ProductID = P.ProductID
LEFT JOIN Production.ProductSubcategory AS SC
ON P.ProductSubcategoryID = SC.ProductSubcategoryID
LEFT JOIN Production.ProductCategory AS C
ON SC.ProductCategoryID = C.ProductCategoryID
ORDER BY P.ProductID ASC
