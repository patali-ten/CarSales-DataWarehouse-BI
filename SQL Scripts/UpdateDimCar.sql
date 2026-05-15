USE [CarSales_DW]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimCar]    Script Date: 5/15/2026 8:20:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimCar]
    @CarID INT,
    @CarMake NVARCHAR(50),
    @CarModel NVARCHAR(50),
    @CarYear INT,
    @Category NVARCHAR(50)
AS
BEGIN
    IF NOT EXISTS (SELECT CarSK FROM DimCar WHERE CarID = @CarID)
    BEGIN
        INSERT INTO DimCar (CarID, CarMake, CarModel, CarYear, Category)
        VALUES (@CarID, @CarMake, @CarModel, @CarYear, @Category);
    END
    ELSE
    BEGIN
        UPDATE DimCar
        SET CarMake = @CarMake, CarModel = @CarModel,
            CarYear = @CarYear, Category = @Category
        WHERE CarID = @CarID;
    END;
END;
GO


