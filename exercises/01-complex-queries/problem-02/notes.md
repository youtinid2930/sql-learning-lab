# Problem 02 — Notes

## What to Do

- Calculate the average price for each category using `GROUP BY`.
- Compare each product with the average of its own category.
- Use a derived table to make category averages available for comparison.
- Join using `CategoryID`.
- Use `WHERE` to keep products strictly above their category average.
- Use `CASE` to classify products based on their price difference.
- Use unrounded values for classification.
- Use `ROUND()` for displaying monetary values.
- Sort by category, then price difference in descending order.

## What to Avoid

- Don't compare products with the overall average price.
- Don't aggregate at the product level when each product has only one row.
- Don't repeat aggregations that don't change the result.
- Don't round values before applying classification thresholds.
- Don't confuse current product prices with historical order-item prices.

## Key Reminder

**Calculate the average at the same level as the comparison: one average per category.**