# Part 1 — Database Setup

We'll use a small e-commerce database.

## Why E-commerce?

Because it provides realistic relationships between customers, orders, and products, with enough data to practice:

- Aggregation
- Ranking
- Filtering
- Comparisons
- Joins
- Subqueries
- Common Table Expressions (CTEs)

## Database Schema

We'll work with five tables:

| Table | Purpose |
|---|---|
| Customers | Customer information |
| Categories | Product categories |
| Products | Product catalog |
| Orders | Customer orders and statuses |
| OrderItems | Products, quantities, and purchase prices |

## Relationships

- One customer can have multiple orders.
- One category can contain multiple products.
- One order can contain multiple products.
- One product can appear in multiple orders.

## Database Relationships Overview

- `Customers` → `Orders` (One-to-Many)
- `Categories` → `Products` (One-to-Many)
- `Orders` → `OrderItems` (One-to-Many)
- `Products` → `OrderItems` (One-to-Many)

The `OrderItems` table acts as a junction table between `Orders` and `Products`, implementing a Many-to-Many relationship.

Run the `setup.sql` complete script in SQL Server.

