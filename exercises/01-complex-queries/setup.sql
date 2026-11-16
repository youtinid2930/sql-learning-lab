
/* =====================================================
   SQL COMPLEX PRACTICE #01
   Database: SQL Server
   ===================================================== */

-- 1. Create database
IF DB_ID('SQLComplexPractice01') IS NULL
    CREATE DATABASE SQLComplexPractice01;
GO

USE SQLComplexPractice01;
GO

-- 2. Drop existing tables (safe to rerun this setup)
DROP TABLE IF EXISTS dbo.OrderItems;
DROP TABLE IF EXISTS dbo.Orders;
DROP TABLE IF EXISTS dbo.Products;
DROP TABLE IF EXISTS dbo.Categories;
DROP TABLE IF EXISTS dbo.Customers;
GO

-- 3. Create tables

CREATE TABLE dbo.Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(150),
    City VARCHAR(80),
    RegistrationDate DATE NOT NULL
);

CREATE TABLE dbo.Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(80) NOT NULL
);

CREATE TABLE dbo.Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,

    CONSTRAINT FK_Products_Categories
        FOREIGN KEY (CategoryID)
        REFERENCES dbo.Categories(CategoryID)
);

CREATE TABLE dbo.Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Status VARCHAR(20) NOT NULL,

    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustomerID)
        REFERENCES dbo.Customers(CustomerID),

    CONSTRAINT CK_Orders_Status
        CHECK (Status IN ('Completed', 'Pending', 'Cancelled'))
);

CREATE TABLE dbo.OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_OrderItems_Orders
        FOREIGN KEY (OrderID)
        REFERENCES dbo.Orders(OrderID),

    CONSTRAINT FK_OrderItems_Products
        FOREIGN KEY (ProductID)
        REFERENCES dbo.Products(ProductID),

    CONSTRAINT CK_OrderItems_Quantity
        CHECK (Quantity > 0)
);
GO

-- 4. Insert customers

INSERT INTO dbo.Customers
(CustomerID, FullName, Email, City, RegistrationDate)
VALUES
(1, 'Ahmed Benali', 'ahmed@email.com', 'Agadir', '2024-01-15'),
(2, 'Sara Alaoui', 'sara@email.com', 'Casablanca', '2024-02-10'),
(3, 'Youssef Karim', NULL, 'Rabat', '2024-03-20'),
(4, 'Fatima Zahra', 'fatima@email.com', 'Agadir', '2024-04-05'),
(5, 'Omar Haddad', 'omar@email.com', 'Marrakech', '2024-05-12'),
(6, 'Salma Idrissi', NULL, 'Fes', '2024-06-18'),
(7, 'Mehdi Amrani', 'mehdi@email.com', 'Tangier', '2024-07-22'),
(8, 'Nadia Mansouri', 'nadia@email.com', 'Rabat', '2024-08-30');

-- 5. Insert categories

INSERT INTO dbo.Categories
(CategoryID, CategoryName)
VALUES
(1, 'Electronics'),
(2, 'Computers'),
(3, 'Accessories'),
(4, 'Home');

-- 6. Insert products

INSERT INTO dbo.Products
(ProductID, ProductName, CategoryID, UnitPrice, Stock)
VALUES
(1, 'Smartphone', 1, 4500, 20),
(2, 'Tablet', 1, 3200, 15),
(3, 'Smart TV', 1, 6500, 10),
(4, 'Laptop', 2, 8500, 12),
(5, 'Desktop PC', 2, 7200, 8),
(6, 'Keyboard', 3, 250, 100),
(7, 'Mouse', 3, 150, 120),
(8, 'Headphones', 3, 600, 50),
(9, 'Refrigerator', 4, 5500, 7),
(10, 'Microwave', 4, 1200, 18);

-- 7. Insert orders

INSERT INTO dbo.Orders
(OrderID, CustomerID, OrderDate, Status)
VALUES
(101, 1, '2025-01-10', 'Completed'),
(102, 1, '2025-02-15', 'Completed'),
(103, 1, '2025-03-20', 'Completed'),
(104, 2, '2025-01-18', 'Completed'),
(105, 2, '2025-02-22', 'Cancelled'),
(106, 2, '2025-03-12', 'Completed'),
(107, 3, '2025-01-25', 'Pending'),
(108, 3, '2025-03-05', 'Cancelled'),
(109, 4, '2025-02-01', 'Completed'),
(110, 4, '2025-02-25', 'Completed'),
(111, 4, '2025-03-15', 'Completed'),
(112, 5, '2025-01-08', 'Completed'),
(113, 5, '2025-02-08', 'Completed'),
(114, 6, '2025-01-30', 'Cancelled'),
(115, 6, '2025-02-28', 'Pending'),
(116, 7, '2025-03-10', 'Completed'),
(117, 7, '2025-03-25', 'Completed');

-- Customer 8 intentionally has no orders.

-- 8. Insert order items

INSERT INTO dbo.OrderItems
(OrderItemID, OrderID, ProductID, Quantity, UnitPrice)
VALUES
-- Order 101
(1, 101, 1, 1, 4500),
(2, 101, 6, 2, 250),

-- Order 102
(3, 102, 4, 1, 8500),
(4, 102, 7, 2, 150),

-- Order 103
(5, 103, 3, 1, 6500),
(6, 103, 8, 2, 600),

-- Order 104
(7, 104, 2, 1, 3200),
(8, 104, 6, 1, 250),

-- Order 105 (Cancelled)
(9, 105, 4, 1, 8500),

-- Order 106
(10, 106, 1, 2, 4500),
(11, 106, 7, 3, 150),

-- Order 107 (Pending)
(12, 107, 5, 1, 7200),

-- Order 108 (Cancelled)
(13, 108, 9, 1, 5500),

-- Order 109
(14, 109, 10, 2, 1200),
(15, 109, 8, 1, 600),

-- Order 110
(16, 110, 4, 1, 8500),
(17, 110, 6, 3, 250),

-- Order 111
(18, 111, 3, 1, 6500),
(19, 111, 2, 1, 3200),

-- Order 112
(20, 112, 9, 1, 5500),
(21, 112, 10, 1, 1200),

-- Order 113
(22, 113, 5, 1, 7200),
(23, 113, 8, 2, 600),

-- Order 114 (Cancelled)
(24, 114, 1, 1, 4500),

-- Order 115 (Pending)
(25, 115, 3, 1, 6500),

-- Order 116
(26, 116, 4, 1, 8500),
(27, 116, 7, 2, 150),

-- Order 117
(28, 117, 1, 1, 4500),
(29, 117, 8, 1, 600);
GO

-- 9. Verify data

SELECT * FROM dbo.Customers;
SELECT * FROM dbo.Categories;
SELECT * FROM dbo.Products;
SELECT * FROM dbo.Orders;
SELECT * FROM dbo.OrderItems;
GO
