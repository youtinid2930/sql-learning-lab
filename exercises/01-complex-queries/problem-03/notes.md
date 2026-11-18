# Problem 03 — Best-Selling Product in Each Category

## What to Do

- Filter completed orders before aggregation.
- Calculate total quantity and revenue per product.
- Use `SUM(Quantity * UnitPrice)` to calculate revenue.
- Use `RANK()` to rank products within each category.
- Use `PARTITION BY CategoryID` for independent category rankings.
- Use `ORDER BY TotalRevenue DESC` to rank highest revenue first.
- Use a CTE or derived table to filter window-function results.
- Filter with `WHERE ProductRank = 1` to return the best-selling products.
- Use `RANK()` to preserve ties.

## What to Avoid

- Don't include pending or cancelled orders.
- Don't aggregate revenue at the category level.
- Don't forget `DESC` when ranking highest revenue first.
- Don't use `ROW_NUMBER()` when ties must be preserved.
- Don't filter window-function results in the same query-level `WHERE` clause.

## Key Reminder

**Aggregate first, rank second, filter last.**