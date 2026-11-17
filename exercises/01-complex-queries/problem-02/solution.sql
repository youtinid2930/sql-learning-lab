
SELECT 
	P.ProductID,
	P.productName,
	C.CategoryName,
	P.UnitPrice,
	ROUND(CA.CategoryAveragePrice, 2) AS CategoryAveragePrice,
	ROUND(P.UnitPrice - CA.CategoryAveragePrice, 2) AS PriceDifference,
	CASE 
		WHEN P.UnitPrice - CA.CategoryAveragePrice > 2000 THEN 'Significantly Above Average'
		WHEN P.UnitPrice - CA.CategoryAveragePrice > 500 THEN 'Above Average'
		ELSE 'Slightly Above Average'
	END AS PricePosition
FROM Products P
INNER JOIN Categories C ON C.CategoryID = P.CategoryID
INNER JOIN(
		SELECT CategoryID, AVG(UnitPrice) CategoryAveragePrice
		FROM Products
		GROUP BY CategoryID
	    ) AS CA ON CA.CategoryID = P.CategoryID
WHERE P.UnitPrice > CA.CategoryAveragePrice
ORDER BY C.CategoryID ,PriceDifference  DESC;
