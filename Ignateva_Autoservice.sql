USE [master]
GO
/****** Object:  Database [IgnatevaAutoservice]    Script Date: 08.10.2024 21:53:34 ******/
CREATE DATABASE [IgnatevaAutoservice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IgnatevaAutoservice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IgnatevaAutoservice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IgnatevaAutoservice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\IgnatevaAutoservice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IgnatevaAutoservice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IgnatevaAutoservice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET ARITHABORT OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IgnatevaAutoservice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IgnatevaAutoservice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IgnatevaAutoservice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IgnatevaAutoservice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IgnatevaAutoservice] SET  MULTI_USER 
GO
ALTER DATABASE [IgnatevaAutoservice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IgnatevaAutoservice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IgnatevaAutoservice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IgnatevaAutoservice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IgnatevaAutoservice] SET DELAYED_DURABILITY = DISABLED 
GO
USE [IgnatevaAutoservice]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 08.10.2024 21:53:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[Duration] [nvarchar](50) NOT NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 08.10.2024 21:53:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (455, N' Иветта', N'Мишина', N' Андреевна', CAST(N'2002-10-05' AS Date), CAST(N'2016-01-24T00:00:00.000' AS DateTime), N' aukjan@yahoo.com', N' 7(3926)244-81-96 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (456, N' Божена', N'Суворова', N' Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N' attwood@aol.com', N' 7(347)895-86-57 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (457, N' Диана', N'Белозёрова', N' Антоновна', CAST(N'1989-02-27' AS Date), CAST(N'2017-01-30T00:00:00.000' AS DateTime), N' dialworld@aol.com', N' 7(9900)174-59-87 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (458, N' Эдита', N'Дементьева', N' Онисимовна', CAST(N'1975-09-17' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N' frosal@hotmail.com', N' 7(198)922-28-76 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (459, N' Евгений', N'Блинов', N' Мэлсович', CAST(N'1994-01-05' AS Date), CAST(N'2017-05-07T00:00:00.000' AS DateTime), N' moxfulder@outlook.com', N' 7(0852)321-82-64 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (460, N' Наум', N'Морозов', N' Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N' salesgeek@mac.com', N' 7(636)050-96-13 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (461, N' Харита', N'Попова', N' Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N' firstpr@verizon.net', N' 7(335)386-81-06 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (462, N' Наум', N'Крюков', N' Ильяович', CAST(N'1993-11-17' AS Date), CAST(N'2017-02-01T00:00:00.000' AS DateTime), N' floxy@hotmail.com', N' 7(81)657-88-92 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (463, N' Авигея', N'Крюкова', N' Святославовна', CAST(N'2000-08-10' AS Date), CAST(N'2018-01-03T00:00:00.000' AS DateTime), N' simone@gmail.com', N' 7(499)318-88-53 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (464, N' Сабрина', N'Беляева', N' Федосеевна', CAST(N'1972-07-26' AS Date), CAST(N'2017-06-14T00:00:00.000' AS DateTime), N' agapow@gmail.com', N' 7(6580)534-32-58 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (465, N' Святослав', N'Медведев', N' Юлианович', CAST(N'1972-10-04' AS Date), CAST(N'2018-10-13T00:00:00.000' AS DateTime), N' hllam@comcast.net', N' 7(3520)435-21-20 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (466, N' Пантелеймон', N'Блохин', N' Феликсович', CAST(N'1978-03-06' AS Date), CAST(N'2018-02-14T00:00:00.000' AS DateTime), N' balchen@comcast.net', N' 7(9524)556-48-98 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (467, N' Никки', N'Горбачёва', N' Еремеевна', CAST(N'1987-04-21' AS Date), CAST(N'2018-08-16T00:00:00.000' AS DateTime), N' chinthaka@att.net', N' 7(94)789-69-20 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (468, N' Прасковья', N'Архипова', N' Валерьевна', CAST(N'1979-01-09' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N' cgcra@live.com', N' 7(86)540-10-21 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (469, N' Патрисия', N'Андреева', N' Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N' jigsaw@aol.com', N' 7(9648)953-81-26 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (470, N' Марта', N'Горшкова', N' Иосифовна', CAST(N'2001-02-13' AS Date), CAST(N'2016-08-04T00:00:00.000' AS DateTime), N' gbacon@mac.com', N' 7(544)650-59-03 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (471, N' Влада', N'Орлова', N' Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N' rnelson@yahoo.ca', N' 7(2506)433-38-35 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (472, N' Глеб', N'Ершов', N' Федорович', CAST(N'1970-06-14' AS Date), CAST(N'2016-09-14T00:00:00.000' AS DateTime), N' sjava@aol.com', N' 7(2608)298-40-82 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (473, N' Тала', N'Быкова', N' Георгьевна', CAST(N'2000-02-22' AS Date), CAST(N'2016-08-13T00:00:00.000' AS DateTime), N' ganter@optonline.net', N' 7(13)915-53-53 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (474, N' Адриан', N'Новиков', N' Аркадьевич', CAST(N'1974-01-15' AS Date), CAST(N'2018-11-23T00:00:00.000' AS DateTime), N' multiplx@verizon.net', N' 7(70)572-33-62 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (475, N' Аристарх', N'Филатов', N' Дмитриевич', CAST(N'1989-05-29' AS Date), CAST(N'2017-01-11T00:00:00.000' AS DateTime), N' hampton@att.net', N' 7(696)235-29-24 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (476, N' Тамара', N'Анисимова', N' Витальевна', CAST(N'1988-06-16' AS Date), CAST(N'2016-02-25T00:00:00.000' AS DateTime), N' schwaang@mac.com', N' 7(66)128-04-10 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (477, N' Аверкий', N'Кудряшов', N' Константинович', CAST(N'1991-07-26' AS Date), CAST(N'2018-03-08T00:00:00.000' AS DateTime), N' nanop@msn.com', N' 7(88)732-96-30 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (478, N' Орест', N'Колобов', N' Юлианович', CAST(N'2001-07-14' AS Date), CAST(N'2017-01-01T00:00:00.000' AS DateTime), N' parkes@verizon.net', N' 7(1680)508-58-26 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (479, N' Дэнна', N'Кузьмина', N' Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N' nichoj@mac.com', N' 7(9940)977-45-73 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (480, N' Станислав', N'Александров', N' Эдуардович', CAST(N'1981-07-04' AS Date), CAST(N'2018-11-08T00:00:00.000' AS DateTime), N' bigmauler@aol.com', N' 7(18)164-05-12 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (481, N' Станислав', N'Андреев', N' Максович', CAST(N'1975-10-10' AS Date), CAST(N'2017-12-26T00:00:00.000' AS DateTime), N' budinger@mac.com', N' 7(02)993-91-28 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (482, N' Вольдемар', N'Дроздов', N' Артемович', CAST(N'1976-02-07' AS Date), CAST(N'2017-07-18T00:00:00.000' AS DateTime), N' smpeters@me.com', N' 7(307)456-99-05 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (483, N' Станислав', N'Абрамов', N' Филатович', CAST(N'1989-05-18' AS Date), CAST(N'2016-12-08T00:00:00.000' AS DateTime), N' solomon@att.net', N' 7(6545)478-87-79 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (484, N' Роза', N'Гусева', N' Дмитриевна', CAST(N'1999-02-13' AS Date), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N' martyloo@live.com', N' 7(23)064-51-84 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (485, N' Алексей', N'Лазарев', N' Богданович', CAST(N'1977-03-10' AS Date), CAST(N'2017-01-02T00:00:00.000' AS DateTime), N' claesjac@me.com', N' 7(0055)737-37-48 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (486, N' Вадим', N'Большаков', N' Данилович', CAST(N'1970-05-15' AS Date), CAST(N'2018-08-04T00:00:00.000' AS DateTime), N' uncle@gmail.com', N' 7(386)641-13-37 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (487, N' Витольд', N'Ефремов', N' Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N' kwilliams@yahoo.ca', N' 7(93)922-14-03 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (488, N' Захар', N'Игнатов', N' Павлович', CAST(N'1998-10-07' AS Date), CAST(N'2017-11-10T00:00:00.000' AS DateTime), N' dieman@icloud.com', N' 7(578)574-73-36 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (489, N' Артур', N'Калашников', N' Юрьевич', CAST(N'1972-12-13' AS Date), CAST(N'2017-08-20T00:00:00.000' AS DateTime), N' oevans@aol.com', N' 7(147)947-47-21 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (490, N' Лаура', N'Овчинникова', N' Еремеевна', CAST(N'1992-04-03' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N' carcus@yahoo.ca', N' 7(85)829-33-79 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (491, N' Иосиф', N'Голубев', N' Тимофеевич', CAST(N'1982-05-06' AS Date), CAST(N'2018-08-18T00:00:00.000' AS DateTime), N' smcnabb@att.net', N' 7(78)972-73-11 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (492, N' Эрик', N'Галкин', N' Онисимович', CAST(N'1975-01-18' AS Date), CAST(N'2016-07-19T00:00:00.000' AS DateTime), N' snunez@verizon.net', N' 7(759)873-77-39 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (493, N' Варлам', N'Некрасов', N' Михайлович', CAST(N'2000-11-12' AS Date), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N' dogdude@verizon.net', N' 7(019)258-06-35 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (494, N' Осип', N'Федотов', N' Анатольевич', CAST(N'1971-04-13' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N' breegster@hotmail.com', N' 7(590)702-33-06 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (495, N' Мартын', N'Смирнов', N' Арсеньевич', CAST(N'1996-06-25' AS Date), CAST(N'2017-02-07T00:00:00.000' AS DateTime), N' haddawy@live.com', N' 7(6251)589-02-43 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (496, N' Касьян', N'Копылов', N' Робертович', CAST(N'1983-08-04' AS Date), CAST(N'2018-03-18T00:00:00.000' AS DateTime), N' crobles@sbcglobal.net', N' 7(5774)679-82-06 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (497, N' Элина', N'Дмитриева', N' Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N' vmalik@live.com', N' 7(787)140-48-84 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (498, N' Инара', N'Бирюкова', N' Улебовна', CAST(N'1978-07-21' AS Date), CAST(N'2017-10-01T00:00:00.000' AS DateTime), N' smpeters@hotmail.com', N' 7(098)346-50-58 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (499, N' Оскар', N'Васильев', N' Богданович', CAST(N'1971-01-30' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N' miturria@verizon.net', N' 7(585)801-94-29 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (500, N' Устин', N'Киселёв', N' Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N' dalamb@verizon.net', N' 7(83)334-52-76 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (501, N' Леонтий', N'Кузьмин', N' Валерьянович', CAST(N'2000-05-05' AS Date), CAST(N'2017-10-12T00:00:00.000' AS DateTime), N' msloan@hotmail.com', N' 7(1340)148-90-68 ', N'м', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (502, N' Магда', N'Ефимова', N' Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N' rbarreira@me.com', N' 7(9261)386-15-92 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (503, N' Изабелла', N'Воронова', N' Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N' kildjean@sbcglobal.net', N' 7(17)433-44-98 ', N'ж', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (504, N' Людвиг', N'Волков', N' Витальевич', CAST(N'1977-12-27' AS Date), CAST(N'2016-04-27T00:00:00.000' AS DateTime), N' jrkorson@msn.com', N' 7(8459)592-05-58 ', N'м', NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', N'женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', N'мужской')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (101, N'Замена жидкости в кондиционере', CAST(3040.00 AS Decimal(18, 2)), N' 8 час.', 0.25, N' Услуги автосервиса\Кондиционер.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (102, N'Ремонт и замена коллектора', CAST(2770.00 AS Decimal(18, 2)), N' 150 мин.', 0.15, N' Услуги автосервиса\Выхлопная система.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (103, N'Замена актуатора сцепления', CAST(4100.00 AS Decimal(18, 2)), N' 330 мин.', 0.15, N' Услуги автосервиса\Сцепление.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (104, N'Замена жидкости ГУР', CAST(2380.00 AS Decimal(18, 2)), N' 9 час.', 0.2, N' Услуги автосервиса\ГУР.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (105, N'Заправка кондиционеров', CAST(4860.00 AS Decimal(18, 2)), N' 2 час.', 0.05, N' Услуги автосервиса\Кондиционер.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (106, N'Замена масла в вариаторе', CAST(4720.00 AS Decimal(18, 2)), N' 2 час.', 0.05, N' Услуги автосервиса\Вариатор.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (107, N'Ремонт двигателя', CAST(2470.00 AS Decimal(18, 2)), N' 4 час.', 0.25, N' Услуги автосервиса\Двигатель.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (108, N'Замена заднего сальника АКПП', CAST(1510.00 AS Decimal(18, 2)), N' 390 мин.', 0.25, N' Услуги автосервиса\АКПП.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (109, N'Покраска', CAST(2370.00 AS Decimal(18, 2)), N' 2 час.', 0.15, N' Услуги автосервиса\Дополнительные услуги.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (110, N'Мойка колес', CAST(3490.00 AS Decimal(18, 2)), N' 570 мин.', 0, N' Услуги автосервиса\Шиномонтаж.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (111, N'Замена прокладки впускного-выпуского коллектора', CAST(2980.00 AS Decimal(18, 2)), N' 3 час.', 0, N' Услуги автосервиса\Выхлопная система.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (112, N'Диагностика работы двигателя', CAST(2760.00 AS Decimal(18, 2)), N' 150 мин.', 0.1, N' Услуги автосервиса\Двигатель.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (113, N'Установка сигнализации', CAST(1760.00 AS Decimal(18, 2)), N' 4 час.', 0, N' Услуги автосервиса\Электрика.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (114, N'Замена компрессора кондиционера', CAST(2720.00 AS Decimal(18, 2)), N' 270 мин.', 0.1, N' Услуги автосервиса\Кондиционер.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (115, N'Замена ремня привода ГУР', CAST(3350.00 AS Decimal(18, 2)), N' 10 час.', 0, N' Услуги автосервиса\ГУР.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (116, N'Замена тормозных колодок', CAST(4260.00 AS Decimal(18, 2)), N' 8 час.', 0.05, N' Услуги автосервиса\Техническое обслуживание.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (117, N'Замена масла', CAST(1430.00 AS Decimal(18, 2)), N' 510 мин.', 0.25, N' Услуги автосервиса\Техническое обслуживание.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (118, N'Замена цепи ГРМ', CAST(4570.00 AS Decimal(18, 2)), N' 6 час.', 0.2, N' Услуги автосервиса\Двигатель.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (119, N'Замена бензонасоса', CAST(1780.00 AS Decimal(18, 2)), N' 4 час.', 0.1, N' Услуги автосервиса\Топливная система.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (120, N'Ремонт приводного вала', CAST(4520.00 AS Decimal(18, 2)), N' 210 мин.', 0.05, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (121, N'Замена подшипника компрессора кондиционера', CAST(1110.00 AS Decimal(18, 2)), N' 330 мин.', 0.2, N' Услуги автосервиса\Кондиционер.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (122, N'Снятие и установка колес', CAST(3130.00 AS Decimal(18, 2)), N' 390 мин.', 0, N' Услуги автосервиса\Шиномонтаж.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (123, N'Замена лямбда зонда', CAST(770.00 AS Decimal(18, 2)), N' 270 мин.', 0.05, N' Услуги автосервиса\Выхлопная система.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (124, N'Замена привода в сборе', CAST(3890.00 AS Decimal(18, 2)), N' 8 час.', 0.15, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (125, N'Замена трубки кондиционера', CAST(2810.00 AS Decimal(18, 2)), N' 3 час.', 0.15, N' Услуги автосервиса\Кондиционер.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (126, N'Замена ремня кондиционера', CAST(4650.00 AS Decimal(18, 2)), N' 8 час.', 0, N' Услуги автосервиса\Кондиционер.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (127, N'Замена охлаждающей жидкости', CAST(1590.00 AS Decimal(18, 2)), N' 210 мин.', 0, N' Услуги автосервиса\Техническое обслуживание.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (128, N'Замена троса сцепления', CAST(4460.00 AS Decimal(18, 2)), N' 8 час.', 0.05, N' Услуги автосервиса\Сцепление.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (129, N'Замена масла в МКПП', CAST(4490.00 AS Decimal(18, 2)), N' 9 час.', 0.2, N' Услуги автосервиса\КПП.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (130, N'Замена рулевой рейки', CAST(4840.00 AS Decimal(18, 2)), N' 570 мин.', 0.25, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (131, N'Ремонт дисков', CAST(3860.00 AS Decimal(18, 2)), N' 270 мин.', 0.1, N' Услуги автосервиса\Шиномонтаж.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (132, N'Замена масла заднего редуктора (моста)', CAST(840.00 AS Decimal(18, 2)), N' 7 час.', 0.25, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (133, N'Замена подшипника задней ступицы', CAST(1860.00 AS Decimal(18, 2)), N' 270 мин.', 0.25, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (134, N'Восстановление рулевых реек', CAST(1020.00 AS Decimal(18, 2)), N' 2 час.', 0.2, N' Услуги автосервиса\Подвеска.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (135, N'Замена рулевой тяги', CAST(570.00 AS Decimal(18, 2)), N' 3 час.', 0, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (136, N'Ремонт и замена гидроблока АКПП', CAST(2040.00 AS Decimal(18, 2)), N' 270 мин.', 0, N' Услуги автосервиса\АКПП.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (137, N'Замена масла раздаточной коробки', CAST(2070.00 AS Decimal(18, 2)), N' 510 мин.', 0, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (138, N'Диагностика кондиционера', CAST(2590.00 AS Decimal(18, 2)), N' 10 час.', 0.1, N' Услуги автосервиса\Кондиционер.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (139, N'Ремонт и замена катализатора', CAST(500.00 AS Decimal(18, 2)), N' 270 мин.', 0.25, N' Услуги автосервиса\Выхлопная система.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (140, N'Замена гофры глушителя', CAST(760.00 AS Decimal(18, 2)), N' 270 мин.', 0.25, N' Услуги автосервиса\Выхлопная система.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (141, N'Замена ремня ГРМ', CAST(4630.00 AS Decimal(18, 2)), N' 150 мин.', 0.25, N' Услуги автосервиса\Двигатель.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (142, N'Ремонт редуктора', CAST(870.00 AS Decimal(18, 2)), N' 8 час.', 0.15, N' Услуги автосервиса\КПП.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (143, N'Замена электромагнитного клапана без снятия ТНВД', CAST(4610.00 AS Decimal(18, 2)), N' 450 мин.', 0.1, N' Услуги автосервиса\diz.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (144, N'Вулканизация шин', CAST(540.00 AS Decimal(18, 2)), N' 330 мин.', 0.2, N' Услуги автосервиса\Шиномонтаж.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (145, N'Ремонт стартера', CAST(2680.00 AS Decimal(18, 2)), N' 8 час.', 0, N' Услуги автосервиса\Электрика.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (146, N'Ремонт коробки передач', CAST(1850.00 AS Decimal(18, 2)), N' 450 мин.', 0.25, N' Услуги автосервиса\КПП.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (147, N'Жидкостная промывка топливной системы', CAST(3620.00 AS Decimal(18, 2)), N' 6 час.', 0.15, N' Услуги автосервиса\Топливная система.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (148, N'Ремонт генератора', CAST(1700.00 AS Decimal(18, 2)), N' 210 мин.', 0.2, N' Услуги автосервиса\Электрика.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (149, N'Замена масла АКПП', CAST(2430.00 AS Decimal(18, 2)), N' 450 мин.', 0.25, N' Услуги автосервиса\АКПП.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (150, N'Диагностика трансмиссии', CAST(2790.00 AS Decimal(18, 2)), N' 2 час.', 0.2, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (151, N'Монтаж и снятие шин с диска', CAST(3990.00 AS Decimal(18, 2)), N' 10 час.', 0.15, N' Услуги автосервиса\Шиномонтаж.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (152, N'Замена подшипника передней ступицы', CAST(4020.00 AS Decimal(18, 2)), N' 330 мин.', 0.15, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (153, N'Замена главного цилиндра сцепления', CAST(4910.00 AS Decimal(18, 2)), N' 150 мин.', 0.05, N' Услуги автосервиса\Сцепление.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (154, N'Установка автомагнитолы', CAST(3210.00 AS Decimal(18, 2)), N' 270 мин.', 0, N' Услуги автосервиса\Электрика.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (155, N'Диагностика рулевых тяг', CAST(1680.00 AS Decimal(18, 2)), N' 3 час.', 0.05, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (156, N'Замена радиатора кондиционера', CAST(1770.00 AS Decimal(18, 2)), N' 9 час.', 0, N' Услуги автосервиса\Кондиционер.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (157, N'Замена тормозной жидкости', CAST(2200.00 AS Decimal(18, 2)), N' 6 час.', 0.1, N' Услуги автосервиса\Техническое обслуживание.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (158, N'Ремонт рулевого управления', CAST(3440.00 AS Decimal(18, 2)), N' 2 час.', 0.2, N' Услуги автосервиса\Подвеска.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (159, N'Замена заднего редуктора', CAST(2240.00 AS Decimal(18, 2)), N' 330 мин.', 0.25, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (160, N'Дефектация CVT', CAST(1830.00 AS Decimal(18, 2)), N' 3 час.', 0.05, N' Услуги автосервиса\Вариатор.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (161, N'Замена карданного вала', CAST(4450.00 AS Decimal(18, 2)), N' 2 час.', 0, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (162, N'Замена сцепления', CAST(4320.00 AS Decimal(18, 2)), N' 330 мин.', 0, N' Услуги автосервиса\КПП.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (163, N'Установка системы автозапуска', CAST(3620.00 AS Decimal(18, 2)), N' 9 час.', 0, N' Услуги автосервиса\Электрика.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (164, N'Замена опоры АКПП', CAST(2540.00 AS Decimal(18, 2)), N' 5 час.', 0.1, N' Услуги автосервиса\АКПП.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (165, N'Ремонт бензонасоса', CAST(500.00 AS Decimal(18, 2)), N' 210 мин.', 0.15, N' Услуги автосервиса\Топливная система.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (166, N'Замена масла переднего редуктора (моста)', CAST(3950.00 AS Decimal(18, 2)), N' 9 час.', 0.05, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (167, N'Ремонт подвесного подшипника', CAST(4440.00 AS Decimal(18, 2)), N' 7 час.', 0.25, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (168, N'Тестирование форсунок (стенд)', CAST(1600.00 AS Decimal(18, 2)), N' 6 час.', 0, N' Услуги автосервиса\Топливная система.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (169, N'Диагностика сцепления', CAST(4210.00 AS Decimal(18, 2)), N' 6 час.', 0.2, N' Услуги автосервиса\Сцепление.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (170, N'Замена ступицы в сборе', CAST(4250.00 AS Decimal(18, 2)), N' 150 мин.', 0.2, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (171, N'Антибактериальная обработка кондиционера', CAST(4580.00 AS Decimal(18, 2)), N' 450 мин.', 0.2, N' Услуги автосервиса\Кондиционер.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (172, N'Ремонт глушителя', CAST(2100.00 AS Decimal(18, 2)), N' 150 мин.', 0.25, N' Услуги автосервиса\Выхлопная система.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (173, N'Диагностика рулевого редуктора', CAST(2930.00 AS Decimal(18, 2)), N' 3 час.', 0.1, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (174, N'Диагностика подвески', CAST(1460.00 AS Decimal(18, 2)), N' 330 мин.', 0, N' Услуги автосервиса\Подвеска.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (175, N'Замена свечей', CAST(2240.00 AS Decimal(18, 2)), N' 2 час.', 0.1, N' Услуги автосервиса\Техническое обслуживание.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (176, N'Диагностика инжектора', CAST(3390.00 AS Decimal(18, 2)), N' 330 мин.', 0.05, N' Услуги автосервиса\Топливная система.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (177, N'Комплексная диагностика автомобиля', CAST(1120.00 AS Decimal(18, 2)), N' 10 час.', 0, N' Услуги автосервиса\Техническое обслуживание.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (178, N'Ремонт раздаточной коробки', CAST(3610.00 AS Decimal(18, 2)), N' 10 час.', 0.05, N' Услуги автосервиса\КПП.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (179, N'Удаление катализатора', CAST(1930.00 AS Decimal(18, 2)), N' 510 мин.', 0.1, N' Услуги автосервиса\Дополнительные услуги.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (180, N'Снятие/установка форсунок', CAST(1470.00 AS Decimal(18, 2)), N' 5 час.', 0.25, N' Услуги автосервиса\diz.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (181, N'Развал-схождение', CAST(3890.00 AS Decimal(18, 2)), N' 3 час.', 0, N' Услуги автосервиса\Подвеска.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (182, N'Замена выжимного подшипника', CAST(2250.00 AS Decimal(18, 2)), N' 10 час.', 0.05, N' Услуги автосервиса\Сцепление.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (183, N'Чистка форсунок ультразвуком', CAST(3920.00 AS Decimal(18, 2)), N' 4 час.', 0.05, N' Услуги автосервиса\Топливная система.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (184, N'Ремонт компрессора кондиционера', CAST(4760.00 AS Decimal(18, 2)), N' 150 мин.', 0.25, N' Услуги автосервиса\Кондиционер.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (185, N'Замена цилиндра сцепления', CAST(810.00 AS Decimal(18, 2)), N' 8 час.', 0.25, N' Услуги автосервиса\Сцепление.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (186, N'Ремонт подвески (ходовой)', CAST(680.00 AS Decimal(18, 2)), N' 3 час.', 0.05, N' Услуги автосервиса\Подвеска.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (187, N'Замена фильтров', CAST(530.00 AS Decimal(18, 2)), N' 210 мин.', 0.15, N' Услуги автосервиса\Техническое обслуживание.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (188, N'Кузовной ремонт', CAST(2750.00 AS Decimal(18, 2)), N' 150 мин.', 0.05, N' Услуги автосервиса\Дополнительные услуги.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (189, N'Замена прокладки приемной трубки', CAST(4680.00 AS Decimal(18, 2)), N' 570 мин.', 0.2, N' Услуги автосервиса\Выхлопная система.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (190, N'Диагностика выхлопной системы автомобиля', CAST(2550.00 AS Decimal(18, 2)), N' 3 час.', 0.25, N' Услуги автосервиса\Выхлопная система.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (191, N'Балансировка колес', CAST(4690.00 AS Decimal(18, 2)), N' 390 мин.', 0.25, N' Услуги автосервиса\Шиномонтаж.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (192, N'Ремонт автоэлектрики', CAST(4230.00 AS Decimal(18, 2)), N' 450 мин.', 0.1, N' Услуги автосервиса\Электрика.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (193, N'ТО с сохранением гарантии', CAST(4300.00 AS Decimal(18, 2)), N' 270 мин.', 0.2, N' Услуги автосервиса\Техническое обслуживание.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (194, N'Ремонт карданного вала', CAST(780.00 AS Decimal(18, 2)), N' 210 мин.', 0.05, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (195, N'Ремонт сцепления', CAST(3290.00 AS Decimal(18, 2)), N' 10 час.', 0.25, N' Услуги автосервиса\КПП.png', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (196, N'Замена кулисы АКПП', CAST(3250.00 AS Decimal(18, 2)), N' 6 час.', 0.1, N' Услуги автосервиса\АКПП.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (197, N'Ремонт кронштейна глушителя', CAST(1410.00 AS Decimal(18, 2)), N' 570 мин.', 0, N' Услуги автосервиса\Выхлопная система.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (198, N'Замена сальника привода', CAST(3820.00 AS Decimal(18, 2)), N' 570 мин.', 0.15, N' Услуги автосервиса\transmission.jpg', NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (199, N'Замена пыльника шруса', CAST(4730.00 AS Decimal(18, 2)), N' 5 час.', 0, N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', NULL)
GO
INSERT [dbo].[Service] ([ID], [Title], [Cost], [Duration], [Discount], [MainImagePath], [Description]) VALUES (200, N'Замена маховика', CAST(2400.00 AS Decimal(18, 2)), N' 10 час.', 0.25, N' Услуги автосервиса\Сцепление.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [IgnatevaAutoservice] SET  READ_WRITE 
GO
