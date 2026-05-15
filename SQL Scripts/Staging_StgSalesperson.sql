USE [CarSales_Staging]
GO

/****** Object:  Table [dbo].[StgSalesperson]    Script Date: 5/15/2026 8:17:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StgSalesperson](
	[SalespersonID] [int] NULL,
	[SalespersonName] [nvarchar](100) NULL,
	[Region] [nvarchar](50) NULL,
	[Experience] [nvarchar](50) NULL
) ON [PRIMARY]
GO


