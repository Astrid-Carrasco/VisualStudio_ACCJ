USE [dbComercio]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_UnidadMedida]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Marca]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Categoria]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/03/2019 14:05:08 ******/
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[UnidadMedida]    Script Date: 17/03/2019 14:05:08 ******/
DROP TABLE [dbo].[UnidadMedida]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 17/03/2019 14:05:08 ******/
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 17/03/2019 14:05:08 ******/
DROP TABLE [dbo].[Marca]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 17/03/2019 14:05:08 ******/
DROP TABLE [dbo].[Comentario]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 17/03/2019 14:05:08 ******/
DROP TABLE [dbo].[Categoria]
GO
USE [master]
GO
/****** Object:  Database [dbComercio]    Script Date: 17/03/2019 14:05:08 ******/
DROP DATABASE [dbComercio]
GO
/****** Object:  Database [dbComercio]    Script Date: 17/03/2019 14:05:08 ******/
CREATE DATABASE [dbComercio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbComercio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\dbComercio.mdf' , SIZE = 335872KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbComercio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\dbComercio_log.ldf' , SIZE = 1581056KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbComercio] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbComercio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbComercio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbComercio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbComercio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbComercio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbComercio] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbComercio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbComercio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbComercio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbComercio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbComercio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbComercio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbComercio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbComercio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbComercio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbComercio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbComercio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbComercio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbComercio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbComercio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbComercio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbComercio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbComercio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbComercio] SET RECOVERY FULL 
GO
ALTER DATABASE [dbComercio] SET  MULTI_USER 
GO
ALTER DATABASE [dbComercio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbComercio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbComercio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbComercio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbComercio] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbComercio', N'ON'
GO
ALTER DATABASE [dbComercio] SET QUERY_STORE = OFF
GO
USE [dbComercio]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [dbComercio]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 17/03/2019 14:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 17/03/2019 14:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentario](
	[ComentarioID] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [nvarchar](50) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Opinion] [nchar](500) NOT NULL,
 CONSTRAINT [PK_Comentario] PRIMARY KEY CLUSTERED 
