USE [CarSales_DW]
GO

/****** Object:  Table [dbo].[DimSalesperson]    Script Date: 5/15/2026 8:19:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimSalesperson](
	[SalespersonSK] [int] IDENTITY(1,1) NOT NULL,
	[SalespersonID] [int] NULL,
	[SalespersonName] [nvarchar](100) NULL,
	[Region] [nvarchar](50) NULL,
	[Experience] [nvarchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsCurrent] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalespersonSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


