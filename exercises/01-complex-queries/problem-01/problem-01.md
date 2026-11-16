# Problem 1 — Customer Performance Analysis

**Level:** Intermediate  
**Topics:** Functions + GROUP BY + HAVING

## Problem Description

Management wants a report showing valuable customers.

For each customer who meets the conditions below, return:

## Expected Columns

| Column | Description |
|---|---|
| CustomerID | Customer identifier |
| CustomerName | Full name |
| ContactEmail | Email, or `'Not Provided'` if NULL |
| TotalOrders | Number of completed orders |
| TotalRevenue | Total amount spent |
| AverageOrderValue | Average value per order |
| FirstOrderDate | First completed order |
| LastOrderDate | Most recent completed order |
| DaysSinceLastOrder | Days since the last completed order |
| CustomerSegment | Customer classification |

## Requirements

1. Only consider completed orders.
2. Customers must have at least 2 completed orders.
3. Their total revenue must be at least 10,000.
4. Classify customers according to their total revenue:

   - Revenue greater than or equal to 20,000 → VIP.
   - Revenue greater than or equal to 12,000 → Regular.
   - Otherwise → Standard.

5. Round monetary values to two decimal places.
6. Sort results by total revenue in descending order.

## Objective

Write a SQL query that generates the requested customer performance report.
