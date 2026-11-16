# Problem 4 — Customer Order Behavior

**Level:** Advanced  
**Topics:** EXISTS + NOT EXISTS + Correlated Subqueries

## Problem Description

The company wants to identify customers who meet both conditions:

- Have placed at least one completed order containing a product from the `Electronics` category.
- Have never placed an order containing a product from the `Computers` category, regardless of order status.

## Expected Columns

| Column | Description |
|---|---|
| CustomerID | Customer identifier |
| CustomerName | Customer name |
| City | Customer city |
| CompletedElectronicsOrders | Number of qualifying completed electronics orders |

## Requirements

1. The first condition must be checked using `EXISTS`.
2. The second condition must be checked using `NOT EXISTS`.
3. The final count must count completed electronics orders, not individual products.
4. Sort results by the number of qualifying orders in descending order.

## Objective

Write a SQL query that identifies customers matching the specified order behavior.
