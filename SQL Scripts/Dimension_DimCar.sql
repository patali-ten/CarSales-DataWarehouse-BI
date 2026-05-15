USE [CarSales_DW]
GO

/****** Object:  Table [dbo].[DimCar]    Script Date: 5/15/2026 8:17:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimCar](
	[CarSK] [int] IDENTITY(1,1) NOT NULL,
	[CarID] [int] NULL,
	[CarMake] [nvarchar](50) NULL,
	[CarModel] [nvarchar](50) NULL,
	[CarYear] [int] NULL,
	[Category] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CarSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


