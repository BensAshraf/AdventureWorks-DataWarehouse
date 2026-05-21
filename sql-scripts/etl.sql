INSERT INTO SilverDB.dbo.CleanSales
SELECT
    SaleID,
    ProductName,
    Category,
    Quantity,
    UnitPrice,
    Quantity * UnitPrice AS TotalAmount,
    SaleDate,
    Region
FROM BronzeDB.dbo.RawSales;

INSERT INTO GoldDB.dbo.SalesSummary
SELECT
    Category,
    Region,
    SUM(TotalAmount) AS TotalRevenue,
    SUM(Quantity) AS TotalQuantity
FROM SilverDB.dbo.CleanSales
GROUP BY Category, Region;