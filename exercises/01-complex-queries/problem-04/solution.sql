WITH CompletedOrderWithElectronics AS (
	SELECT
	    O.CustomerID,
		COUNT(DISTINCT O.OrderID) CompletedElectronicsOrders
	FROM Orders O
	INNER JOIN OrderItems OI ON OI.OrderID = O.OrderID
	INNER JOIN Products P ON P.ProductID = OI.ProductID
	INNER JOIN Categories C ON P.CategoryID = C.CategoryID
	WHERE O.Status = 'Completed' AND C.CategoryName = 'Electronics'
	GROUP BY O.CustomerID
)
SELECT
	C.CustomerID,
	C.FullName CustomerName,
	C.City,
	COALESCE(COE.CompletedElectronicsOrders, 0) CompletedElectronicsOrders
FROM Customers C
LEFT JOIN CompletedOrderWithElectronics  COE ON COE.CustomerID = C.CustomerID
WHERE EXISTS (
	SELECT 1
	FROM Orders O
	INNER JOIN OrderItems OI ON O.OrderID = OI.OrderID
	INNER JOIN Products P ON P.ProductID = OI.ProductID
	INNER JOIN Categories Ct ON P.CategoryID = Ct.CategoryID
	WHERE Ct.CategoryName = 'Electronics' AND O.Status = 'Completed' AND O.CustomerID = C.CustomerID)
AND NOT EXISTS (
	SELECT 1
	FROM Orders O
	INNER JOIN OrderItems OI ON O.OrderID = OI.OrderID
	INNER JOIN Products P ON P.ProductID = OI.ProductID
	INNER JOIN Categories Ct ON P.CategoryID = Ct.CategoryID
	WHERE Ct.CategoryName = 'Computers' AND O.CustomerID = C.CustomerID
)
ORDER BY CompletedElectronicsOrders DESC;
