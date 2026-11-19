# Problem 04 — Customer Order Behavior

## What to Do

- Use `EXISTS` to check whether a related record exists.
- Correlate subqueries with the outer query using `CustomerID`.
- Use `NOT EXISTS` to exclude customers with matching records.
- Apply status filters only when required by the business condition.
- Use `COUNT(DISTINCT OrderID)` when counting orders after joining order items.
- Use `INNER JOIN` when the CTE already guarantees the required condition.
- Use `LEFT JOIN` + `COALESCE` when customers without matching records must remain in the result.

## What to Avoid

- Don't forget to correlate subqueries with the outer customer.
- Don't use `OR` when both conditions must be satisfied.
- Don't filter Computers orders by status when all statuses must be considered.
- Don't count order-item rows when the requirement asks for orders.
- Don't repeat an existence check already guaranteed by an inner join.

## Key Reminder

**EXISTS checks whether matching rows exist; NOT EXISTS checks whether none exist.**