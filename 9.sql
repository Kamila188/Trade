USE [master]
GO
/****** Object:  Database [Trade2]    Script Date: 04.10.2022 16:17:00 ******/
CREATE DATABASE [Trade2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Trade2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trade2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Trade2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade2] SET  MULTI_USER 
GO
ALTER DATABASE [Trade2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade2] SET QUERY_STORE = OFF
GO
USE [Trade2]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 04.10.2022 16:17:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatus] [nvarchar](max) NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [int] NOT NULL,
	[OrderStructure] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
	[FIOClient] [nvarchar](max) NULL,
	[Code] [nvarchar](max) NULL,
 CONSTRAINT [PK__Order__C3905BAF1A3CBDD5] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 04.10.2022 16:17:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PickupPoint]    Script Date: 04.10.2022 16:17:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PickupPoint](
	[ID] [int] NOT NULL,
	[Adress] [nvarchar](max) NULL,
 CONSTRAINT [PK_PickupPoint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 04.10.2022 16:17:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [nvarchar](max) NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NOT NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[Unit] [nvarchar](max) NOT NULL,
	[MaxDiscount] [nvarchar](max) NULL,
	[Supplier] [nvarchar](max) NULL,
 CONSTRAINT [PK__Product__2EA7DCD50B50AC96] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04.10.2022 16:17:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04.10.2022 16:17:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderStructure], [Date], [FIOClient], [Code]) VALUES (1, N'Новый', CAST(N'2022-05-16T00:00:00.000' AS DateTime), 27, N'B111C5, 5, T238C7, 7', CAST(N'2022-05-10T00:00:00.000' AS DateTime), N'Маслов Максим Иванович', N'811')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderStructure], [Date], [FIOClient], [Code]) VALUES (2, N'Новый', CAST(N'2022-05-17T00:00:00.000' AS DateTime), 5, N'E112C6, 5, T238C7,9', CAST(N'2022-05-11T00:00:00.000' AS DateTime), N'', N'812')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderStructure], [Date], [FIOClient], [Code]) VALUES (3, N'Новый', CAST(N'2022-05-18T00:00:00.000' AS DateTime), 29, N'M112C8, 4, L293S9, 8', CAST(N'2022-05-12T00:00:00.000' AS DateTime), N'', N'813')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderStructure], [Date], [FIOClient], [Code]) VALUES (4, N'Новый', CAST(N'2022-05-19T00:00:00.000' AS DateTime), 10, N'M294G9, 6, S384K2, 1', CAST(N'2022-05-13T00:00:00.000' AS DateTime), N'', N'814')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderStructure], [Date], [FIOClient], [Code]) VALUES (5, N'Новый', CAST(N'2022-05-20T00:00:00.000' AS DateTime), 31, N'W874J3, 2, Q836H4, 1', CAST(N'2022-05-14T00:00:00.000' AS DateTime), N'Симонов Михаил Тимурович', N'815')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderStructure], [Date], [FIOClient], [Code]) VALUES (6, N'Новый', CAST(N'2022-05-21T00:00:00.000' AS DateTime), 32, N'O947D8, 4, R983K4, 1', CAST(N'2022-05-15T00:00:00.000' AS DateTime), N'', N'816')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderStructure], [Date], [FIOClient], [Code]) VALUES (7, N'Новый', CAST(N'2022-05-22T00:00:00.000' AS DateTime), 20, N'H497J3, 2, N394K2, 5', CAST(N'2022-05-16T00:00:00.000' AS DateTime), N'', N'817')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderStructure], [Date], [FIOClient], [Code]) VALUES (8, N'Завершен', CAST(N'2022-05-23T00:00:00.000' AS DateTime), 34, N'X846D3, 1, P495H8, 3', CAST(N'2022-05-17T00:00:00.000' AS DateTime), N'Павлова Ксения Михайловна', N'818')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderStructure], [Date], [FIOClient], [Code]) VALUES (9, N'Новый', CAST(N'2022-05-24T00:00:00.000' AS DateTime), 35, N'V378J3, 2, K284U8, 3', CAST(N'2022-05-18T00:00:00.000' AS DateTime), N'Трифонов Григорий Юрьевич', N'819')
