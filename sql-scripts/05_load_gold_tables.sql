USE AdventureWorksDW;
GO

INSERT INTO Gold.DimDate (

    FullDate,
    Year,
    Month,
    Day

)

SELECT DISTINCT

    CAST(OrderDate AS DATE),

    YEAR(OrderDate),

    MONTH(OrderDate),

    DAY(OrderDate)

FROM Silver.CleanSales;

GO

SELECT TOP 10 *
FROM Gold.DimDate;

USE AdventureWorksDW;
GO

INSERT INTO Gold.FactSales (

    OrderDate,
    ProductID,
    CustomerID,
    OrderQty,
    UnitPrice,
    TotalRevenue

)

SELECT

    OrderDate,
    ProductID,
    CustomerID,
    OrderQty,
    UnitPrice,
    TotalRevenue

FROM Silver.CleanSales;

GO

SELECT TOP 10 *
FROM Gold.FactSales;



SELECT COUNT(*) FROM Gold.DimProduct;

SELECT COUNT(*) FROM Gold.DimCustomer;

SELECT COUNT(*) FROM Gold.DimDate;

SELECT COUNT(*) FROM Gold.FactSales;