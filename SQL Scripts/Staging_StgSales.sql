USE [CarSales_Staging]
GO

/****** Object:  Table [dbo].[StgSales]    Script Date: 5/15/2026 8:13:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StgSales](
	[SaleID] [int] NULL,
	[SaleDate] [date] NULL,
	[SalespersonID] [int] NULL,
	[CustomerName] [nvarchar](100) NULL,
	[CarID] [int] NULL,
	[SalePrice] [decimal](10, 2) NULL,
	[CommissionRate] [float] NULL,
	[CommissionEarned] [float] NULL
) ON [PRIMARY]
GO


