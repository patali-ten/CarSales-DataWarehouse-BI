USE [CarSales_DW]
GO

/****** Object:  Table [dbo].[FacSales]    Script Date: 5/15/2026 8:19:40 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FacSales](
	[SalesID] [int] IDENTITY(1,1) NOT NULL,
	[DateSK] [int] NULL,
	[SalespersonSK] [int] NULL,
	[CarSK] [int] NULL,
	[CustomerSK] [int] NULL,
	[SalesPrice] [decimal](10, 2) NULL,
	[CommissionRate] [decimal](5, 4) NULL,
	[CommissionEarned] [decimal](10, 2) NULL,
	[accm_txn_create_time] [datetime] NULL,
	[accm_txn_complete_time] [datetime] NULL,
	[txn_process_time_hours] [decimal](10, 2) NULL,
	[CarMakeSK] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[FacSales]  WITH CHECK ADD FOREIGN KEY([CarSK])
REFERENCES [dbo].[DimCar] ([CarSK])
GO

ALTER TABLE [dbo].[FacSales]  WITH CHECK ADD FOREIGN KEY([CustomerSK])
REFERENCES [dbo].[DimCustomer] ([CustomerSK])
GO

ALTER TABLE [dbo].[FacSales]  WITH CHECK ADD FOREIGN KEY([DateSK])
REFERENCES [dbo].[DimDate] ([DateSK])
GO

ALTER TABLE [dbo].[FacSales]  WITH CHECK ADD FOREIGN KEY([SalespersonSK])
REFERENCES [dbo].[DimSalesperson] ([SalespersonSK])
GO

ALTER TABLE [dbo].[FacSales]  WITH CHECK ADD  CONSTRAINT [FK_FacSales_DimCarMake] FOREIGN KEY([CarMakeSK])
REFERENCES [dbo].[DimCarMake] ([CarMakeSK])
GO

ALTER TABLE [dbo].[FacSales] CHECK CONSTRAINT [FK_FacSales_DimCarMake]
GO


