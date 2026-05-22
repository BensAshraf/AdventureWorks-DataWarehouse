USE AdventureWorksDW;
GO

-------------------------------------------------
-- BRONZE SALES
-------------------------------------------------

SELECT
    soh.SalesOrderID,
    soh.OrderDate,
    soh.CustomerID,
    sod.ProductID,
    sod.OrderQty,
    sod.UnitPrice,
    (sod.OrderQty * sod.UnitPrice) AS TotalRevenue

INTO Bronze.RawSales

FROM AdventureWorks2022.Sales.SalesOrderHeader soh

INNER JOIN AdventureWorks2022.Sales.SalesOrderDetail sod
ON soh.SalesOrderID = sod.SalesOrderID;

GO

-------------------------------------------------
-- CHECK DATA
-------------------------------------------------

SELECT TOP 10 *
FROM Bronze.RawSales;