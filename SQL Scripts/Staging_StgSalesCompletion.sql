USE [CarSales_Staging]
GO

/****** Object:  Table [dbo].[StgSalesCompletion]    Script Date: 5/15/2026 8:14:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StgSalesCompletion](
	[SaleID] [int] NULL,
	[accm_txn_complete_time] [datetime] NULL
) ON [PRIMARY]
GO


