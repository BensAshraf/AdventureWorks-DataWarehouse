USE BronzeDB;
GO

CREATE TABLE RawSales (
    SaleID INT,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE,
    Region NVARCHAR(50)
);

INSERT INTO RawSales VALUES
(1, 'Laptop', 'Electronics', 2, 1200, '2026-01-10', 'North'),
(2, 'Mouse', 'Electronics', 5, 25, '2026-01-12', 'South'),
(3, 'Keyboard', 'Electronics', 3, 45, '2026-01-15', 'East'),
(4, 'Phone', 'Electronics', 1, 800, '2026-01-20', 'West'),
(5, 'Monitor', 'Electronics', 2, 300, '2026-01-22', 'North');