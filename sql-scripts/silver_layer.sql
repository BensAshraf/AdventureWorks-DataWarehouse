USE AdventureWorksDW;
GO

--------------------------------------------------
-- SILVER CLEAN SALES
--------------------------------------------------

SELECT
    SalesOrderID,
    OrderDate,
    ProductID,
    CustomerID,

    ISNULL(OrderQty, 0) AS OrderQty,

    ISNULL(UnitPrice, 0) AS UnitPrice,

    ISNULL(TotalRevenue, 0) AS TotalRevenue

INTO Silver.CleanSales
FROM Bronze.RawSales
WHERE ProductID IS NOT NULL;
GO

SELECT TOP 10 *
FROM Silver.CleanSales;