INSERT [dbo].[Order] ([OrderID], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [OrderStructure], [Date], [FIOClient], [Code]) VALUES (10, N'Завершен', CAST(N'2022-05-25T00:00:00.000' AS DateTime), 36, N'N387I8, 6, I483H3, 7', CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'', N'820')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'B111C5')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (1, N'T238C7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'E112C6')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (2, N'T238C7')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (3, N'L293S9')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (3, N'M112C8')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (4, N'M294G9')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (4, N'S384K2')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (5, N'Q836H4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (5, N'W874J3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (6, N'O947D8')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (6, N'R983K4')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (7, N'H497J3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (7, N'N394K2')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (8, N'P495H8')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (8, N'X846D3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (9, N'K284U8')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (9, N'V378J3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (10, N'I483H3')
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber]) VALUES (10, N'N387I8')
GO
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (1, N'344288, г. Кропоткин, ул. Чехова, 1')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (2, N'614164, г.Кропоткин,  ул. Степная, 30')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (3, N'394242, г. Кропоткин, ул. Коммунистическая, 43')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (4, N'660540, г. Кропоткин, ул. Солнечная, 25')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (5, N'125837, г. Кропоткин, ул. Шоссейная, 40')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (6, N'125703, г. Кропоткин, ул. Партизанская, 49')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (7, N'625283, г. Кропоткин, ул. Победы, 46')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (8, N'614611, г. Кропоткин, ул. Молодежная, 50')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (9, N'454311, г.Кропоткин, ул. Новая, 19')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (10, N'660007, г.Кропоткин, ул. Октябрьская, 19')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (11, N'603036, г. Кропоткин, ул. Садовая, 4')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (12, N'450983, г.Кропоткин, ул. Комсомольская, 26')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (13, N'394782, г. Кропоткин, ул. Чехова, 3')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (14, N'603002, г. Кропоткин, ул. Дзержинского, 28')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (15, N'450558, г. Кропоткин, ул. Набережная, 30')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (16, N'394060, г.Кропоткин, ул. Фрунзе, 43')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (17, N'410661, г. Кропоткин, ул. Школьная, 50')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (18, N'625590, г. Кропоткин, ул. Коммунистическая, 20')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (19, N'625683, г. Кропоткин, ул. 8 Марта')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (20, N'400562, г. Кропоткин, ул. Зеленая, 32')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (21, N'614510, г. Кропоткин, ул. Маяковского, 47')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (22, N'410542, г. Кропоткин, ул. Светлая, 46')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (23, N'620839, г. Кропоткин, ул. Цветочная, 8')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (24, N'443890, г. Кропоткин, ул. Коммунистическая, 1')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (25, N'603379, г. Кропоткин, ул. Спортивная, 46')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (26, N'603721, г. Кропоткин, ул. Гоголя, 41')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (27, N'410172, г. Кропоткин, ул. Северная, 13')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (28, N'420151, г. Кропоткин, ул. Вишневая, 32')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (29, N'125061, г. Кропоткин, ул. Подгорная, 8')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (30, N'630370, г. Кропоткин, ул. Шоссейная, 24')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (31, N'614753, г. Кропоткин, ул. Полевая, 35')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (32, N'426030, г. Кропоткин, ул. Маяковского, 44')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (33, N'450375, г. Кропоткин ул. Клубная, 44')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (34, N'625560, г. Кропоткин, ул. Некрасова, 12')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (35, N'630201, г. Кропоткин, ул. Комсомольская, 17')
INSERT [dbo].[PickupPoint] ([ID], [Adress]) VALUES (36, N'190949, г. Кропоткин, ул. Мичурина, 26')
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'B111C5', N'Поплин «Розовый жемчуг»', N'Поплин «Розовый жемчуг» шириной 220 см с изображением на ткани — крупные цветы, чайная роза; цветовая гамма: бледно-розовая.', N'Постельные ткани', N'B111C5.JPEG', N'БТК Текстиль', CAST(8500.0000 AS Decimal(19, 4)), 4, 6, N'Рулон', N'5', N'Раута')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'C384D8', N'Сатин «Дымчатая роза» однотонный', N'Сатин «Дымчатая роза» однотонный шириной 250 см с изображением на ткани цветовая гамма: розовый зефир.', N'Постельные ткани', N'', N'Империя ткани', CAST(1133.0000 AS Decimal(19, 4)), 3, 4, N'Рулон', N'10', N'Раута')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'D938K3', N'Фланель однотонная светлая', N'Фланель однотонная светлая оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: голубая, желтая, розовая, сирень, фисташка.', N'Ткани для изделий', N'', N'Май Фабрик', CAST(1300.0000 AS Decimal(19, 4)), 4, 10, N'Рулон', N'10', N'ГК Петров')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'E112C6', N'Муслин «Bej»', N'Муслин «Bej» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: кофе с молоком.', N'Детские ткани', N'E112C6.JPG', N'Империя ткани', CAST(10500.0000 AS Decimal(19, 4)), 3, 13, N'Рулон', N'15', N'ООО Афо-Тек')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'F374S8', N'Фланель рубашечная', N'Фланель рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', N'Ткани для изделий', N'', N'БТК Текстиль', CAST(2100.0000 AS Decimal(19, 4)), 2, 5, N'Рулон', N'5', N'Раута')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'H483D9', N'Фланель детская H483D9', N'Фланель детская 21212-2 шириной 90 см с изображением на ткани — россыпь звездочек; цветовая гамма: баклажан, оранжевый, розовая.', N'Детские ткани', N'', N'Комильфо', CAST(318.0000 AS Decimal(19, 4)), 2, 18, N'Рулон', N'5', N'ООО Афо-Тек')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'H497J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котята, сердечки; цветовая гамма: белоземельная, оранжевый.', N'Детские ткани', N'', N'БТК Текстиль', CAST(523.0000 AS Decimal(19, 4)), 2, 8, N'Рулон', N'5', N'ГК Петров')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'I483H3', N'Ткань поплин «Вивьен»', N'Ткань поплин «Вивьен» шириной 220 см с изображением на ткани — горошек; цветовая гамма: синяя, фисташка.', N'Постельные ткани', N'', N'БТК Текстиль', CAST(11300.0000 AS Decimal(19, 4)), 2, 5, N'Рулон', N'10', N'ООО Афо-Тек')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'K284U8', N'Бязь детская «Самолеты»', N'Бязь детская «Самолеты» шириной 150 см с изображением на ткани — игрушки, самолетики; цветовая гамма: белая, зеленая, синяя.', N'Детские ткани', N'', N'Империя ткани', CAST(5100.0000 AS Decimal(19, 4)), 3, 2, N'Рулон', N'25', N'ГК Петров')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'K839K3', N'Плюш белый в клетку', N'Плюш белый в клетку шириной 180 см с изображением на ткани — клетка, однотонный; цветовая гамма: белая, однотонная.', N'Детские ткани', N'K839K3.JPG', N'Империя ткани', CAST(765.0000 AS Decimal(19, 4)), 2, 3, N'Рулон', N'5', N'ГК Петров')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'L293S9', N'Плюш розовый гладкий', N'Плюш розовый гладкий шириной 180 см с изображением на ткани — однотонный; цветовая гамма: однотонная, розовая.', N'Детские ткани', N'L293S9.JPG', N'Комильфо', CAST(30000.0000 AS Decimal(19, 4)), 3, 2, N'Рулон', N'40', N'Раута')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'M112C8', N'Бязь детская «Совята»', N'Бязь детская «Совята» шириной 150 см с изображением на ткани — совы; цветовая гамма: бордо, желтая, салатовая.', N'Детские ткани', N'M112C8.JPG', N'Империя ткани', CAST(26000.0000 AS Decimal(19, 4)), 2, 14, N'Рулон', N'20', N'Раута')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'M294G9', N'Полотно вафельное «8 марта»', N'Полотно вафельное «8 марта» шириной 50 см с изображением на ткани — белые розы; цветовая гамма: розовая.', N'Ткани для изделий', N'M294G9.JPG', N'Империя ткани', CAST(5130.0000 AS Decimal(19, 4)), 2, 1, N'Рулон', N'5', N'Раута')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'M398S9', N'Поплин Мокко', N'Поплин Мокко 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: коричневая, кофе, шоколад.', N'Постельные ткани', N'M398S9.JPG', N'Май Фабрик', CAST(1800.0000 AS Decimal(19, 4)), 2, 6, N'Рулон', N'15', N'ГК Петров')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'N283K3', N'Сатин «Миндальный» однотонный', N'Сатин «Миндальный» однотонный шириной 250 см с изображением на ткани цветовая гамма: миндаль.', N'Постельные ткани', N'N283K3.JPG', N'Комильфо', CAST(6500.0000 AS Decimal(19, 4)), 3, 7, N'Рулон', N'5', N'Раута')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'N385L2', N'Сатин «Фисташковый» однотонный', N'Сатин «Фисташковый» однотонный шириной 250 см с изображением на ткани цветовая гамма: фисташка.', N'Постельные ткани', N'', N'БТК Текстиль', CAST(7000.0000 AS Decimal(19, 4)), 2, 2, N'Рулон', N'20', N'ГК Петров')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'N387I8', N'Полотно вафельное «Кухня»', N'Полотно вафельное «Кухня» шириной 50 см с изображением на ткани — кухня; цветовая гамма: желтая, малина.', N'Ткани для изделий', N'', N'БТК Текстиль', CAST(1000.0000 AS Decimal(19, 4)), 3, 5, N'Рулон', N'15', N'ООО Афо-Тек')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'N394K2', N'Ткань поплин «Лакшери»', N'Ткань поплин «Лакшери» шириной 220 см с изображением на ткани — надписи, сердечки; цветовая гамма: белая, красная, черная.', N'Постельные ткани', N'', N'Империя ткани', CAST(30660.0000 AS Decimal(19, 4)), 4, 15, N'Рулон', N'10', N'ООО Афо-Тек')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'O947D8', N'Ткань для скатертей под рогожку', N'Ткань для скатертей под рогожку «рис 18825» шириной 150 см с изображением на ткани — ромашки, россыпь цветов; цветовая гамма: красная, синяя.', N'Ткани для изделий', N'', N'Май Фабрик', CAST(3550.0000 AS Decimal(19, 4)), 3, 9, N'Рулон', N'10', N'ООО Афо-Тек')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'P495H8', N'Поплин «Густав»', N'Поплин «Густав» шириной 220 см с изображением на ткани — листья, папортник; цветовая гамма: зеленая, светло-серая.', N'Постельные ткани', N'', N'Комильфо', CAST(1000.0000 AS Decimal(19, 4)), 2, 14, N'Рулон', N'15', N'Раута')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'Q836H4', N'Фланель рубашечная', N'Фланель арт 535 рубашечная шириной 150 см с изображением на ткани — клетка; цветовая гамма: светло-коричневая, синий-королевский.', N'Ткани для изделий', N'', N'Май Фабрик', CAST(1350.0000 AS Decimal(19, 4)), 4, 7, N'Рулон', N'5', N'Раута')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'R748K3', N'Поплин Морская волна', N'Поплин Морская волна 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: аквамарин, бирюзовая.', N'Постельные ткани', N'', N'Май Фабрик', CAST(2300.0000 AS Decimal(19, 4)), 2, 6, N'Рулон', N'15', N'ГК Петров')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'R983K4', N'Сатин «Серо-бежевый» однотонный', N'Сатин «Серо-бежевый» однотонный шириной 250 см с изображением на ткани цветовая гамма: серо-бежевая.', N'Постельные ткани', N'', N'Империя ткани', CAST(1645.0000 AS Decimal(19, 4)), 2, 13, N'Рулон', N'15', N'ООО Афо-Тек')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'S384K2', N'Фланель черная', N'Фланель черная оптом шириной 90 см с изображением на ткани — однотонное; цветовая гамма: черная.', N'Ткани для изделий', N'S384K2.JPG', N'БТК Текстиль', CAST(69000.0000 AS Decimal(19, 4)), 4, 2, N'Рулон', N'40', N'ГК Петров')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'T238C7', N'Муслин «Gri»', N'Муслин «Gri» однотонный шириной 140+/-5 см с изображением на ткани — однотонный; цветовая гамма: серая.', N'Детские ткани', N'T238C7.JPG', N'БТК Текстиль', CAST(6500.0000 AS Decimal(19, 4)), 2, 12, N'Рулон', N'15', N'ООО Афо-Тек')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'U947E9', N'Муслин белый горошек на однотонном фоне', N'Муслин белый горошек на однотонном фоне шириной 150 см с изображением на ткани — мелкий горошек; цветовая гамма: желтая.', N'Детские ткани', N'', N'Империя ткани', CAST(3411.0000 AS Decimal(19, 4)), 3, 4, N'Рулон', N'10', N'ГК Петров')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'V378J3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — котенок, облака, полумесяц, радуга; цветовая гамма: бледно-розовая, голубая, салатовая, серо-бежевая.', N'Детские ткани', N'', N'Комильфо', CAST(2400.0000 AS Decimal(19, 4)), 3, 14, N'Рулон', N'15', N'ГК Петров')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'W874J3', N'Ткань поплин «Натурель»', N'Ткань поплин «Натурель» шириной 220 см с изображением на ткани — мелкие цветы; цветовая гамма: пепельная, розовая.', N'Постельные ткани', N'', N'БТК Текстиль', CAST(1600.0000 AS Decimal(19, 4)), 3, 9, N'Рулон', N'5', N'ГК Петров')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'X846D3', N'Ситец детский', N'Ситец детский шириной 95 см с изображением на ткани — жираф, полумесяц, пчелки; цветовая гамма: темно-фиолетовая.', N'Детские ткани', N'', N'Империя ткани', CAST(9300.0000 AS Decimal(19, 4)), 3, 5, N'Рулон', N'25', N'Раута')
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock], [Unit], [MaxDiscount], [Supplier]) VALUES (N'Z937S2', N'Поплин Голубой', N'Поплин Голубой 220 см шириной 220 см с изображением на ткани — однотонное; цветовая гамма: голубая.', N'Постельные ткани', N'', N'БТК Текстиль', CAST(9000.0000 AS Decimal(19, 4)), 2, 15, N'Рулон', N'10', N'Раута')
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Якушев', N'Евсей', N'Лукьевич', N'loginDEdcx2018', N'TYlFkM', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Фёдоров', N'Святослав', N'Григорьевич', N'loginDEnsa2018', N'LdqH+T', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Борисов', N'Герман', N'Дамирович', N'loginDErxm2018', N'8EavEy', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Ситников', N'Серапион', N'Фролович', N'loginDEaic2018', N'X2adoa', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Третьяков', N'Валерьян', N'Иринеевич', N'loginDEwul2018', N'uK&3Zr', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Комиссарова', N'Мария', N'Владимировна', N'loginDEjgl2018', N'++04Tb', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Меркушева', N'Раиса', N'Владленовна', N'loginDEgtk2018', N'pNWXhi', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Калашникова', N'Венера', N'Якуновна', N'loginDEvrd2018', N'S7N9hz', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Комиссаров', N'Семён', N'Павлович', N'loginDExky2018', N'Kt9EAS', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Денисов', N'Митрофан', N'Егорович', N'loginDExnj2018', N'IJDdP0', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (11, N'Матвиенко', N'Дамир', N'Богданович', N'loginDEnbu2018', N'86uDLd', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (12, N'Кириллов', N'Константин', N'Алексеевич', N'loginDEiik2018', N'gKt2zV', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (13, N'Медведьев', N'Фёдор', N'Мэлсович', N'loginDEwyi2018', N'9eskgK', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (14, N'Карпов', N'Евгений', N'Лукьевич', N'loginDEpfr2018', N'mW1Q36', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (15, N'Маркова', N'Евдокия', N'Артёмовна', N'loginDEjct2018', N'3WpoK9', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (16, N'Красильников', N'Тихон', N'Богданович', N'loginDEsmg2018', N'ApH1By', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (17, N'Титов', N'Семён', N'Иринеевич', N'loginDEexu2018', N'Nt44pG', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (18, N'Кудряшов', N'Борис', N'Иринеевич', N'loginDEztr2018', N'MYCgB7', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (19, N'Гаврилова', N'Нинель', N'Денисовна', N'loginDEwrc2018', N'SktJa|', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (20, N'Быков', N'Дмитрий', N'Валерьянович', N'loginDEzjs2018', N'|x{s+X', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (21, N'Фомичёв', N'Денис', N'Федосеевич', N'loginDEeka2018', N'mLZvLv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (22, N'Белова', N'Марфа', N'Матвеевна', N'loginDEepr2018', N'BG6tpN', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (23, N'Романова', N'Марина', N'Лаврентьевна', N'loginDEsnq2018', N'hrD}}g', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (24, N'Беспалов', N'Демьян', N'Витальевич', N'loginDEvqn2018', N'LPa|e3', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (25, N'Архипова', N'Венера', N'Демьяновна', N'loginDEery2018', N'*I0Rdi', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (26, N'Носков', N'Парфений', N'Георгьевич', N'loginDElqv2018', N'Hqfw17', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (27, N'Зыков', N'Иван', N'Варламович', N'loginDEtuz2018', N'Yln7JW', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (28, N'Иван', N'Протасьевна', N'', N'loginDEllr2018', N'hXtdCD', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (29, N'Рожков', N'Протасий', N'Альвианович', N'loginDEisy2018', N'5k5dHN', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (30, N'Большакова', N'Нинель', N'Протасьевна', N'loginDEqiv2018', N'h+N2uW', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (31, N'Наумова', N'Лидия', N'Донатовна', N'loginDEmfu2018', N'{ZpDBn', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (32, N'Панова', N'Ольга', N'Олеговна', N'loginDEgbd2018', N'+86Nf*', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (33, N'Комаров', N'Аркадий', N'Иванович', N'loginDEkdg2018', N'R0tt07', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (34, N'Федосеева', N'Тамара', N'Михаиловна', N'loginDEjrs2018', N'MVg{yd', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (35, N'Пестов', N'Роман', N'Михаилович', N'loginDEmvd2018', N'wyLDa{', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (36, N'Блинов', N'Артём', N'Ильяович', N'loginDEctc2018', N'B&dlx+', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (37, N'Владимирова', N'Полина', N'Иринеевна', N'loginDEavf2018', N'oDTttg', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (38, N'Силин', N'Игнатий', N'Яковович', N'loginDEako2018', N'tD8J5+', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (39, N'Кононов', N'Геннадий', N'Созонович', N'loginDEzrg2018', N'WXIgGi', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (40, N'Дьячков', N'Фрол', N'Арсеньевич', N'loginDEdwq2018', N'WkTaBP', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (41, N'Горбачёв', N'Арсений', N'Григорьевич', N'loginDEszg2018', N'NWkAVP', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (42, N'Виноградов', N'Яков', N'Онисимович', N'loginDEmeh2018', N'HQ+m4W', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (43, N'Лаврентьева', N'Валентина', N'Васильевна', N'loginDEpwm2018', N'be7AT0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (44, N'Брагин', N'Лукьян', N'Мартынович', N'loginDEnaq2018', N'I8c5EB', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (45, N'Трофимов', N'Кондрат', N'Игоревич', N'loginDEtuk2018', N'6aDAzV', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (46, N'Степанова', N'Глафира', N'Авксентьевна', N'loginDEhsb2018', N'n|I6A0', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (47, N'Федосеев', N'Пётр', N'Григорьевич', N'loginDEaoi2018', N'Dl58m|', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (48, N'Поляков', N'Николай', N'Антонович', N'loginDErmk2018', N'D3GuIv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (49, N'Медведев', N'Владимир', N'Онисимович', N'loginDEfnd2018', N'74D9|d', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (50, N'Иван', N'Мэлоровна', N'', N'loginDEtza2018', N'A7Qldh', 2)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_PickupPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[PickupPoint] ([ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_PickupPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__2D27B809] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__2D27B809]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__2E1BDC42] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__2E1BDC42]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade2] SET  READ_WRITE 
GO
