USE [CarSales_DW]
GO

/****** Object:  StoredProcedure [dbo].[UpdateDimSalesperson]    Script Date: 5/15/2026 8:20:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateDimSalesperson]
    @SalespersonID INT,
    @SalespersonName NVARCHAR(100),
    @Region NVARCHAR(50),
    @Experience NVARCHAR(50)
AS
BEGIN
    -- If no record exists at all, insert fresh
    IF NOT EXISTS (SELECT SalespersonSK FROM DimSalesperson 
                   WHERE SalespersonID = @SalespersonID)
    BEGIN
        INSERT INTO DimSalesperson 
            (SalespersonID, SalespersonName, Region, Experience, StartDate, EndDate, IsCurrent)
        VALUES 
            (@SalespersonID, @SalespersonName, @Region, @Experience, GETDATE(), NULL, 1);
    END
    ELSE
    BEGIN
        -- If current record exists but Region or Experience changed ? SCD Type 2
        IF EXISTS (
            SELECT SalespersonSK FROM DimSalesperson
            WHERE SalespersonID = @SalespersonID
              AND IsCurrent = 1
              AND (Region <> @Region OR Experience <> @Experience)
        )
        BEGIN
            -- Expire the old record
            UPDATE DimSalesperson
            SET EndDate = GETDATE(), IsCurrent = 0
            WHERE SalespersonID = @SalespersonID AND IsCurrent = 1;

            -- Insert new version
            INSERT INTO DimSalesperson
                (SalespersonID, SalespersonName, Region, Experience, StartDate, EndDate, IsCurrent)
            VALUES
                (@SalespersonID, @SalespersonName, @Region, @Experience, GETDATE(), NULL, 1);
        END
        ELSE
        BEGIN
            -- No change in tracked attributes, just update name (SCD Type 1 for name)
            UPDATE DimSalesperson
            SET SalespersonName = @SalespersonName
            WHERE SalespersonID = @SalespersonID AND IsCurrent = 1;
        END;
    END;
END;
GO


