USE AdventureWorksDW;
GO

-------------------------------------------------
-- DIM PRODUCT
-------------------------------------------------

CREATE TABLE Gold.DimProduct (

    ProductKey INT PRIMARY KEY IDENTITY(1,1),

    ProductID INT,

    ProductName VARCHAR(200),

    ProductNumber VARCHAR(50),

    Category VARCHAR(50),

    Color VARCHAR(30),

    ListPrice MONEY

);

-------------------------------------------------
-- DIM CUSTOMER
-------------------------------------------------

CREATE TABLE Gold.DimCustomer (

    CustomerKey INT PRIMARY KEY IDENTITY(1,1),

    CustomerID INT,

    FirstName VARCHAR(100),

    LastName VARCHAR(100)

);

-------------------------------------------------
-- DIM DATE
-------------------------------------------------

CREATE TABLE Gold.DimDate (

    DateKey INT PRIMARY KEY IDENTITY(1,1),

    FullDate DATE,

    Year INT,

    Month INT,

    Day INT

);

-------------------------------------------------
-- FACT SALES
-------------------------------------------------

CREATE TABLE Gold.FactSales (

    SalesKey INT PRIMARY KEY IDENTITY(1,1),

    OrderDate DATE,

    ProductID INT,

    CustomerID INT,

    OrderQty INT,

    UnitPrice MONEY,

    TotalRevenue MONEY

);

GO

-- OPTIMIZATION INDEXES
CREATE INDEX IX_FactSales_OrderDate
ON Gold.FactSales(OrderDate);

CREATE INDEX IX_FactSales_ProductID
ON Gold.FactSales(ProductID);

CREATE INDEX IX_FactSales_CustomerID
ON Gold.FactSales(CustomerID);