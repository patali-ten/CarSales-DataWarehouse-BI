USE [CarSales_DW]
GO

/****** Object:  Table [dbo].[DimDate]    Script Date: 5/15/2026 8:19:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DimDate](
	[DateSK] [int] NOT NULL,
	[FullDate] [date] NULL,
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Quarter] [int] NULL,
	[Year] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


