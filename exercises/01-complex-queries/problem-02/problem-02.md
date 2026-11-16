# Problem 2 — Products Above Their Category Average

**Level:** Intermediate → Advanced  
**Topics:** Subqueries + Functions

## Problem Description

The management team wants to identify expensive products relative to their own category.

For every product whose price is higher than the average price of products in its category, return:

## Expected Columns

| Column | Description |
|---|---|
| ProductID | Product identifier |
| ProductName | Product name |
| CategoryName | Category |
| UnitPrice | Product price |
| CategoryAveragePrice | Average price in its category |
| PriceDifference | Difference from category average |
| PricePosition | Classification |

## Classification

Classify products according to their price difference from their category average:

- Difference greater than 2,000 → `Significantly Above Average`.
- Difference greater than 500 → `Above Average`.
- Otherwise → `Slightly Above Average`.

## Requirements

1. Compare each product with its own category, not the overall average.
2. Return only products whose price is strictly greater than the category average.
3. Sort results by category and then price difference in descending order.

## Objective

Write a SQL query that identifies products priced above their respective category averages.