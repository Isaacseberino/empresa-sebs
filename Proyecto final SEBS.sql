USE [master]
GO
/****** Isaac Alejandro Seberino Castro 21-EIIN-1-040 ******/
CREATE DATABASE [sebs]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sebs', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\sebs.mdf' , SIZE = 8192KB , MAXSIZE = 102400KB , FILEGROWTH = 2048KB )
 LOG ON 
( NAME = N'sebs_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL2019\MSSQL\DATA\sebs_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sebs] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sebs].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sebs] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sebs] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sebs] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sebs] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sebs] SET ARITHABORT OFF 
GO
ALTER DATABASE [sebs] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [sebs] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sebs] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sebs] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sebs] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sebs] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sebs] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sebs] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sebs] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sebs] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sebs] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sebs] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sebs] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sebs] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sebs] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sebs] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sebs] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sebs] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sebs] SET  MULTI_USER 
GO
ALTER DATABASE [sebs] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sebs] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sebs] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sebs] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sebs] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sebs] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [sebs] SET QUERY_STORE = OFF
GO
USE [sebs]
GO
/****** Object:  Table [dbo].[Articulo]    Script Date: 12/18/2021 2:40:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articulo](
	[Articulo] [varchar](50) NOT NULL,
	[Marca] [varchar](50) NOT NULL,
	[Modelo] [varchar](50) NOT NULL,
	[Precio] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 12/18/2021 2:40:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Cliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Lugar_de_envio] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clientes_1] PRIMARY KEY CLUSTERED 
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 12/18/2021 2:40:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[Facturas] [int] NULL,
	[Cliente] [varchar](50) NOT NULL,
	[ID Vendedor] [varchar](50) NOT NULL,
	[Costo] [money] NOT NULL,
	[Articulo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Facturas] PRIMARY KEY CLUSTERED 
(
	[Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suplidor]    Script Date: 12/18/2021 2:40:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suplidor](
	[Suplidor] [int] IDENTITY(1,1) NOT NULL,
	[Empresa] [varchar](50) NOT NULL,
	[Ubicacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Suplidor] PRIMARY KEY CLUSTERED 
(
	[Empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vendedor]    Script Date: 12/18/2021 2:40:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vendedor](
	[Vendedor] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[ID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Articulo] ([Articulo], [Marca], [Modelo], [Precio]) VALUES (N'SMARTPHONE', N'APPLE', N'11 PRO', 500.0000)
INSERT [dbo].[Articulo] ([Articulo], [Marca], [Modelo], [Precio]) VALUES (N'LAPTOP', N'HP', N'PAVILION', 250.0000)
INSERT [dbo].[Articulo] ([Articulo], [Marca], [Modelo], [Precio]) VALUES (N'CONSOLA', N'SONY', N'PS5', 450.0000)
INSERT [dbo].[Articulo] ([Articulo], [Marca], [Modelo], [Precio]) VALUES (N'SMARTPHONE', N'SAMSUNG', N'NOTE 20 ', 750.0000)
INSERT [dbo].[Articulo] ([Articulo], [Marca], [Modelo], [Precio]) VALUES (N'SMARTPHONE ', N'LG', N'VELVET', 200.0000)
INSERT [dbo].[Articulo] ([Articulo], [Marca], [Modelo], [Precio]) VALUES (N'LAPTOP', N'APPLE', N'MACBOOK PRO', 1250.0000)
INSERT [dbo].[Articulo] ([Articulo], [Marca], [Modelo], [Precio]) VALUES (N'SMARTWATCH', N'APPLE', N'APPLEWATCH', 325.0000)
INSERT [dbo].[Articulo] ([Articulo], [Marca], [Modelo], [Precio]) VALUES (N'CONSOLA', N'XBOX', N'ONE X', 350.0000)
INSERT [dbo].[Articulo] ([Articulo], [Marca], [Modelo], [Precio]) VALUES (N'SMARTPHONE', N'APPLE', N'13', 750.0000)
INSERT [dbo].[Articulo] ([Articulo], [Marca], [Modelo], [Precio]) VALUES (N'LAPTOP', N'ALIENWARE', N'X15', 1200.0000)
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Apellido], [Telefono], [Lugar_de_envio]) VALUES (1, N'ANTONIO', N'VETTEL', N'6161', N'SANTO DOMINGO')
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Apellido], [Telefono], [Lugar_de_envio]) VALUES (2, N'CHAI ', N'JORGE', N'9862', N'LA VEGA')
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Apellido], [Telefono], [Lugar_de_envio]) VALUES (3, N'DANIEL', N'RICCARDO', N'6611', N'MOCA')
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Apellido], [Telefono], [Lugar_de_envio]) VALUES (4, N'JULIO', N'CASAS', N'5848', N'PUERTO PLATA')
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Apellido], [Telefono], [Lugar_de_envio]) VALUES (5, N'LEWIS', N'LECLERC', N'6494', N'BARAHONA')
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Apellido], [Telefono], [Lugar_de_envio]) VALUES (6, N'RICARDO', N'SOSA', N'6487', N'BAHORUCO')
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Apellido], [Telefono], [Lugar_de_envio]) VALUES (7, N'ROBERTO', N'JIMENEZ', N'8496', N'SANTO DOMINGO')
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Apellido], [Telefono], [Lugar_de_envio]) VALUES (8, N'ROSA', N'MELANO', N'8496', N'SAN CRISTOBAL')
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Apellido], [Telefono], [Lugar_de_envio]) VALUES (9, N'SATURNO', N'PEREZ', N'6416', N'SANTIAGO')
INSERT [dbo].[Clientes] ([Cliente], [Nombre], [Apellido], [Telefono], [Lugar_de_envio]) VALUES (10, N'TOMMY ', N'HOLLAND', N'4558', N'HIGUEY')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
INSERT [dbo].[Facturas] ([Facturas], [Cliente], [ID Vendedor], [Costo], [Articulo]) VALUES (NULL, N'ANTONIO VETTLE ', N'1010', 500.0000, N'APPLE IPHONE 11 PRO')
INSERT [dbo].[Facturas] ([Facturas], [Cliente], [ID Vendedor], [Costo], [Articulo]) VALUES (NULL, N'CHAI JORGE', N'1009', 450.0000, N'SONY PS5')
INSERT [dbo].[Facturas] ([Facturas], [Cliente], [ID Vendedor], [Costo], [Articulo]) VALUES (NULL, N'DANIEL RICCIARDO', N'1008', 200.0000, N'LG VELVET')
INSERT [dbo].[Facturas] ([Facturas], [Cliente], [ID Vendedor], [Costo], [Articulo]) VALUES (NULL, N'JULIO CASAS', N'1007', 750.0000, N'APPLE IPHONE 13')
INSERT [dbo].[Facturas] ([Facturas], [Cliente], [ID Vendedor], [Costo], [Articulo]) VALUES (NULL, N'LEWIS LECLERC', N'1006', 750.0000, N'SAMGUN NOTE 20')
INSERT [dbo].[Facturas] ([Facturas], [Cliente], [ID Vendedor], [Costo], [Articulo]) VALUES (NULL, N'RICARDO SOSA', N'1005', 250.0000, N'HP PAVILION')
INSERT [dbo].[Facturas] ([Facturas], [Cliente], [ID Vendedor], [Costo], [Articulo]) VALUES (NULL, N'ROBERTO JIMENEZ', N'1004', 1200.0000, N'ALIENWARE X15')
INSERT [dbo].[Facturas] ([Facturas], [Cliente], [ID Vendedor], [Costo], [Articulo]) VALUES (NULL, N'ROSA MELANO', N'1003', 350.0000, N'XBOX ONE X')
INSERT [dbo].[Facturas] ([Facturas], [Cliente], [ID Vendedor], [Costo], [Articulo]) VALUES (NULL, N'SATURNO PEREZ', N'1002', 325.0000, N'APPLEWATCH')
INSERT [dbo].[Facturas] ([Facturas], [Cliente], [ID Vendedor], [Costo], [Articulo]) VALUES (NULL, N'TOMMY HOLLAND', N'1001', 1250.0000, N'APPLE MACBOOK PRO')
GO
SET IDENTITY_INSERT [dbo].[Suplidor] ON 

INSERT [dbo].[Suplidor] ([Suplidor], [Empresa], [Ubicacion]) VALUES (8, N'ALIENWARE', N'USA')
INSERT [dbo].[Suplidor] ([Suplidor], [Empresa], [Ubicacion]) VALUES (1, N'APPLE', N'USA')
INSERT [dbo].[Suplidor] ([Suplidor], [Empresa], [Ubicacion]) VALUES (7, N'HP', N'USA')
INSERT [dbo].[Suplidor] ([Suplidor], [Empresa], [Ubicacion]) VALUES (5, N'LG ', N'KOREA')
INSERT [dbo].[Suplidor] ([Suplidor], [Empresa], [Ubicacion]) VALUES (2, N'MICROSOFT', N'USA')
INSERT [dbo].[Suplidor] ([Suplidor], [Empresa], [Ubicacion]) VALUES (11, N'ONEPLUS', N'CHINA')
INSERT [dbo].[Suplidor] ([Suplidor], [Empresa], [Ubicacion]) VALUES (9, N'PANASONIC', N'JAPON')
INSERT [dbo].[Suplidor] ([Suplidor], [Empresa], [Ubicacion]) VALUES (4, N'SAMSUNG', N'KOREA')
INSERT [dbo].[Suplidor] ([Suplidor], [Empresa], [Ubicacion]) VALUES (6, N'SONY', N'JAPON')
INSERT [dbo].[Suplidor] ([Suplidor], [Empresa], [Ubicacion]) VALUES (10, N'XIAOMI', N'CHINA')
SET IDENTITY_INSERT [dbo].[Suplidor] OFF
GO
SET IDENTITY_INSERT [dbo].[Vendedor] ON 

INSERT [dbo].[Vendedor] ([Vendedor], [Nombre], [Apellido], [ID]) VALUES (1, N'LUIS', N'CAMPUSANO', N'1001')
INSERT [dbo].[Vendedor] ([Vendedor], [Nombre], [Apellido], [ID]) VALUES (2, N'JORGE ', N'CEBALLOS', N'1002')
INSERT [dbo].[Vendedor] ([Vendedor], [Nombre], [Apellido], [ID]) VALUES (3, N'CARLA ', N'CABRERA', N'1003')
INSERT [dbo].[Vendedor] ([Vendedor], [Nombre], [Apellido], [ID]) VALUES (4, N'ONIEL ', N'MATEO', N'1004')
INSERT [dbo].[Vendedor] ([Vendedor], [Nombre], [Apellido], [ID]) VALUES (5, N'LUIS ', N'VENTURA', N'1005')
INSERT [dbo].[Vendedor] ([Vendedor], [Nombre], [Apellido], [ID]) VALUES (7, N'JOEL ', N'PICHARDO', N'1006')
INSERT [dbo].[Vendedor] ([Vendedor], [Nombre], [Apellido], [ID]) VALUES (8, N'MISAEL ', N'MARTINEZ', N'1007')
INSERT [dbo].[Vendedor] ([Vendedor], [Nombre], [Apellido], [ID]) VALUES (9, N'JOAQUIN ', N'PEREZ', N'1008')
INSERT [dbo].[Vendedor] ([Vendedor], [Nombre], [Apellido], [ID]) VALUES (10, N'GUSTAVO', N'DIAZ', N'1009')
INSERT [dbo].[Vendedor] ([Vendedor], [Nombre], [Apellido], [ID]) VALUES (11, N'ELVIN ', N'CARO', N'1010')
SET IDENTITY_INSERT [dbo].[Vendedor] OFF
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [FK_Facturas_Vendedor] FOREIGN KEY([ID Vendedor])
REFERENCES [dbo].[Vendedor] ([ID])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [FK_Facturas_Vendedor]
GO
USE [master]
GO
ALTER DATABASE [sebs] SET  READ_WRITE 
GO
