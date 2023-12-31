USE [master]
GO
/****** Object:  Database [PlantShop]    Script Date: 16/08/23 8:08:40 PM ******/
CREATE DATABASE [PlantShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PlantShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSLETU\MSSQL\DATA\PlantShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PlantShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESSLETU\MSSQL\DATA\PlantShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PlantShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PlantShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PlantShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PlantShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PlantShop] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PlantShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PlantShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PlantShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PlantShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PlantShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PlantShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PlantShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PlantShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PlantShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PlantShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PlantShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PlantShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PlantShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PlantShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PlantShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PlantShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PlantShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PlantShop] SET  MULTI_USER 
GO
ALTER DATABASE [PlantShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PlantShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PlantShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PlantShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PlantShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PlantShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PlantShop] SET QUERY_STORE = OFF
GO
USE [PlantShop]
GO
/****** Object:  User [letu]    Script Date: 16/08/23 8:08:41 PM ******/
CREATE USER [letu] FOR LOGIN [letu] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[TokenId] [varchar](80) NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](12) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[accID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountSalt]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountSalt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Salt] [varchar](32) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](2) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Member]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Member](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Phone] [varchar](11) NULL,
	[Balance] [float] NOT NULL,
	[Status] [int] NOT NULL,
	[MajorCode] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberSkillDetail]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberSkillDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](100) NOT NULL,
	[MemberId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[FID] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrdDate] [date] NULL,
	[shipdate] [date] NULL,
	[status] [int] NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [varchar](30) NULL,
	[price] [int] NULL,
	[imgPath] [varchar](50) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
	[CateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Wage] [float] NULL,
	[ImageURL] [varchar](120) NULL,
	[DeliverDays] [int] NOT NULL,
	[PublisherDate] [date] NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectSkillRequire]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectSkillRequire](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](100) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[SkillLevel] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skill]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](100) NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Balance] [float] NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamDetail]    Script Date: 16/08/23 8:08:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[Status] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (1, N'lethucthanhtu@gmail.com', N'123', N'Lê Thúc Thanh Tú', N'0984326742', 1, 0)
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (52, N'alo1@gmail.com', N'456', N'buyer 22222', N'0984327654', 1, 1)
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (53, N'alo2@gmail.com', N'789', N'buyer 2', N'098123456431', 0, 1)
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (77, N'alo4@gmail.com', N'eqw', N'wq', N'423', 0, 1)
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (100, N'alo6@gmail.com', N'456', N'buyer 6', N'0984327653', 1, 1)
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role]) VALUES (108, N'alo7@gmail.com', N'789', N'buyer 7', N'098123456789', 1, 1)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (1, N'tree')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (2, N'tree')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (3, N'flower')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (4, N'cate1')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (5, N'cate 2')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (6, N'cate 3')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (7, N'cate 4')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (8, N'cate 5')
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (9, N'tree')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (1, 1, 1, 10)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (2, 2, 2, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (3, 3, 1, 3)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (4, 3, 3, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (5, 3, 20, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (6, 4, 1, 9)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (7, 4, 2, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (8, 5, 1, 1)
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (9, 5, 3, 3)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (1, CAST(N'2023-03-22' AS Date), CAST(N'2023-01-02' AS Date), 1, 52)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (2, CAST(N'2023-03-22' AS Date), NULL, 2, 52)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (3, CAST(N'2023-03-17' AS Date), NULL, 1, 1)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (4, CAST(N'2023-03-21' AS Date), NULL, 1, 52)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (5, CAST(N'2023-03-22' AS Date), NULL, 1, 52)
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (6, CAST(N'2023-03-22' AS Date), NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Plants] ON 

INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (1, N'plant 1', 100, N'./asset/images/plant/see-1.jpg', N'alo 1', 1, 9)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (2, N'tree 2', 200, N'./asset/images/plant/see-2.jpg', N'alo 2', 1, 2)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (3, N'flower 3', 300, N'./asset/images/plant/see-3.jpg', N'alo 3', 1, 3)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (4, N'flower 4', 400, N'./asset/images/plant/see-4.jpg', N'alo 4', 1, 3)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (20, N'plant 6', 600, N'./asset/images/plant/see-6.jpg', N'alo 6', 1, 1)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (22, N'tree8', 800, N'./asset/images/plant/see-8.jpg', N'alo 8', 1, 2)
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (26, N'plant9', 900, N'./asset/images/plant/see-9.jpg', N'alo 9', 1, 1)
SET IDENTITY_INSERT [dbo].[Plants] OFF
GO
SET IDENTITY_INSERT [dbo].[Team] ON 

INSERT [dbo].[Team] ([Id], [Balance], [Status]) VALUES (1, 0, 1)
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__A9D1053428EC9CB4]    Script Date: 16/08/23 8:08:41 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__AB6E616405FE64A3]    Script Date: 16/08/23 8:08:41 PM ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Major__737584F6BCD30ADC]    Script Date: 16/08/23 8:08:41 PM ******/
ALTER TABLE [dbo].[Major] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Major__A25C5AA75570210F]    Script Date: 16/08/23 8:08:41 PM ******/
ALTER TABLE [dbo].[Major] ADD UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Member__A9D105343D882DCB]    Script Date: 16/08/23 8:08:41 PM ******/
ALTER TABLE [dbo].[Member] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_MemberSkillDetail]    Script Date: 16/08/23 8:08:41 PM ******/
ALTER TABLE [dbo].[MemberSkillDetail] ADD  CONSTRAINT [UC_MemberSkillDetail] UNIQUE NONCLUSTERED 
(
	[SkillName] ASC,
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_ProjectSkillRequire]    Script Date: 16/08/23 8:08:41 PM ******/
ALTER TABLE [dbo].[ProjectSkillRequire] ADD  CONSTRAINT [UC_ProjectSkillRequire] UNIQUE NONCLUSTERED 
(
	[SkillName] ASC,
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Skill__B63C657104AC3CDF]    Script Date: 16/08/23 8:08:41 PM ******/
ALTER TABLE [dbo].[Skill] ADD UNIQUE NONCLUSTERED 
(
	[SkillName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UC_TeamDetail]    Script Date: 16/08/23 8:08:41 PM ******/
ALTER TABLE [dbo].[TeamDetail] ADD  CONSTRAINT [UC_TeamDetail] UNIQUE NONCLUSTERED 
(
	[TeamId] ASC,
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Member] ADD  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[Project] ADD  DEFAULT (getdate()) FOR [PublisherDate]
GO
ALTER TABLE [dbo].[Team] ADD  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[AccountSalt]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([Id])
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[Member]  WITH CHECK ADD FOREIGN KEY([MajorCode])
REFERENCES [dbo].[Major] ([Code])
GO
ALTER TABLE [dbo].[MemberSkillDetail]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([Id])
GO
ALTER TABLE [dbo].[MemberSkillDetail]  WITH CHECK ADD FOREIGN KEY([SkillName])
REFERENCES [dbo].[Skill] ([SkillName])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([FID])
REFERENCES [dbo].[Plants] ([PID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[ProjectSkillRequire]  WITH CHECK ADD FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectSkillRequire]  WITH CHECK ADD FOREIGN KEY([SkillName])
REFERENCES [dbo].[Skill] ([SkillName])
GO
ALTER TABLE [dbo].[TeamDetail]  WITH CHECK ADD FOREIGN KEY([MemberId])
REFERENCES [dbo].[Member] ([Id])
GO
ALTER TABLE [dbo].[TeamDetail]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([role]=(1) OR [role]=(0)))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(2) OR [status]=(3)))
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [PlantShop] SET  READ_WRITE 
GO
