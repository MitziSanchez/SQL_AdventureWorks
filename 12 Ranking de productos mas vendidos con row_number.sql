-- Calcular el ranking de productos más vendidos usando ROW_NUMBER()

SELECT 
	ProductID,
	SUM(OrderQty) AS Qty,
	ROW_NUMBER() OVER(ORDER BY SUM(OrderQty) DESC) AS Ranking
FROM Sales.SalesOrderDetail
GROUP BY ProductId
