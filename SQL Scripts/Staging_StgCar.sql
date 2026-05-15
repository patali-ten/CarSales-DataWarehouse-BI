USE [CarSales_Staging]
GO

/****** Object:  Table [dbo].[StgCar]    Script Date: 5/15/2026 8:12:11 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StgCar](
	[CarID] [int] NULL,
	[CarMake] [nvarchar](50) NULL,
	[CarModel] [nvarchar](50) NULL,
	[CarYear] [int] NULL,
	[Category] [nvarchar](50) NULL
) ON [PRIMARY]
GO


