WITH ProductRankedPerCategory AS (
	SELECT
		C.CategoryName,
		P.ProductName,
		PS.TotalQuatitySold,
		PS.TotalRevune,
		RANK() OVER(PARTITION BY C.CategoryID ORDER BY PS.TotalRevune DESC) ProductRank
	FROM Products P
	INNER JOIN Categories C ON P.CategoryID = C.CategoryID
	INNER JOIN (
			SELECT
			OI.ProductID,
			SUM(OI.Quantity) TotalQuatitySold,
			SUM(OI.Quantity*OI.UnitPrice) TotalRevune
			FROM Orders O
			INNER JOIN OrderItems OI ON O.OrderID = OI.OrderID
			WHERE O.status = 'Completed'
			GROUP BY OI.ProductID
		) AS PS ON P.ProductID = PS.ProductID
)
SELECT
	*
FROM ProductRankedPerCategory
WHERE ProductRank = 1;