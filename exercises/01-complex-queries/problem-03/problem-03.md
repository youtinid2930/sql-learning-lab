# Problem 3 — Best-Selling Product in Each Category

**Level:** Advanced  
**Topics:** Aggregation + Window Ranking

## Problem Description

The company wants to identify its best-selling products in every category.

Calculate total revenue per product using completed orders only.

Then return the product or products with the highest revenue in each category.

## Expected Columns

| Column | Description |
|---|---|
| CategoryName | Category |
| ProductName | Product |
| TotalQuantitySold | Total quantity sold |
| TotalRevenue | Revenue generated |
| ProductRank | Position within its category |

## Requirements

1. Exclude pending and cancelled orders.
2. Calculate revenue using `Quantity * UnitPrice`.
3. Rank products independently within each category.
4. If two products have the same revenue, they must receive the same rank.
5. Return only the first-ranked products.

## Objective

Write a SQL query that identifies the best-selling product or products in each category based on total revenue.
