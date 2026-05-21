USE SilverDB;
GO

CREATE TABLE CleanSales (
    SaleID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalAmount DECIMAL(10,2),
    SaleDate DATE,
    Region NVARCHAR(50)
);