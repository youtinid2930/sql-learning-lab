# Problem 01 — Notes

## What to Do

- Identify the grain of the data before performing aggregations.
- Calculate revenue at the order level before calculating customer statistics.
- Use `WHERE` to filter completed orders before aggregation.
- Use `GROUP BY` to aggregate data at the required level.
- Use `HAVING` to filter customers based on aggregate conditions.
- Use `COALESCE()` to handle NULL email addresses.
- Use `DATEDIFF()` to calculate the number of days since the last order.
- Use `CASE` to classify customers based on revenue.
- Use CTEs or derived tables to organize multi-level aggregations.

## What to Avoid

- Don't calculate average order value directly from order items.
- Don't forget that joining tables can multiply rows.
- Don't confuse order-item counts with order counts.
- Don't use `WHERE` to filter aggregate results.
- Don't use window functions when simple aggregation is sufficient.
- Don't use subqueries without understanding their relationship to the outer query.
- Don't aggregate data without checking what one row represents.

## Key Reminder

**Always understand the grain of your data before choosing an aggregation strategy.**