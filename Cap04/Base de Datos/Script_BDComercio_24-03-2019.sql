USE [master]
GO
/****** Object:  Database [dbComercio]    Script Date: 24/03/2019 07:09:40 a.m. ******/
CREATE DATABASE [dbComercio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbComercio', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbComercio.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbComercio_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\dbComercio_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbComercio] SET COMPATIBILITY_LEVEL = 110
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
ALTER DATABASE [dbComercio] SET AUTO_CREATE_STATISTICS ON 
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
ALTER DATABASE [dbComercio] SET  ENABLE_BROKER 
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
ALTER DATABASE [dbComercio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbComercio', N'ON'
GO
USE [dbComercio]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 24/03/2019 07:09:40 a.m. ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 24/03/2019 07:09:40 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[ClienteID] [int] IDENTITY(1,1) NOT NULL,
	[NombresApellidos] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[ClienteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 24/03/2019 07:09:40 a.m. ******/
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
/****** Object:  Table [dbo].[Marca]    Script Date: 24/03/2019 07:09:40 a.m. ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 24/03/2019 07:09:40 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UnidadMedida]    Script Date: 24/03/2019 07:09:40 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 24/03/2019 07:09:40 a.m. ******/
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
/****** Object:  Table [dbo].[Venta]    Script Date: 24/03/2019 07:09:40 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[VentaID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NULL,
	[Total] [decimal](18, 0) NULL,
	[ClienteID] [int] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[VentaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VentaDetalle]    Script Date: 24/03/2019 07:09:40 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VentaDetalle](
	[VentaDetalleID] [int] IDENTITY(1,1) NOT NULL,
	[VentaID] [int] NOT NULL,
	[ProductoID] [int] NULL,
	[Precio] [decimal](18, 0) NULL,
	[Cantidad] [decimal](18, 0) NULL,
	[SubTotal] [decimal](18, 0) NULL,
 CONSTRAINT [PK_VentaDetalle] PRIMARY KEY CLUSTERED 
(
	[VentaDetalleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([CategoriaID], [Nombre], [Descripcion], [Estado]) VALUES (1, N'Electrodomesticos', N'Electrodomesticos', 1)
INSERT [dbo].[Categoria] ([CategoriaID], [Nombre], [Descripcion], [Estado]) VALUES (9, N'Muebles', N'Muebles', 1)
INSERT [dbo].[Categoria] ([CategoriaID], [Nombre], [Descripcion], [Estado]) VALUES (16, N'Utensilios', N'Utensilios', 0)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([ClienteID], [NombresApellidos]) VALUES (1, N'Juan Perez')
INSERT [dbo].[Cliente] ([ClienteID], [NombresApellidos]) VALUES (2, N'Susana Torres')
INSERT [dbo].[Cliente] ([ClienteID], [NombresApellidos]) VALUES (3, N'Rodrigo Soto')
INSERT [dbo].[Cliente] ([ClienteID], [NombresApellidos]) VALUES (4, N'Maria Campos')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
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

INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (2, N'00-2', N'Refrigeradora', 1, 1, 1, CAST(520.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'd54986da-4aa3-4502-a9ef-022cec0b4ba5', CAST(0x0000A9E900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (3, N'00-3', N'Microondas', 1, 2, 1, CAST(200.00 AS Decimal(18, 2)), CAST(250.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'0e1af221-57ca-44df-855c-d1e3086e1afe', CAST(0x0000A9E900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (4, N'00-4', N'Olla arrocera', 1, 1, 1, CAST(120.00 AS Decimal(18, 2)), CAST(150.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, N'9b491f3d-ed13-41ec-930d-c9b688a12e00', CAST(0x0000A9F000935850 AS DateTime), N'81d5b496-fbc8-4652-9d91-a05405126494', CAST(0x0000A9F000936618 AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (5, N'00-5', N'Congeladora', 1, 3, 1, CAST(2000.00 AS Decimal(18, 2)), CAST(2300.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, N'2a2899e1-b19c-4fcc-8a29-7138fb5ab88d', CAST(0x0000A9F0009384D8 AS DateTime), N'854dacda-74b8-4316-954d-2e4439fd6dac', CAST(0x0000A9F000939E85 AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (6, N'00-6', N'Lavadora', 1, 3, 1, CAST(520.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'd54986da-4aa3-4502-a9ef-022cec0b4ba5', CAST(0x0000A9E900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (7, N'00-7', N'Juego de ollas', 16, 5, 1, CAST(10.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'0e1af221-57ca-44df-855c-d1e3086e1afe', CAST(0x0000A9E900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (8, N'00-8', N'Set de cubiertos', 16, 5, 1, CAST(25.00 AS Decimal(18, 2)), CAST(35.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, N'9b491f3d-ed13-41ec-930d-c9b688a12e00', CAST(0x0000A9F000935850 AS DateTime), N'81d5b496-fbc8-4652-9d91-a05405126494', CAST(0x0000A9F000936618 AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (9, N'00-9', N'Juego de sillas para comedor', 9, 5, 1, CAST(550.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, N'2a2899e1-b19c-4fcc-8a29-7138fb5ab88d', CAST(0x0000A9F0009384D8 AS DateTime), N'854dacda-74b8-4316-954d-2e4439fd6dac', CAST(0x0000A9F000939E85 AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (10, N'00-10', N'Mini refrigeradora', 1, 1, 1, CAST(700.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'd54986da-4aa3-4502-a9ef-022cec0b4ba5', CAST(0x0000A9E900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (11, N'00-11', N'Thermo', 1, 2, 1, CAST(85.50 AS Decimal(18, 2)), CAST(99.50 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'0e1af221-57ca-44df-855c-d1e3086e1afe', CAST(0x0000A9E900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (12, N'00-12', N'Sarten electrica', 1, 1, 1, CAST(80.00 AS Decimal(18, 2)), CAST(120.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, N'9b491f3d-ed13-41ec-930d-c9b688a12e00', CAST(0x0000A9F000935850 AS DateTime), N'81d5b496-fbc8-4652-9d91-a05405126494', CAST(0x0000A9F000936618 AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (13, N'00-13', N'Licuadora', 1, 3, 1, CAST(200.00 AS Decimal(18, 2)), CAST(240.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, N'2a2899e1-b19c-4fcc-8a29-7138fb5ab88d', CAST(0x0000A9F0009384D8 AS DateTime), N'854dacda-74b8-4316-954d-2e4439fd6dac', CAST(0x0000A9F000939E85 AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (14, N'00-14', N'Extractor', 1, 3, 1, CAST(520.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'd54986da-4aa3-4502-a9ef-022cec0b4ba5', CAST(0x0000A9E900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (15, N'00-15', N'Set de sabanas', 16, 5, 1, CAST(150.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'0e1af221-57ca-44df-855c-d1e3086e1afe', CAST(0x0000A9E900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (16, N'00-16', N'Juego de almohadas', 16, 5, 1, CAST(70.00 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, N'9b491f3d-ed13-41ec-930d-c9b688a12e00', CAST(0x0000A9F000935850 AS DateTime), N'81d5b496-fbc8-4652-9d91-a05405126494', CAST(0x0000A9F000936618 AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (17, N'00-17', N'Juego de frazadas', 9, 5, 1, CAST(50.00 AS Decimal(18, 2)), CAST(80.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, N'2a2899e1-b19c-4fcc-8a29-7138fb5ab88d', CAST(0x0000A9F0009384D8 AS DateTime), N'854dacda-74b8-4316-954d-2e4439fd6dac', CAST(0x0000A9F000939E85 AS DateTime))
SET IDENTITY_INSERT [dbo].[Producto] OFF
SET IDENTITY_INSERT [dbo].[UnidadMedida] ON 

INSERT [dbo].[UnidadMedida] ([UnidadMedidaID], [Nombre]) VALUES (1, N'aaaaaacccc')
SET IDENTITY_INSERT [dbo].[UnidadMedida] OFF
INSERT [dbo].[Usuario] ([UsuarioID], [Login], [Password], [Roles], [Nombres], [Apellidos], [Email]) VALUES (1, N'admin', N'admin', N'Admin', N'Astrid', N'Carrasco Jesus', N'astrid.carrasco.jesus@gmail.com')
INSERT [dbo].[Usuario] ([UsuarioID], [Login], [Password], [Roles], [Nombres], [Apellidos], [Email]) VALUES (2, N'operador', N'operador', N'Operador', N'Pedro', N'Diaz', N'pdiaz@gmail.com')
INSERT [dbo].[Usuario] ([UsuarioID], [Login], [Password], [Roles], [Nombres], [Apellidos], [Email]) VALUES (3, N'sistemas', N'sistemas', N'Admin;Operador', N'Juan', N'Torres', N'jtorres@gmail.com')
SET IDENTITY_INSERT [dbo].[Venta] ON 

INSERT [dbo].[Venta] ([VentaID], [Fecha], [Total], [ClienteID]) VALUES (1, CAST(0x00000000 AS Date), CAST(0 AS Decimal(18, 0)), 3)
SET IDENTITY_INSERT [dbo].[Venta] OFF
SET IDENTITY_INSERT [dbo].[VentaDetalle] ON 

INSERT [dbo].[VentaDetalle] ([VentaDetalleID], [VentaID], [ProductoID], [Precio], [Cantidad], [SubTotal]) VALUES (1, 1, 14, CAST(450 AS Decimal(18, 0)), CAST(5 AS Decimal(18, 0)), CAST(2250 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[VentaDetalle] OFF
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
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([ClienteID])
REFERENCES [dbo].[Cliente] ([ClienteID])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Producto] FOREIGN KEY([ProductoID])
REFERENCES [dbo].[Producto] ([ProductoID])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Producto]
GO
ALTER TABLE [dbo].[VentaDetalle]  WITH CHECK ADD  CONSTRAINT [FK_VentaDetalle_Venta] FOREIGN KEY([VentaID])
REFERENCES [dbo].[Venta] ([VentaID])
GO
ALTER TABLE [dbo].[VentaDetalle] CHECK CONSTRAINT [FK_VentaDetalle_Venta]
GO
USE [master]
GO
ALTER DATABASE [dbComercio] SET  READ_WRITE 
GO
