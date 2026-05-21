USE GoldDB;
GO

CREATE TABLE SalesSummary (
    Category NVARCHAR(50),
    Region NVARCHAR(50),
    TotalRevenue DECIMAL(10,2),
    TotalQuantity INT
);