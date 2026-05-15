-- Validation queries

-- Validate staging row counts
USE CarSales_Staging;
SELECT 'StgSales' AS TableName, COUNT(*) FROM StgSales
UNION ALL
SELECT 'StgSalesperson', COUNT(*) FROM StgSalesperson
UNION ALL
SELECT 'StgCar', COUNT(*) FROM StgCar;

-- Validate DW dimension counts
USE CarSales_DW;
SELECT 'DimDate' AS TableName, COUNT(*) FROM DimDate
UNION ALL
SELECT 'DimCustomer', COUNT(*) FROM DimCustomer
UNION ALL
SELECT 'DimCar', COUNT(*) FROM DimCar
UNION ALL
SELECT 'DimSalesperson', COUNT(*) FROM DimSalesperson
UNION ALL
SELECT 'FacSales', COUNT(*) FROM FacSales;

-- Validate fact table joins correctly (no nulls in keys)
USE CarSales_DW;
SELECT TOP 10
    f.SalesID,
    d.FullDate,
    sp.SalespersonName,
    sp.Region,
    c.CarMake,
    c.CarModel,
    cu.CustomerName,
    f.SalesPrice,
    f.CommissionRate,
    f.CommissionEarned,
    f.accm_txn_create_time
FROM FacSales f
JOIN DimDate d ON f.DateSK = d.DateSK
JOIN DimSalesperson sp ON f.SalespersonSK = sp.SalespersonSK
JOIN DimCar c ON f.CarSK = c.CarSK
JOIN DimCustomer cu ON f.CustomerSK = cu.CustomerSK;

-- Validate SCD Type 2 is working
USE CarSales_DW;
SELECT SalespersonID, SalespersonName, Region, Experience, 
       StartDate, EndDate, IsCurrent
FROM DimSalesperson
ORDER BY SalespersonID;

-- Validate accumulating fact updates
USE CarSales_DW;
SELECT 
    SalesID,
    accm_txn_create_time,
    accm_txn_complete_time,
    txn_process_time_hours
FROM FacSales
WHERE accm_txn_complete_time IS NOT NULL
ORDER BY SalesID;

-- Validate if there are any null keys
USE CarSales_DW;
SELECT 
    SUM(CASE WHEN DateSK IS NULL THEN 1 ELSE 0 END) AS NullDateSK,
    SUM(CASE WHEN SalespersonSK IS NULL THEN 1 ELSE 0 END) AS NullSalespersonSK,
    SUM(CASE WHEN CarSK IS NULL THEN 1 ELSE 0 END) AS NullCarSK,
    SUM(CASE WHEN CustomerSK IS NULL THEN 1 ELSE 0 END) AS NullCustomerSK
FROM FacSales;

-- Validate no NULL foreign keys in fact table
USE CarSales_DW;
SELECT 
    SUM(CASE WHEN DateSK IS NULL THEN 1 ELSE 0 END) AS NullDateSK,
    SUM(CASE WHEN SalespersonSK IS NULL THEN 1 ELSE 0 END) AS NullSalespersonSK,
    SUM(CASE WHEN CarSK IS NULL THEN 1 ELSE 0 END) AS NullCarSK,
    SUM(CASE WHEN CustomerSK IS NULL THEN 1 ELSE 0 END) AS NullCustomerSK
FROM FacSales;