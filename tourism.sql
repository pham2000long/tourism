USE [master]
GO
/****** Object:  Database [tourism]    Script Date: 26/07/2021 10:10:44 pm ******/
CREATE DATABASE [tourism]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'tourism', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\tourism.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'tourism_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\tourism_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [tourism] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tourism].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tourism] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [tourism] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [tourism] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [tourism] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [tourism] SET ARITHABORT OFF 
GO
ALTER DATABASE [tourism] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [tourism] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [tourism] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [tourism] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [tourism] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [tourism] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [tourism] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [tourism] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [tourism] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [tourism] SET  DISABLE_BROKER 
GO
ALTER DATABASE [tourism] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [tourism] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [tourism] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [tourism] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [tourism] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [tourism] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [tourism] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [tourism] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [tourism] SET  MULTI_USER 
GO
ALTER DATABASE [tourism] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [tourism] SET DB_CHAINING OFF 
GO
ALTER DATABASE [tourism] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [tourism] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [tourism] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [tourism] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [tourism] SET QUERY_STORE = OFF
GO
USE [tourism]
GO
/****** Object:  Table [dbo].[Affiliations]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Affiliations](
	[id] [nvarchar](10) NOT NULL,
	[affName] [nvarchar](50) NULL,
	[affDesc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[itineraryNo] [float] NULL,
	[tripStart] [datetime] NULL,
	[tripEnd] [datetime] NULL,
	[description] [nvarchar](255) NULL,
	[destination] [nvarchar](255) NULL,
	[basePrice] [money] NULL,
	[agencyCommission] [money] NULL,
	[bookingId] [int] NULL,
	[regionId] [nvarchar](5) NULL,
	[feeId] [nvarchar](10) NULL,
	[productSupplierId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookingDate] [datetime] NULL,
	[bookingNo] [nvarchar](50) NULL,
	[travelerCount] [float] NULL,
	[customerId] [int] NULL,
	[tripTypeId] [nvarchar](1) NULL,
	[packageId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[parentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CreditCards]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CreditCards](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CCName] [nvarchar](10) NOT NULL,
	[CCNumber] [nvarchar](50) NOT NULL,
	[CCExpiry] [datetime] NOT NULL,
	[customerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](20) NULL,
	[gender] [bit] NULL,
	[city] [nvarchar](50) NOT NULL,
	[country] [nvarchar](50) NULL,
	[avatar] [varchar](255) NULL,
	[birthday] [date] NULL,
	[address] [nvarchar](255) NULL,
	[creditCardId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers_Rewards]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers_Rewards](
	[customerId] [int] NOT NULL,
	[rewardId] [int] NOT NULL,
	[rwdNumber] [nvarchar](25) NOT NULL,
 CONSTRAINT [Customers_Rewards_PK] PRIMARY KEY NONCLUSTERED 
(
	[customerId] ASC,
	[rewardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fees]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fees](
	[id] [nvarchar](10) NOT NULL,
	[feeName] [nvarchar](50) NOT NULL,
	[feeAmt] [money] NOT NULL,
	[feeDesc] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[email] [varchar](255) NULL,
	[phone] [varchar](20) NULL,
	[gender] [bit] NULL,
	[avatar] [varchar](255) NULL,
	[birthday] [date] NULL,
	[address] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pkgName] [nvarchar](50) NOT NULL,
	[pkgStartDate] [datetime] NULL,
	[pkgEndDate] [datetime] NULL,
	[pkgDesc] [nvarchar](50) NULL,
	[pkgBasePrice] [money] NOT NULL,
	[pkgAgencyCommission] [money] NULL,
	[categoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages_Products_Suppliers]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages_Products_Suppliers](
	[packageId] [int] NOT NULL,
	[productSupplierId] [int] NOT NULL,
 CONSTRAINT [Packages_Products_Suppliers_PK] PRIMARY KEY NONCLUSTERED 
(
	[packageId] ASC,
	[productSupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[prodName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products_Suppliers]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products_Suppliers](
	[productSupplierId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[supplierId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productSupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regions]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regions](
	[id] [nvarchar](5) NOT NULL,
	[name] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rewards]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rewards](
	[id] [int] NOT NULL,
	[rwdName] [nvarchar](50) NULL,
	[rwdDesc] [nvarchar](50) NULL,
 CONSTRAINT [PK_Rewards] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SupplierContacts]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierContacts](
	[id] [int] NOT NULL,
	[supConFirstName] [nvarchar](50) NULL,
	[supConLastName] [nvarchar](50) NULL,
	[supConCompany] [nvarchar](255) NULL,
	[supConAddress] [nvarchar](255) NULL,
	[supConCity] [nvarchar](255) NULL,
	[supConProv] [nvarchar](255) NULL,
	[supConPostal] [nvarchar](255) NULL,
	[supConCountry] [nvarchar](255) NULL,
	[supConBusPhone] [nvarchar](50) NULL,
	[supConFax] [nvarchar](50) NULL,
	[supConEmail] [nvarchar](255) NULL,
	[supConURL] [nvarchar](255) NULL,
	[affiliationId] [nvarchar](10) NULL,
	[supplierId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TripTypes]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TripTypes](
	[id] [nvarchar](1) NOT NULL,
	[ttName] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 26/07/2021 10:10:44 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NULL,
	[customerId] [int] NULL,
	[membershipId] [int] NULL,
	[roleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT ((0)) FOR [parentId]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [customerId]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (NULL) FOR [membershipId]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [roleId]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Bookings] FOREIGN KEY([bookingId])
REFERENCES [dbo].[Bookings] ([id])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Bookings]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Fees] FOREIGN KEY([feeId])
REFERENCES [dbo].[Fees] ([id])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Fees]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Products_Suppliers] FOREIGN KEY([productSupplierId])
REFERENCES [dbo].[Products_Suppliers] ([productSupplierId])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Products_Suppliers]
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetails_Regions] FOREIGN KEY([regionId])
REFERENCES [dbo].[Regions] ([id])
GO
ALTER TABLE [dbo].[BookingDetails] CHECK CONSTRAINT [FK_BookingDetails_Regions]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_Packages] FOREIGN KEY([packageId])
REFERENCES [dbo].[Packages] ([id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_Packages]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK_Bookings_TripTypes] FOREIGN KEY([tripTypeId])
REFERENCES [dbo].[TripTypes] ([id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK_Bookings_TripTypes]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_CreditCards] FOREIGN KEY([creditCardId])
REFERENCES [dbo].[CreditCards] ([id])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_CreditCards]
GO
ALTER TABLE [dbo].[Customers_Rewards]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Rewards_Customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Customers_Rewards] CHECK CONSTRAINT [FK_Customers_Rewards_Customers]
GO
ALTER TABLE [dbo].[Customers_Rewards]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Rewards_Rewards] FOREIGN KEY([rewardId])
REFERENCES [dbo].[Rewards] ([id])
GO
ALTER TABLE [dbo].[Customers_Rewards] CHECK CONSTRAINT [FK_Customers_Rewards_Rewards]
GO
ALTER TABLE [dbo].[Packages]  WITH CHECK ADD  CONSTRAINT [FK_Packages_Categories] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_Packages_Categories]
GO
ALTER TABLE [dbo].[Packages_Products_Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Packages_Products_Suppliers_Packages] FOREIGN KEY([packageId])
REFERENCES [dbo].[Packages] ([id])
GO
ALTER TABLE [dbo].[Packages_Products_Suppliers] CHECK CONSTRAINT [FK_Packages_Products_Suppliers_Packages]
GO
ALTER TABLE [dbo].[Packages_Products_Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Packages_Products_Suppliers_Products_Suppliers] FOREIGN KEY([productSupplierId])
REFERENCES [dbo].[Products_Suppliers] ([productSupplierId])
GO
ALTER TABLE [dbo].[Packages_Products_Suppliers] CHECK CONSTRAINT [FK_Packages_Products_Suppliers_Products_Suppliers]
GO
ALTER TABLE [dbo].[Products_Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Products_Suppliers] CHECK CONSTRAINT [FK_Products_Suppliers_Products]
GO
ALTER TABLE [dbo].[Products_Suppliers]  WITH CHECK ADD  CONSTRAINT [FK_Products_Suppliers_Suppliers] FOREIGN KEY([supplierId])
REFERENCES [dbo].[Suppliers] ([id])
GO
ALTER TABLE [dbo].[Products_Suppliers] CHECK CONSTRAINT [FK_Products_Suppliers_Suppliers]
GO
ALTER TABLE [dbo].[SupplierContacts]  WITH CHECK ADD  CONSTRAINT [FK_SupplierContacts_Affiliations] FOREIGN KEY([affiliationId])
REFERENCES [dbo].[Affiliations] ([id])
GO
ALTER TABLE [dbo].[SupplierContacts] CHECK CONSTRAINT [FK_SupplierContacts_Affiliations]
GO
ALTER TABLE [dbo].[SupplierContacts]  WITH CHECK ADD  CONSTRAINT [FK_SupplierContacts_Suppliers] FOREIGN KEY([supplierId])
REFERENCES [dbo].[Suppliers] ([id])
GO
ALTER TABLE [dbo].[SupplierContacts] CHECK CONSTRAINT [FK_SupplierContacts_Suppliers]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Customers] FOREIGN KEY([customerId])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Customers]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Memberships] FOREIGN KEY([membershipId])
REFERENCES [dbo].[Memberships] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Memberships]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roleId])
REFERENCES [dbo].[Roles] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [tourism] SET  READ_WRITE 
GO
