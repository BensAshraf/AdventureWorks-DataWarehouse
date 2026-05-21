USE AdventureWorksDW;
GO

--------------------------------------------------
-- DIM DATE
--------------------------------------------------

CREATE TABLE Gold.DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Year INT,
    Quarter INT,
    Month INT,
    MonthName VARCHAR(20)
);

--------------------------------------------------
-- DIM PRODUCT
--------------------------------------------------

CREATE TABLE Gold.DimProduct (
    ProductKey INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2)
);

--------------------------------------------------
-- DIM CUSTOMER
--------------------------------------------------

CREATE TABLE Gold.DimCustomer (
    CustomerKey INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Region VARCHAR(50)
);

--------------------------------------------------
-- DIM REGION
--------------------------------------------------

CREATE TABLE Gold.DimRegion (
    RegionKey INT PRIMARY KEY IDENTITY(1,1),
    RegionName VARCHAR(50)
);

--------------------------------------------------
-- FACT SALES
--------------------------------------------------

CREATE TABLE Gold.FactSales (
    SalesKey INT PRIMARY KEY IDENTITY(1,1),

    DateKey INT,
    ProductKey INT,
    CustomerKey INT,
    RegionKey INT,

    Quantity INT,
    UnitPrice DECIMAL(10,2),
    TotalRevenue DECIMAL(10,2),

    FOREIGN KEY (DateKey)
        REFERENCES Gold.DimDate(DateKey),

    FOREIGN KEY (ProductKey)
        REFERENCES Gold.DimProduct(ProductKey),

    FOREIGN KEY (CustomerKey)
        REFERENCES Gold.DimCustomer(CustomerKey),

    FOREIGN KEY (RegionKey)
        REFERENCES Gold.DimRegion(RegionKey)
);
GO