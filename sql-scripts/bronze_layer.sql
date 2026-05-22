USE AdventureWorksDW;
GO

--------------------------------------------------
-- BRONZE SALES
--------------------------------------------------

SELECT
    soh.SalesOrderID,
    soh.OrderDate,
    sod.ProductID,
    soh.CustomerID,
    sod.OrderQty,
    sod.UnitPrice,
    (sod.OrderQty * sod.UnitPrice) AS TotalRevenue
INTO Bronze.RawSales
FROM AdventureWorks.Sales.SalesOrderHeader soh
JOIN AdventureWorks.Sales.SalesOrderDetail sod
    ON soh.SalesOrderID = sod.SalesOrderID;
GO


SELECT TOP 10 *
FROM Bronze.RawSales;