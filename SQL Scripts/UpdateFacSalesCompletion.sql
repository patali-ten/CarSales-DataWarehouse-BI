USE [CarSales_DW]
GO

/****** Object:  StoredProcedure [dbo].[UpdateFacSalesCompletion]    Script Date: 5/15/2026 8:21:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateFacSalesCompletion]
    @SaleID INT,
    @accm_txn_complete_time DATETIME
AS
BEGIN
    IF EXISTS (SELECT SalesID FROM FacSales WHERE SalesID = @SaleID)
    BEGIN
        UPDATE FacSales
        SET 
            accm_txn_complete_time = @accm_txn_complete_time,
            txn_process_time_hours = DATEDIFF(MINUTE, accm_txn_create_time, @accm_txn_complete_time) / 60.0
        WHERE SalesID = @SaleID;
    END;
    -- If SaleID not found, do nothing (handles missing txn ids gracefully)
END;
GO


