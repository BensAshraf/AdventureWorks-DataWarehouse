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


------
--FIX ISSUE
---------

USE AdventureWorksDW;
GO

DROP TABLE Gold.DimCustomer;
GO
USE AdventureWorksDW;
GO

CREATE TABLE Gold.DimCustomer (

    CustomerKey INT PRIMARY KEY IDENTITY(1,1),

    CustomerID INT,

    CustomerName VARCHAR(200)

);

GO
USE AdventureWorksDW;
GO

INSERT INTO Gold.DimCustomer (

    CustomerID,
    CustomerName

)

SELECT

    c.CustomerID,

    CASE

        WHEN p.FirstName IS NOT NULL
        THEN p.FirstName + ' ' + p.LastName

        ELSE 'Store Customer'

    END AS CustomerName

FROM AdventureWorks2022.Sales.Customer c

LEFT JOIN AdventureWorks2022.Person.Person p
ON c.PersonID = p.BusinessEntityID;

GO

SELECT TOP 20 *
FROM Gold.DimCustomer;

-- =========================================
-- SCD TYPE 2 - CUSTOMER DIMENSION
-- =========================================

-- Ajouter colonnes SCD2

ALTER TABLE Gold.DimCustomer
ADD
    StartDate DATE,
    EndDate DATE,
    IsCurrent BIT;

-- Initialisation

UPDATE Gold.DimCustomer
SET
    StartDate = GETDATE(),
    EndDate = NULL,
    IsCurrent = 1;

-- Désactiver ancienne version

UPDATE Gold.DimCustomer
SET
    EndDate = GETDATE(),
    IsCurrent = 0
WHERE CustomerKey = 1;

-- Ajouter nouvelle version

INSERT INTO Gold.DimCustomer
(
    CustomerID,
    CustomerName,
    StartDate,
    EndDate,
    IsCurrent
)
VALUES
(
    11000,
    'Aaron Allen Updated',
    GETDATE(),
    NULL,
    1
);

-- =========================================
-- OPTIMISATION DATA WAREHOUSE
-- =========================================

-- INDEXES

CREATE INDEX IDX_FactSales_CustomerID
ON Gold.FactSales(CustomerID);

CREATE INDEX IDX_FactSales_ProductID
ON Gold.FactSales(ProductID);

CREATE INDEX IDX_FactSales_OrderDate
ON Gold.FactSales(OrderDate);

GO

-- VIEW POUR ANALYSE

CREATE VIEW Gold.vSalesSummary AS
SELECT
    ProductID,
    CustomerID,
    SUM(TotalRevenue) AS TotalRevenue,
    SUM(OrderQty) AS TotalQuantity
FROM Gold.FactSales
GROUP BY ProductID, CustomerID;

GO

-- STORED PROCEDURE

CREATE PROCEDURE Gold.GetTopCustomers
AS
BEGIN
    SELECT TOP 10
        CustomerID,
        SUM(TotalRevenue) AS Revenue
    FROM Gold.FactSales
    GROUP BY CustomerID
    ORDER BY Revenue DESC;
END;

GO