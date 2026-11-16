# Problem 5 — Monthly Revenue Evolution

**Level:** Advanced  
**Topics:** Window Functions + CTE + Subquery

## Problem Description

Management wants to understand how each customer's monthly spending evolves.

For every customer with at least two months containing completed orders, calculate monthly revenue and return:

## Expected Columns

| Column | Description |
|---|---|
| CustomerID | Customer identifier |
| CustomerName | Customer name |
| SalesMonth | Year and month |
| MonthlyRevenue | Revenue during that month |
| PreviousMonthRevenue | Revenue in the previous recorded sales month |
| RevenueDifference | Difference from previous month |
| RunningTotal | Cumulative revenue |
| RevenueTrend | Increasing or Decreasing |

## Requirements

1. Consider completed orders only.
2. Group revenue by customer and calendar month.
3. Retrieve the previous month's recorded revenue.
4. Calculate the difference between current and previous revenue.
5. Calculate cumulative revenue for each customer.
6. Classify the revenue trend:
   - Difference greater than zero → `Increasing`.
   - Difference less than zero → `Decreasing`.
   - Difference equal to zero → `Stable`.
7. Return only months where revenue increased compared with the previous recorded sales month.
8. Sort results by customer and month.

## Objective

Write a SQL query that analyzes the monthly revenue evolution of each customer.