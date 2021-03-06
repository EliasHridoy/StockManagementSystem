USE [master]
GO
/****** Object:  Database [StockManagmentSystemDB]    Script Date: 8/7/2018 9:53:10 AM ******/
CREATE DATABASE [StockManagmentSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagmentSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\StockManagmentSystemDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagmentSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\StockManagmentSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagmentSystemDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagmentSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagmentSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagmentSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagmentSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagmentSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagmentSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagmentSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagmentSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagmentSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagmentSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [StockManagmentSystemDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [StockManagmentSystemDB]
GO
/****** Object:  Table [dbo].[CategoryTable]    Script Date: 8/7/2018 9:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyTable]    Script Date: 8/7/2018 9:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CompanyTable] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemTable]    Script Date: 8/7/2018 9:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemTable](
	[ItemID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CompanyID] [int] NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[ReorderLevel] [int] NOT NULL,
	[AvailableQuantity] [int] NOT NULL,
 CONSTRAINT [PK_ItemTable] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogInTable]    Script Date: 8/7/2018 9:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogInTable](
	[UserId] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [int] NOT NULL,
 CONSTRAINT [PK_Tamptable] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockOutTable]    Script Date: 8/7/2018 9:53:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOutTable](
	[StockOutId] [int] IDENTITY(1,1) NOT NULL,
	[ItemID] [int] NOT NULL,
	[Sell] [int] NOT NULL,
	[SellDate] [date] NOT NULL,
	[StockOutType] [varchar](10) NULL,
 CONSTRAINT [PK_StockOutTable] PRIMARY KEY CLUSTERED 
(
	[StockOutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryTable] ON 

INSERT [dbo].[CategoryTable] ([ID], [CategoryName]) VALUES (1, N'Electronics')
INSERT [dbo].[CategoryTable] ([ID], [CategoryName]) VALUES (2, N'Cookeries')
INSERT [dbo].[CategoryTable] ([ID], [CategoryName]) VALUES (3, N'Confectionery')
INSERT [dbo].[CategoryTable] ([ID], [CategoryName]) VALUES (4, N'Dairy')
INSERT [dbo].[CategoryTable] ([ID], [CategoryName]) VALUES (5, N'Books')
INSERT [dbo].[CategoryTable] ([ID], [CategoryName]) VALUES (6, N'Gift')
INSERT [dbo].[CategoryTable] ([ID], [CategoryName]) VALUES (8, N'Beauty & Healths')
INSERT [dbo].[CategoryTable] ([ID], [CategoryName]) VALUES (9, N'Furniture')
SET IDENTITY_INSERT [dbo].[CategoryTable] OFF
SET IDENTITY_INSERT [dbo].[CompanyTable] ON 

INSERT [dbo].[CompanyTable] ([ID], [CompanyName]) VALUES (1, N'Pran')
INSERT [dbo].[CompanyTable] ([ID], [CompanyName]) VALUES (2, N'RFL')
INSERT [dbo].[CompanyTable] ([ID], [CompanyName]) VALUES (3, N'WALTON')
INSERT [dbo].[CompanyTable] ([ID], [CompanyName]) VALUES (4, N'Fresh')
SET IDENTITY_INSERT [dbo].[CompanyTable] OFF
SET IDENTITY_INSERT [dbo].[ItemTable] ON 

INSERT [dbo].[ItemTable] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (1, 1, 3, N'Mobile', 40, 25)
INSERT [dbo].[ItemTable] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (2, 4, 1, N'Milk', 34, 50)
INSERT [dbo].[ItemTable] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (4, 1, 2, N'Fan', 20, 14)
INSERT [dbo].[ItemTable] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (5, 3, 4, N'Oil', 34, 44)
INSERT [dbo].[ItemTable] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (6, 4, 4, N'Juice', 78, 112)
INSERT [dbo].[ItemTable] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (7, 4, 4, N'Milk', 34, 200)
INSERT [dbo].[ItemTable] ([ItemID], [CategoryID], [CompanyID], [ItemName], [ReorderLevel], [AvailableQuantity]) VALUES (8, 1, 2, N'TV', 10, 30)
SET IDENTITY_INSERT [dbo].[ItemTable] OFF
INSERT [dbo].[LogInTable] ([UserId], [UserName], [Password]) VALUES (1, N'Elias', 12345)
INSERT [dbo].[LogInTable] ([UserId], [UserName], [Password]) VALUES (2, N'DoTBooster', 12345)
INSERT [dbo].[LogInTable] ([UserId], [UserName], [Password]) VALUES (3, N'Reazul', 12345)
INSERT [dbo].[LogInTable] ([UserId], [UserName], [Password]) VALUES (4, N'Jawad', 12345)
INSERT [dbo].[LogInTable] ([UserId], [UserName], [Password]) VALUES (5, N'Sayem', 12345)
SET IDENTITY_INSERT [dbo].[StockOutTable] ON 

INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (1, 1, 10, CAST(N'2018-02-12' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (2, 2, 10, CAST(N'2018-04-12' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (3, 4, 10, CAST(N'2017-04-12' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (4, 5, 6, CAST(N'2017-08-01' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (5, 6, 6, CAST(N'2017-05-01' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (6, 7, 14, CAST(N'2018-01-01' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (7, 5, 1, CAST(N'2018-08-06' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (8, 5, 1, CAST(N'2018-06-08' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (9, 2, 10, CAST(N'2018-08-06' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (10, 5, 1, CAST(N'2018-08-06' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (11, 2, 5, CAST(N'2018-08-06' AS Date), N'damage')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (12, 1, 5, CAST(N'2018-08-06' AS Date), N'damage')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (13, 2, 5, CAST(N'2018-08-06' AS Date), N'lost')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (14, 1, 5, CAST(N'2018-08-06' AS Date), N'lost')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (15, 2, 5, CAST(N'2018-08-06' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (16, 1, 5, CAST(N'2018-08-06' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (17, 2, 5, CAST(N'2018-08-06' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (18, 2, 5, CAST(N'2018-08-06' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (19, 2, 5, CAST(N'2018-08-06' AS Date), N'damage')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (20, 6, 20, CAST(N'2018-08-06' AS Date), N'sell')
INSERT [dbo].[StockOutTable] ([StockOutId], [ItemID], [Sell], [SellDate], [StockOutType]) VALUES (21, 4, 5, CAST(N'2018-08-07' AS Date), N'sell')
SET IDENTITY_INSERT [dbo].[StockOutTable] OFF
ALTER TABLE [dbo].[ItemTable]  WITH CHECK ADD  CONSTRAINT [FK_ItemTable_CategoryTable] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[CategoryTable] ([ID])
GO
ALTER TABLE [dbo].[ItemTable] CHECK CONSTRAINT [FK_ItemTable_CategoryTable]
GO
ALTER TABLE [dbo].[ItemTable]  WITH CHECK ADD  CONSTRAINT [FK_ItemTable_CompanyTable] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[CompanyTable] ([ID])
GO
ALTER TABLE [dbo].[ItemTable] CHECK CONSTRAINT [FK_ItemTable_CompanyTable]
GO
ALTER TABLE [dbo].[StockOutTable]  WITH CHECK ADD  CONSTRAINT [FK_StockOutTable_ItemTable] FOREIGN KEY([ItemID])
REFERENCES [dbo].[ItemTable] ([ItemID])
GO
ALTER TABLE [dbo].[StockOutTable] CHECK CONSTRAINT [FK_StockOutTable_ItemTable]
GO
USE [master]
GO
ALTER DATABASE [StockManagmentSystemDB] SET  READ_WRITE 
GO
