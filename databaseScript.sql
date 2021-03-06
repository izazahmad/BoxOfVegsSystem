USE [master]
GO
/****** Object:  Database [boxofvegsDB]    Script Date: 11/06/2020 10:55:13 PM ******/
CREATE DATABASE [boxofvegsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'boxofvegsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\boxofvegsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'boxofvegsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\boxofvegsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [boxofvegsDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [boxofvegsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [boxofvegsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [boxofvegsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [boxofvegsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [boxofvegsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [boxofvegsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [boxofvegsDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [boxofvegsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [boxofvegsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [boxofvegsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [boxofvegsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [boxofvegsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [boxofvegsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [boxofvegsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [boxofvegsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [boxofvegsDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [boxofvegsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [boxofvegsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [boxofvegsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [boxofvegsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [boxofvegsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [boxofvegsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [boxofvegsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [boxofvegsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [boxofvegsDB] SET  MULTI_USER 
GO
ALTER DATABASE [boxofvegsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [boxofvegsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [boxofvegsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [boxofvegsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [boxofvegsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [boxofvegsDB] SET QUERY_STORE = OFF
GO
USE [boxofvegsDB]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](50) NOT NULL,
	[description] [varchar](500) NULL,
	[imageUrl] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoices]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoices](
	[invoiceID] [int] IDENTITY(1,1) NOT NULL,
	[userDetailID] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[city] [nvarchar](500) NOT NULL,
	[postCode] [nvarchar](20) NOT NULL,
	[PhoneNo] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[invoiceID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[soldUnitPrice] [decimal](18, 2) NOT NULL,
	[soldUnitDiscount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [varchar](50) NOT NULL,
	[description] [varchar](500) NULL,
	[imageUrl] [nvarchar](500) NULL,
	[categoryID] [int] NOT NULL,
	[purchasedPrice] [decimal](18, 2) NULL,
	[profitPercentage] [int] NULL,
	[discount] [int] NULL,
	[sellPrice] [decimal](18, 2) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchasedProducts]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchasedProducts](
	[purchasedProductID] [int] IDENTITY(1,1) NOT NULL,
	[purchaseID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[purchasedPrice] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[purchasedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchases]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchases](
	[purchaseID] [int] IDENTITY(1,1) NOT NULL,
	[purchaseDate] [datetime] NOT NULL,
	[supplierID] [int] NOT NULL,
	[userID] [nvarchar](128) NULL,
PRIMARY KEY CLUSTERED 
(
	[purchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliers]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliers](
	[supplierID] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [varchar](50) NOT NULL,
	[contactPerson] [varchar](50) NULL,
	[address] [nvarchar](500) NOT NULL,
	[city] [nvarchar](500) NOT NULL,
	[postCode] [nvarchar](20) NOT NULL,
	[PhoneNo] [varchar](15) NOT NULL,
	[email] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userDetails]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userDetails](
	[userDetailID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [nvarchar](128) NOT NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[userDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userReviews]    Script Date: 11/06/2020 10:55:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userReviews](
	[userReviesID] [int] IDENTITY(1,1) NOT NULL,
	[review] [nvarchar](500) NULL,
	[rating] [float] NULL,
	[reviewDate] [datetime] NOT NULL,
	[productID] [int] NOT NULL,
	[userDetailID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userReviesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202005101647238_InitialCreate', N'BoxOfVegsSystem.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C6D6FE3B811FE5EA0FF41D0A7B6C85979E92EB6817D87AC93B441372F586717FDB6A025DA1156A27422957350DC2FEB87FB49F7173A942859E28B5E6CC5760E0B2C2C72F8CC70382487C3617EFFDF6FE39F5661603DE384FA1199D827A363DBC2C48D3C9F2C2776CA163F7CB07FFAF1CF7F1A5F79E1CAFA5AD09D713A6849E8C47E622C3E771CEA3EE110D151E8BB4944A3051BB951E8202F724E8F8FFFE19C9C3818206CC0B2ACF1E794303FC4D9077C4E23E2E298A528B88D3C1C50510E35B30CD5BA4321A63172F1C4FE18ADEE175FF192CE5E28C3E1286F615B17818F409A190E16B6850889186220EBF9178A672C89C8721643010A1E5F620C740B14502CFA70BE26EFDA9DE353DE1D67DDB0807253CAA2B027E0C999D08F2337DF48CB76A93FD0E015689ABDF05E675A9CD8371ECE8A3E4701284066783E0D124E3CB16F4B161734BEC36C54341CE590D709C0FD1225DF4755C423AB73BBA3D29E4E47C7FCDF91354D039626784270CA12141C590FE93CF0DD7FE397C7E83B2693B393F9E2ECC3BBF7C83B7BFF777CF6AEDA53E82BD0D50AA0E82189629C806C7851F6DFB69C7A3B476E5836ABB4C9B502B60453C3B66ED1EA13264BF60493E6F4836D5DFB2BEC1525C2B8BE101F66123462490A9F776910A07980CB7AA79127FFBF81EBE9BBF78370BD43CFFE321B7A893F4C9C04E6D5671C64B5F4C98FF3E9551BEF6F82EC3A8942FE5DB7AFBCF6DB2C4A1397772632923CA26489595DBAB1B336DE4E26CDA18637EB02F5F04D9B4BAA9AB796947768939950B0D8F56C28E47D5DBE9D2DEE228E61F032D3E21A693238FD863592108E2C896E6D42275D4D8840D7FEC82BE25588FC608025B10317F048167E12E2B2971F233040447ACBFC80288515C1FB17A24F0DA2C3CF01449F61374DC050670C85F1AB737B788A08BE4BC339B7FFDDF11A6C681E7F89AE91CBA2E48AF0565BE37D8ADCEF51CAAE88778918FEC2DC02907F3EFA61778041C4B9705D4CE9351833F6A61138DC05E00D6167A7BDE1F822B56F97641A203FD4FB24D272FAAD205DFB257A0AC5373190E9FC9326513F454B9F7413B520358B9A53B48A2AC8FA8ACAC1BA492A28CD826604AD72E65483797CD9080DEFF265B087EFF36DB7799BD6828A1A67B042E27F62821358C6BC07C4184EC87A04BAAC1BFB7016B2E1E34C5F7D6FCA387D45413A34AB8D6643B6080C3F1B32D8C39F0D999850FCEC7BDC2BE970102A8801BE13BDFE8CD53EE724C9763D1D6ADDDC35F3DDAC01A6E9724169E4FAD92CD084C04400A32E3FF870567B3423EF8D1C11818E81A1FB7CCB8312E89B2D1BD53DB9C40166D8BA70F310E114511779AA1AA1435E0FC18A1D5523D83A325217EE6F0A4FB0749CF046881F8228CC549F30755AF8C4F56314B46A496AD9710BE37D2F79C8359738C684336CD54417E6FA400817A0E4230D4A9B86C64EC5E29A0DD1E0B59AC6BCCD855D8FBB129FD8894DB6F8CE06BB14FEDBAB1866B3C676609CCD2AE9228031A8B70F03156795AE06201F5C0ECD40A51393C140854BB51303AD6B6C0F065A57C99B33D0FC88DA75FCA5F3EAA19967FDA0BCFB6DBD515D7BB0CD9A3E0ECC3473DF13DA30688113D53C2FE7BC12AF98E67006728AF31915AEAE6C221C7C86593D64B3F677B57EA8D30C221B5113E0DAD05A40C575A002A44CA81EC215B1BC46E98417D103B688BB35C28AB55F82ADD8808A5DBD16AD109A2F4F65E3EC74FA287B565A8362E49D0E0B151C8D41C88B57BDE31D94628ACBAA8AE9E20BF7F1862B1D1383D1A0A016CFD5A0A4A233836BA930CD762DE91CB23E2ED9565A92DC2783968ACE0CAE2561A3ED4AD238053DDC82AD5454DFC2079A6C45A4A3DC6DCABAB193674C8982B16348AD1ADFA238F6C9B2926A254AAC599E6735FD61D63FF928CC311C976A72904A694B4E2C4AD0124BB5C01A24BDF613CA2E114373C4E33C532F54C8B47BAB61F92F5856B74F75108B7DA0A0E6BFF316864BFCDA7EAB3A2402E71A7A1972AF260BA56B6C40DFDCE2E96F284089267A3F8D8234246627CBDC3ABFC3ABB6CF4B5484B123C9AF38518AC61457B7AEFE4E83A34E8C0107AAF463361F2C338449E585175A55BAC93335A31481AA2A8A2978B5B7C1333934BD074CF617FB8F572BC2EBCC2F91A4520510453D312A790E0A58A5AE3B6A3D15A58A59AFE98E28E59B5421A5AA1E5256B34A6A42562B36C23368544FD19D839A475245576BBB236B324AAAD09AEA0DB03532CB75DD5135492755604D7577EC75068ABC901EF00E663CC56CB585E587DDEDF63003C6EBAC8AC36C81953BFD2A50A5B82796B8B557C044F9415A94F1C4B79545E5718EED2CCA80615E816A37E2F505A8F11ADF8C59BBE6AE2DF24DD7FC66BC7E76FBAAD6A11CFA6492927B79F8930E796371E06A7F64A39CC07212DB2AD4081B7C6E4A9C6034FB3998063EE6CB7941708B88BFC094E5A91DF6E9F1C9A9F446E770DECB38947A81E6C06A7A34531FB31D6469916794B84F28517326B67853B20655C2D137C4C3AB89FDDFACD57916D9E0BFB2E223EB867E21FECF29543C2629B67E55734087C9B1EFF0AAA314F4D737F15CA2BBCA6FFEF32D6F7A64DD27309DCEAD6349D19B0C7FFD11452F69F2A65B48B3F1D38AB73BDB6AEF15B4A8D26CD9FC79C2DC67833C4D28A4FC4B88567FED2B9AF6F9C156889A270643E10DA242D313824DB08CCF073CF864D9F3817E9DD53F27D84434E353029FF407931F12745F868A967BDC873487A65D2C49999E5B13B1B7CACADCF7DEA4E46B6F35D1D59CEC1E7083E65D6FE7A2BCB17CE6C1B64E4DBAF260D8FBB4FB57CF513E94B4E4B5D3BEDF6CE45D2620375C2EFDA1F28E0F20534E93F9B3FFECE25DDB9A290A7CE0299AFD72880FCCD8C436BFFF4CE15D1B9B29407CE0C6D62B1FF8C06C6D5FFBE79E2DADF316BAF7EC5E3551C9709BA38B22B765EFE6217738FECF233082DCA3CC1F5DEAD3C59A525D5B18AE49CC4CCD796A326365E2287C158A66B6FDFA2A36FCC6CE0A9A66B686ECCE26DE62FD6FE42D689A791B7226F79177ACCD5AD4E582B7AC634DA9546F29CFB8D69396B4F6369FB5F16AFE2DA5150FA294DAEC31DC2EBF9D2CE2415432E4D4E99135AC5E14C3DE59F99B8DB07F537FB986E07FC19160B7B66B9634376411159BB72451412245686E31431E6CA91709F317C86550CD03D0D9ABF12CA8C7AF41E6D8BB21F7298B53065DC6E13CA805BCB813D0C43F4B8DAECB3CBE8FF9171DA20B20A6CF03F7F7E463EA075E29F7B526266480E0DE8508F7F2B1643CECBB7C2991EE22D21148A8AF748A1E7118070046EFC90C3DE34D6403F3FB8497C87D5947004D20ED035157FBF8D247CB04855460ACDBC327D8B017AE7EFC3F6913A522BA540000, N'6.4.0')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'3e29f859-c189-4fa7-b743-25ee3f9841b0', N'admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'10a77406-71be-419f-bedf-de3f25473fd3', N'consumer')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'91db18bc-1b54-4ec2-b04c-ea97ee5c7fef', N'10a77406-71be-419f-bedf-de3f25473fd3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c570740a-ef77-49c3-92ef-989d07a60672', N'10a77406-71be-419f-bedf-de3f25473fd3')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd2c40e46-1790-4854-b928-40483f5902bf', N'3e29f859-c189-4fa7-b743-25ee3f9841b0')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'91db18bc-1b54-4ec2-b04c-ea97ee5c7fef', N'shekhizaz@gmail.com', 0, N'AHa/tUGJ4PJI/seRmY8tJJXGL7yrHuf6e64S3lOpRQG4DxiCavDsbOs3nZCnNl7dvA==', N'487ff52e-6c79-4c0a-aa77-98f7c2c369ad', NULL, 0, 0, NULL, 1, 0, N'shekhizaz@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c570740a-ef77-49c3-92ef-989d07a60672', N'abu@abu.com', 0, N'ALJPWYWoMFWwS6nqplyv6O/c84Kb6rS1dgySOlbGJiuRBCIRcuvIAw4RaI9e7MoKQw==', N'e10382ac-0b9c-4009-bd4a-d14f2b344446', NULL, 0, 0, NULL, 1, 0, N'abu@abu.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'd2c40e46-1790-4854-b928-40483f5902bf', N'admin@admin.com', 0, N'AIVqNw3AkSS7qdEXvORhoIXVmuX+YggzUkfk37Vm0T2kTb7GvvUkKFzf8DKeE0cN4A==', N'e8e689cc-c1f2-48f0-8647-932f9636f26e', NULL, 0, 0, NULL, 0, 0, N'admin@admin.com')
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([categoryID], [categoryName], [description], [imageUrl]) VALUES (1, N'Fruits', N'fresh organic fruits', N'1652219e-d986-48fe-8600-5da8bb119e6e.jpg')
INSERT [dbo].[categories] ([categoryID], [categoryName], [description], [imageUrl]) VALUES (3, N'Vegetables', N'Fresh Organic Vegetables ', N'b56e3188-c7b3-4c82-a46a-c82a27a2ec58.jpg')
INSERT [dbo].[categories] ([categoryID], [categoryName], [description], [imageUrl]) VALUES (4, N'Fruits-Box', N'A colorful array of organic seasonal delights Fruits Boxes', N'79b576d4-c560-4be2-92bb-9e894a655de8.jpg')
INSERT [dbo].[categories] ([categoryID], [categoryName], [description], [imageUrl]) VALUES (20, N'Veg&Fruit-Box', N'A colourful array of organic seasonal delights Mix Fruits and Vegetables Boxes', N'8df29220-dc3c-4f35-8df4-9bdd39625e95.png')
INSERT [dbo].[categories] ([categoryID], [categoryName], [description], [imageUrl]) VALUES (21, N'Vegetables-Box', N'A colorful array of organic seasonal delights Vegetable Boxes', N'bf4bce9d-2fe4-42e8-a9e0-af6946cef5a4.jpg')
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[invoices] ON 

INSERT [dbo].[invoices] ([invoiceID], [userDetailID], [date], [address], [city], [postCode], [PhoneNo]) VALUES (1, 5, CAST(N'2020-05-13T18:27:17.997' AS DateTime), N'34 Sherrard Road', N'Leicester', N'LE5 3DQ', N'07440422215')
INSERT [dbo].[invoices] ([invoiceID], [userDetailID], [date], [address], [city], [postCode], [PhoneNo]) VALUES (2, 5, CAST(N'2020-05-13T18:30:41.093' AS DateTime), N'34 Sherrard Road', N'Leicester', N'LE5 3DQ', N'07440422215')
INSERT [dbo].[invoices] ([invoiceID], [userDetailID], [date], [address], [city], [postCode], [PhoneNo]) VALUES (3, 5, CAST(N'2020-05-13T18:42:00.667' AS DateTime), N'34 Sherrard Road', N'Leicester', N'LE5 3DQ', N'07440422215')
SET IDENTITY_INSERT [dbo].[invoices] OFF
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([orderID], [invoiceID], [productID], [quantity], [soldUnitPrice], [soldUnitDiscount]) VALUES (1, 1, 14, 1, CAST(7.73 AS Decimal(18, 2)), 15)
INSERT [dbo].[orders] ([orderID], [invoiceID], [productID], [quantity], [soldUnitPrice], [soldUnitDiscount]) VALUES (2, 1, 2, 1, CAST(2.30 AS Decimal(18, 2)), 10)
INSERT [dbo].[orders] ([orderID], [invoiceID], [productID], [quantity], [soldUnitPrice], [soldUnitDiscount]) VALUES (3, 2, 2, 1, CAST(2.30 AS Decimal(18, 2)), 10)
INSERT [dbo].[orders] ([orderID], [invoiceID], [productID], [quantity], [soldUnitPrice], [soldUnitDiscount]) VALUES (4, 2, 19, 1, CAST(8.64 AS Decimal(18, 2)), 5)
INSERT [dbo].[orders] ([orderID], [invoiceID], [productID], [quantity], [soldUnitPrice], [soldUnitDiscount]) VALUES (5, 3, 2, 1, CAST(2.30 AS Decimal(18, 2)), 10)
INSERT [dbo].[orders] ([orderID], [invoiceID], [productID], [quantity], [soldUnitPrice], [soldUnitDiscount]) VALUES (6, 3, 9, 2, CAST(0.77 AS Decimal(18, 2)), 0)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (2, N'Orange', N'organic oranges are so full of juice and flavor', N'dcdc74bf-e9de-45ae-a8eb-dcb8b5d80b68.jpg', 1, CAST(2.50 AS Decimal(18, 2)), 30, 25, CAST(2.44 AS Decimal(18, 2)), 77)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (4, N'broccoli', N'Organic broccoli are actually the flowers of a cabbage plant, full of vitamins and flavor', N'589127e2-d305-406a-a823-557c891ee760.jpg', 3, CAST(1.20 AS Decimal(18, 2)), 30, 10, CAST(1.40 AS Decimal(18, 2)), 90)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (6, N'Apple', N'organic fresh apples', N'ff28b615-d1a1-4e09-b8f8-6ad32143e6d2.jpg', 1, CAST(0.49 AS Decimal(18, 2)), 30, 0, CAST(0.64 AS Decimal(18, 2)), 42)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (7, N'Avocado', N'organic food', N'300b399a-7092-46cb-a192-3e30bbfc47fc.jpg', 1, CAST(0.99 AS Decimal(18, 2)), 30, 0, CAST(1.29 AS Decimal(18, 2)), 60)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (8, N'Strawberry', N'organic food', N'c0f06feb-8e11-4b79-9488-6d1aefe8ea90.jpg', 1, CAST(1.25 AS Decimal(18, 2)), 30, 0, CAST(1.63 AS Decimal(18, 2)), 50)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (9, N'Cabbage', N'organic food', N'8a62833d-41aa-4368-a9ea-8ba3a22b39a4.jpg', 3, CAST(0.59 AS Decimal(18, 2)), 30, 0, CAST(0.77 AS Decimal(18, 2)), 58)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (10, N'Cauliflower', N'organic food', N'9c47725f-0179-4ead-8e66-015bceac2597.jpg', 3, CAST(0.49 AS Decimal(18, 2)), 30, 0, CAST(0.64 AS Decimal(18, 2)), 80)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (11, N'Cucumber', N'organic food', N'b44f3f7c-31c8-4290-ad13-d6ae7ce21230.jpg', 3, CAST(0.95 AS Decimal(18, 2)), 30, 0, CAST(1.23 AS Decimal(18, 2)), 30)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (12, N'Potatoes', N'organic food', N'04a3352d-8de2-4945-aaf6-46f92902a95b.jpg', 3, CAST(0.21 AS Decimal(18, 2)), 30, 10, CAST(0.24 AS Decimal(18, 2)), 100)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (13, N'Spinach', N'organic food', N'd8e20550-6138-488d-aaab-fa3adee3b069.jpg', 3, CAST(0.29 AS Decimal(18, 2)), 30, 0, CAST(0.38 AS Decimal(18, 2)), 50)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (14, N'small fruits box', N'organic food', N'4cdcdd11-80c9-417c-a4a0-a41a2642b072.jpg', 4, CAST(6.99 AS Decimal(18, 2)), 30, 15, CAST(7.73 AS Decimal(18, 2)), 29)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (15, N'Mid-fruits box', N'organic food', N'76105efb-b2c4-4a65-ab20-9d36aeea7eda.jpg', 4, CAST(10.99 AS Decimal(18, 2)), 30, 0, CAST(14.29 AS Decimal(18, 2)), 30)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (16, N'Small-mix box', N'organic food', N'e514ccca-1642-4731-80e9-b6437cedb25b.png', 20, CAST(7.20 AS Decimal(18, 2)), 30, 0, CAST(9.36 AS Decimal(18, 2)), 30)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (17, N'Mid-mix box', N'organic food', N'0ddc6089-5d7a-49c1-aff1-47f4f017e763.png', 20, CAST(11.99 AS Decimal(18, 2)), 30, 0, CAST(15.59 AS Decimal(18, 2)), 30)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (18, N'Small-Veg Box', N'organic food', N'83242f87-31f7-4003-9c8b-6dc5326fb552.jpg', 21, CAST(5.99 AS Decimal(18, 2)), 30, 0, CAST(7.79 AS Decimal(18, 2)), 25)
INSERT [dbo].[products] ([productID], [productName], [description], [imageUrl], [categoryID], [purchasedPrice], [profitPercentage], [discount], [sellPrice], [quantity]) VALUES (19, N'Mid-Veg Box', N'organic food', N'b7f58102-2845-4a8a-a958-731154b51bf1.jpg', 21, CAST(6.99 AS Decimal(18, 2)), 30, 5, CAST(8.64 AS Decimal(18, 2)), 24)
SET IDENTITY_INSERT [dbo].[products] OFF
SET IDENTITY_INSERT [dbo].[purchasedProducts] ON 

INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (1, 1, 2, 25, CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (2, 2, 2, 25, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (3, 3, 4, 50, CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (6, 6, 2, 30, CAST(2.50 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (7, 7, 4, 50, CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (8, 8, 6, 42, CAST(0.49 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (9, 9, 7, 60, CAST(0.99 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (10, 10, 8, 50, CAST(1.25 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (11, 11, 9, 60, CAST(0.59 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (12, 12, 10, 80, CAST(0.49 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (13, 13, 11, 30, CAST(0.95 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (14, 14, 12, 100, CAST(0.21 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (15, 15, 13, 50, CAST(0.29 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (16, 16, 14, 30, CAST(6.99 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (17, 17, 15, 30, CAST(10.99 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (18, 18, 16, 30, CAST(7.20 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (19, 19, 17, 30, CAST(11.99 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (20, 20, 18, 25, CAST(5.99 AS Decimal(18, 2)))
INSERT [dbo].[purchasedProducts] ([purchasedProductID], [purchaseID], [productID], [quantity], [purchasedPrice]) VALUES (21, 21, 19, 25, CAST(6.99 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[purchasedProducts] OFF
SET IDENTITY_INSERT [dbo].[purchases] ON 

INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (1, CAST(N'2020-05-04T17:35:00.957' AS DateTime), 1, NULL)
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (2, CAST(N'2020-05-04T20:23:22.353' AS DateTime), 1, NULL)
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (3, CAST(N'2020-05-04T20:29:41.633' AS DateTime), 3, NULL)
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (6, CAST(N'2020-05-11T17:09:40.677' AS DateTime), 1, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (7, CAST(N'2020-05-11T17:41:20.910' AS DateTime), 1, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (8, CAST(N'2020-05-11T17:41:51.523' AS DateTime), 1, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (9, CAST(N'2020-05-11T17:42:22.863' AS DateTime), 5, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (10, CAST(N'2020-05-11T17:42:49.520' AS DateTime), 6, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (11, CAST(N'2020-05-11T17:43:17.200' AS DateTime), 3, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (12, CAST(N'2020-05-11T17:43:37.600' AS DateTime), 3, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (13, CAST(N'2020-05-11T17:44:00.517' AS DateTime), 5, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (14, CAST(N'2020-05-11T17:44:24.843' AS DateTime), 6, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (15, CAST(N'2020-05-11T17:44:44.377' AS DateTime), 5, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (16, CAST(N'2020-05-11T17:45:04.943' AS DateTime), 6, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (17, CAST(N'2020-05-11T17:45:24.450' AS DateTime), 1, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (18, CAST(N'2020-05-11T17:45:54.783' AS DateTime), 3, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (19, CAST(N'2020-05-11T17:46:12.817' AS DateTime), 5, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (20, CAST(N'2020-05-11T17:46:38.683' AS DateTime), 6, N'd2c40e46-1790-4854-b928-40483f5902bf')
INSERT [dbo].[purchases] ([purchaseID], [purchaseDate], [supplierID], [userID]) VALUES (21, CAST(N'2020-05-11T17:46:57.090' AS DateTime), 1, N'd2c40e46-1790-4854-b928-40483f5902bf')
SET IDENTITY_INSERT [dbo].[purchases] OFF
SET IDENTITY_INSERT [dbo].[suppliers] ON 

INSERT [dbo].[suppliers] ([supplierID], [companyName], [contactPerson], [address], [city], [postCode], [PhoneNo], [email]) VALUES (1, N'KP Supermarket', N'adnan', N'Melbourne Road', N'Leicester', N'LE5 3DQ', N'0124585555', N'shekhizaz@gmail.com')
INSERT [dbo].[suppliers] ([supplierID], [companyName], [contactPerson], [address], [city], [postCode], [PhoneNo], [email]) VALUES (3, N'Mr. Burger', N'Samir Patel', N'Maynell Road', N'Leicester', N'LE5 3DQ', N'0124585555', N'shekhizaz2@gmail.com')
INSERT [dbo].[suppliers] ([supplierID], [companyName], [contactPerson], [address], [city], [postCode], [PhoneNo], [email]) VALUES (5, N'Apna Supermarket', N'izazahmad shaikh', N'Melbourn Road', N'Leicester', N'LE5 3DQ', N'0124585555', N'shekhizaz3@gmail.com')
INSERT [dbo].[suppliers] ([supplierID], [companyName], [contactPerson], [address], [city], [postCode], [PhoneNo], [email]) VALUES (6, N'A1 Cash and Carry', N'Kamlesh', N'Greenlane Road', N'Leicester', N'LE5 3DQ', N'0124585555', N'shekhizaz@gmail1.com')
SET IDENTITY_INSERT [dbo].[suppliers] OFF
SET IDENTITY_INSERT [dbo].[userDetails] ON 

INSERT [dbo].[userDetails] ([userDetailID], [userID], [firstName], [lastName]) VALUES (2, N'e439f1a2-80ae-4582-81d2-8b7e7f88d84d', NULL, NULL)
INSERT [dbo].[userDetails] ([userDetailID], [userID], [firstName], [lastName]) VALUES (3, N'18029487-5dc9-480c-9aa8-4e396515d8b1', NULL, NULL)
INSERT [dbo].[userDetails] ([userDetailID], [userID], [firstName], [lastName]) VALUES (4, N'91db18bc-1b54-4ec2-b04c-ea97ee5c7fef', NULL, NULL)
INSERT [dbo].[userDetails] ([userDetailID], [userID], [firstName], [lastName]) VALUES (5, N'c570740a-ef77-49c3-92ef-989d07a60672', N'abuzar', N'shaikh')
INSERT [dbo].[userDetails] ([userDetailID], [userID], [firstName], [lastName]) VALUES (6, N'd2c40e46-1790-4854-b928-40483f5902bf', N'Admin', N'Admin')
SET IDENTITY_INSERT [dbo].[userDetails] OFF
SET IDENTITY_INSERT [dbo].[userReviews] ON 

INSERT [dbo].[userReviews] ([userReviesID], [review], [rating], [reviewDate], [productID], [userDetailID]) VALUES (1, N'good', 2.5, CAST(N'2020-05-12T18:54:15.970' AS DateTime), 10, 5)
SET IDENTITY_INSERT [dbo].[userReviews] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/06/2020 10:55:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/06/2020 10:55:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/06/2020 10:55:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 11/06/2020 10:55:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 11/06/2020 10:55:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/06/2020 10:55:13 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__categori__37077ABD1ACBC17F]    Script Date: 11/06/2020 10:55:13 PM ******/
ALTER TABLE [dbo].[categories] ADD UNIQUE NONCLUSTERED 
(
	[categoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__products__0A9CBBE030865B22]    Script Date: 11/06/2020 10:55:13 PM ******/
ALTER TABLE [dbo].[products] ADD UNIQUE NONCLUSTERED 
(
	[productName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__supplier__AB6E6164116A3F93]    Script Date: 11/06/2020 10:55:13 PM ******/
ALTER TABLE [dbo].[suppliers] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__userDeta__CB9A1CDEA61D853F]    Script Date: 11/06/2020 10:55:13 PM ******/
ALTER TABLE [dbo].[userDetails] ADD UNIQUE NONCLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[invoices]  WITH CHECK ADD FOREIGN KEY([userDetailID])
REFERENCES [dbo].[userDetails] ([userDetailID])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([invoiceID])
REFERENCES [dbo].[invoices] ([invoiceID])
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[products] ([productID])
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([categoryID])
REFERENCES [dbo].[categories] ([categoryID])
GO
ALTER TABLE [dbo].[purchasedProducts]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[products] ([productID])
GO
ALTER TABLE [dbo].[purchasedProducts]  WITH CHECK ADD FOREIGN KEY([purchaseID])
REFERENCES [dbo].[purchases] ([purchaseID])
GO
ALTER TABLE [dbo].[purchases]  WITH CHECK ADD FOREIGN KEY([supplierID])
REFERENCES [dbo].[suppliers] ([supplierID])
GO
ALTER TABLE [dbo].[userReviews]  WITH CHECK ADD FOREIGN KEY([productID])
REFERENCES [dbo].[products] ([productID])
GO
ALTER TABLE [dbo].[userReviews]  WITH CHECK ADD FOREIGN KEY([userDetailID])
REFERENCES [dbo].[userDetails] ([userDetailID])
GO
USE [master]
GO
ALTER DATABASE [boxofvegsDB] SET  READ_WRITE 
GO