(
	[ComentarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marca]    Script Date: 17/03/2019 14:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[MarcaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[MarcaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 17/03/2019 14:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[ProductoCode] [nvarchar](50) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[CategoriaID] [int] NOT NULL,
	[MarcaID] [int] NOT NULL,
	[UnidadMedidaID] [int] NOT NULL,
	[PrecioMayor] [decimal](18, 2) NOT NULL,
	[PrecioMenor] [decimal](18, 2) NOT NULL,
	[StockActual] [decimal](18, 2) NOT NULL,
	[StockMinimo] [decimal](18, 2) NOT NULL,
	[Estado] [bit] NOT NULL,
	[UsuarioCreador] [uniqueidentifier] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioModificador] [uniqueidentifier] NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnidadMedida]    Script Date: 17/03/2019 14:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnidadMedida](
	[UnidadMedidaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UnidadMedida] PRIMARY KEY CLUSTERED 
(
	[UnidadMedidaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 17/03/2019 14:05:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[UsuarioID] [int] NOT NULL,
	[Login] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Roles] [nvarchar](200) NULL,
	[Nombres] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([CategoriaID], [Nombre], [Descripcion], [Estado]) VALUES (1, N'Electrodomesticos', N'Electrodomesticos', 1)
INSERT [dbo].[Categoria] ([CategoriaID], [Nombre], [Descripcion], [Estado]) VALUES (9, N'Muebles', N'Muebles', 1)
INSERT [dbo].[Categoria] ([CategoriaID], [Nombre], [Descripcion], [Estado]) VALUES (16, N'Utensilios', N'Utensilios', 0)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (1, N'Pedro', N'Sanchez Ramos', N'test@gmail.com', N'test                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (2, N'Juan', N'Perez', N'jperez@gmail.com', N'Favor de reenviar informacion a mi correo                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (7, N'Juan', N'Sanchez Ramos', N'jperez@gmail.com', N'
<p>0000</p>
sss                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (8, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (9, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (10, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (11, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (12, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (13, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (14, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (15, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (16, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (17, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (18, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (19, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (20, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (21, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (22, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (23, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (24, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (25, N'c:/Windows/system.ini', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (27, N'c:\Windows\system.ini', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (29, N'ZAP', N'c:/Windows/system.ini', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (30, N'ZAP', N'ZAP', N'c:/Windows/system.ini', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (31, N'ZAP', N'ZAP', N'ZAP', N'c:/Windows/system.ini                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (32, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (33, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (34, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (35, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (36, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (37, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (38, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (39, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (40, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (41, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (42, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (43, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (44, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (45, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (46, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (47, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (48, N'ZAP', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (49, N'c:/Windows/system.ini', N'ZAP', N'ZAP', N'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    ')
SET IDENTITY_INSERT [dbo].[Comentario] OFF
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([MarcaID], [Nombre], [Descripcion], [Estado]) VALUES (1, N'LG', N'LG', 1)
INSERT [dbo].[Marca] ([MarcaID], [Nombre], [Descripcion], [Estado]) VALUES (2, N'Oster', N'Oster', 1)
INSERT [dbo].[Marca] ([MarcaID], [Nombre], [Descripcion], [Estado]) VALUES (3, N'Mave', N'Mave', 1)
INSERT [dbo].[Marca] ([MarcaID], [Nombre], [Descripcion], [Estado]) VALUES (5, N'Thomson', N'Thomson', 1)
SET IDENTITY_INSERT [dbo].[Marca] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (2, N'00-2', N'Refrigeradora', 1, 1, 1, CAST(520.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'd54986da-4aa3-4502-a9ef-022cec0b4ba5', CAST(N'2019-02-03T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (3, N'00-3', N'Microondas', 1, 2, 1, CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'0e1af221-57ca-44df-855c-d1e3086e1afe', CAST(N'2019-02-03T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (4, N'00-4', N'Olla arrocera', 1, 1, 1, CAST(120.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, N'9b491f3d-ed13-41ec-930d-c9b688a12e00', CAST(N'2019-02-10T08:56:28.000' AS DateTime), N'81d5b496-fbc8-4652-9d91-a05405126494', CAST(N'2019-02-10T08:56:39.760' AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (5, N'00-5', N'Congeladora', 1, 3, 1, CAST(2000.00 AS Decimal(18, 2)), CAST(2300.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, N'2a2899e1-b19c-4fcc-8a29-7138fb5ab88d', CAST(N'2019-02-10T08:57:06.000' AS DateTime), N'854dacda-74b8-4316-954d-2e4439fd6dac', CAST(N'2019-02-10T08:57:27.910' AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (6, N'00-6', N'Lavadora', 1, 3, 1, CAST(520.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'd54986da-4aa3-4502-a9ef-022cec0b4ba5', CAST(N'2019-02-03T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (7, N'00-7', N'Juego de ollas', 16, 5, 1, CAST(10.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'0e1af221-57ca-44df-855c-d1e3086e1afe', CAST(N'2019-02-03T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (8, N'00-8', N'Set de cubiertos', 16, 5, 1, CAST(25.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, N'9b491f3d-ed13-41ec-930d-c9b688a12e00', CAST(N'2019-02-10T08:56:28.000' AS DateTime), N'81d5b496-fbc8-4652-9d91-a05405126494', CAST(N'2019-02-10T08:56:39.760' AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (9, N'00-9', N'Juego de sillas para comedor', 9, 5, 1, CAST(550.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, N'2a2899e1-b19c-4fcc-8a29-7138fb5ab88d', CAST(N'2019-02-10T08:57:06.000' AS DateTime), N'854dacda-74b8-4316-954d-2e4439fd6dac', CAST(N'2019-02-10T08:57:27.910' AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (10, N'00-10', N'Mini refrigeradora', 1, 1, 1, CAST(700.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'd54986da-4aa3-4502-a9ef-022cec0b4ba5', CAST(N'2019-02-03T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (11, N'00-11', N'Thermo', 1, 2, 1, CAST(85.50 AS Decimal(18, 2)), CAST(99.50 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'0e1af221-57ca-44df-855c-d1e3086e1afe', CAST(N'2019-02-03T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (12, N'00-12', N'Sarten electrica', 1, 1, 1, CAST(80.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, N'9b491f3d-ed13-41ec-930d-c9b688a12e00', CAST(N'2019-02-10T08:56:28.000' AS DateTime), N'81d5b496-fbc8-4652-9d91-a05405126494', CAST(N'2019-02-10T08:56:39.760' AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (13, N'00-13', N'Licuadora', 1, 3, 1, CAST(200.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, N'2a2899e1-b19c-4fcc-8a29-7138fb5ab88d', CAST(N'2019-02-10T08:57:06.000' AS DateTime), N'854dacda-74b8-4316-954d-2e4439fd6dac', CAST(N'2019-02-10T08:57:27.910' AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (14, N'00-14', N'Extractor', 1, 3, 1, CAST(520.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'd54986da-4aa3-4502-a9ef-022cec0b4ba5', CAST(N'2019-02-03T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (15, N'00-15', N'Set de sabanas', 16, 5, 1, CAST(150.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'0e1af221-57ca-44df-855c-d1e3086e1afe', CAST(N'2019-02-03T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (16, N'00-16', N'Juego de almohadas', 16, 5, 1, CAST(70.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, N'9b491f3d-ed13-41ec-930d-c9b688a12e00', CAST(N'2019-02-10T08:56:28.000' AS DateTime), N'81d5b496-fbc8-4652-9d91-a05405126494', CAST(N'2019-02-10T08:56:39.760' AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (17, N'00-17', N'Juego de frazadas', 9, 5, 1, CAST(50.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, N'2a2899e1-b19c-4fcc-8a29-7138fb5ab88d', CAST(N'2019-02-10T08:57:06.000' AS DateTime), N'854dacda-74b8-4316-954d-2e4439fd6dac', CAST(N'2019-02-10T08:57:27.910' AS DateTime))
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[UnidadMedida] ON 

INSERT [dbo].[UnidadMedida] ([UnidadMedidaID], [Nombre]) VALUES (1, N'aaaaaacccc')
SET IDENTITY_INSERT [dbo].[UnidadMedida] OFF
INSERT [dbo].[Usuario] ([UsuarioID], [Login], [Password], [Roles], [Nombres], [Apellidos], [Email]) VALUES (1, N'admin', N'admin', N'Admin', N'Astrid', N'Carrasco Jesus', N'astrid.carrasco.jesus@gmail.com')
INSERT [dbo].[Usuario] ([UsuarioID], [Login], [Password], [Roles], [Nombres], [Apellidos], [Email]) VALUES (2, N'operador', N'operador', N'Operador', N'Pedro', N'Diaz', N'pdiaz@gmail.com')
INSERT [dbo].[Usuario] ([UsuarioID], [Login], [Password], [Roles], [Nombres], [Apellidos], [Email]) VALUES (3, N'sistemas', N'sistemas', N'Admin;Operador', N'Juan', N'Torres', N'jtorres@gmail.com')
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[Categoria] ([CategoriaID])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Marca] FOREIGN KEY([MarcaID])
REFERENCES [dbo].[Marca] ([MarcaID])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Marca]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_UnidadMedida] FOREIGN KEY([UnidadMedidaID])
REFERENCES [dbo].[UnidadMedida] ([UnidadMedidaID])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_UnidadMedida]
GO
USE [master]
GO
ALTER DATABASE [dbComercio] SET  READ_WRITE 
GO
