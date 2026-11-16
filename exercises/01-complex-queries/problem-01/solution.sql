WITH CustomerStatiscs AS (
	SELECT
		CustomerID,
		COUNT(OrderID) AS TotalOrder,
		SUM(OrderRevenue) AS TotalRevenue,
		AVG(OrderRevenue) AS AverageOrderValue,
		MIN(OrderDate) AS FirstOrderDate,
		MAX(OrderDate) AS LastOrderDate
	FROM (
		-- Order level
		SELECT
			O.orderID,
			O.CustomerID,
			O.OrderDate,
			SUM(OI.Quantity * OI.UnitPrice) AS OrderRevenue
		FROM Orders O
		INNER JOIN OrderItems OI ON O.OrderID = OI.OrderID
		WHERE O.Status = 'Completed'
		GROUP BY O.orderID, O.CustomerID, O.OrderDate) AS OrderTotals
	GROUP BY CustomerID
	HAVING COUNT(OrderID) >= 2 AND SUM(OrderRevenue) >= 10000
)
SELECT
	C.CustomerID,
	C.FullName AS CustomerName,
	COALESCE(C.Email, 'Not Provided') AS ContactEmail,
	CS.TotalRevenue,
	ROUND(CS.TotalRevenue, 2) AS TotalRevenue,
	ROUND(CS.AverageOrderValue, 2) AS AverageOrderValue,
	CS.FirstOrderDate,
	CS.LastOrderDate,
	DATEDIFF(DAY, CS.LastOrderDate, GETDATE()) AS DaysSiceLastOrder,
	CASE 
		WHEN CS.TotalRevenue >= 20000 THEN 'VIP'
		WHEN CS.TotalRevenue >= 12000 THEN 'Regular'
		ELSE 'Standard'
	END AS CustomerSegement
FROM Customers C
INNER JOIN CustomerStatiscs CS ON C.CustomerID = CS.CustomerID
ORDER BY CS.TotalRevenue DESC;
