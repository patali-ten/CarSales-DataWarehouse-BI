USE [CarSales_DW]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimCustomer]    Script Date: 5/15/2026 8:20:18 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimCustomer]
    @CustomerName NVARCHAR(100)
AS
BEGIN
    IF NOT EXISTS (SELECT CustomerSK FROM DimCustomer WHERE CustomerName = @CustomerName)
    BEGIN
        INSERT INTO DimCustomer (CustomerName) VALUES (@CustomerName);
    END;
END;
GO


