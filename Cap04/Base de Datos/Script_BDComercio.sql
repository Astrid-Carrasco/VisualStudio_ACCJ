USE [dbComercio]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_UnidadMedida]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Marca]
GO
ALTER TABLE [dbo].[Producto] DROP CONSTRAINT [FK_Producto_Categoria]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 3/03/2019 13:53:18 ******/
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[UnidadMedida]    Script Date: 3/03/2019 13:53:18 ******/
DROP TABLE [dbo].[UnidadMedida]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 3/03/2019 13:53:18 ******/
DROP TABLE [dbo].[Producto]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 3/03/2019 13:53:18 ******/
DROP TABLE [dbo].[Marca]
GO
/****** Object:  Table [dbo].[Comentario]    Script Date: 3/03/2019 13:53:18 ******/
DROP TABLE [dbo].[Comentario]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 3/03/2019 13:53:18 ******/
DROP TABLE [dbo].[Categoria]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 3/03/2019 13:53:18 ******/
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
/****** Object:  Table [dbo].[Comentario]    Script Date: 3/03/2019 13:53:19 ******/
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
/****** Object:  Table [dbo].[Marca]    Script Date: 3/03/2019 13:53:19 ******/
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
/****** Object:  Table [dbo].[Producto]    Script Date: 3/03/2019 13:53:19 ******/
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
/****** Object:  Table [dbo].[UnidadMedida]    Script Date: 3/03/2019 13:53:19 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 3/03/2019 13:53:19 ******/
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

INSERT [dbo].[Categoria] ([CategoriaID], [Nombre], [Descripcion], [Estado]) VALUES (1, N'Televisores', N'Televisores LED', 1)
INSERT [dbo].[Categoria] ([CategoriaID], [Nombre], [Descripcion], [Estado]) VALUES (9, N'Impresoras', N'Impresoras tinta liquida', 1)
INSERT [dbo].[Categoria] ([CategoriaID], [Nombre], [Descripcion], [Estado]) VALUES (16, N'Alimentos ', N'Alimentos saludables', 0)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
SET IDENTITY_INSERT [dbo].[Comentario] ON 

INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (1, N'Pedro', N'Sanchez Ramos', N'test@gmail.com', N'test                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (2, N'Juan', N'Perez', N'jperez@gmail.com', N'Favor de reenviar informacion a mi correo                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ')
INSERT [dbo].[Comentario] ([ComentarioID], [Nombres], [Apellidos], [Correo], [Opinion]) VALUES (7, N'Juan', N'Sanchez Ramos', N'jperez@gmail.com', N'
<p>0000</p>
sss                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  ')
SET IDENTITY_INSERT [dbo].[Comentario] OFF
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([MarcaID], [Nombre], [Descripcion], [Estado]) VALUES (1, N'SAMSUNG', N'SAMSUNG', 1)
INSERT [dbo].[Marca] ([MarcaID], [Nombre], [Descripcion], [Estado]) VALUES (2, N'HP', N'HP', 1)
SET IDENTITY_INSERT [dbo].[Marca] OFF
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (2, N'0001', N'televisor', 1, 1, 1, CAST(520.00 AS Decimal(18, 2)), CAST(450.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 1, N'd54986da-4aa3-4502-a9ef-022cec0b4ba5', CAST(N'2019-02-03T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (3, N'0002', N'impresora', 9, 2, 1, CAST(800.00 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 1, N'0e1af221-57ca-44df-855c-d1e3086e1afe', CAST(N'2019-02-03T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (4, N'00000058', N'television negro', 1, 1, 1, CAST(2500.00 AS Decimal(18, 2)), CAST(1800.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)), 0, N'9b491f3d-ed13-41ec-930d-c9b688a12e00', CAST(N'2019-02-10T08:56:28.000' AS DateTime), N'81d5b496-fbc8-4652-9d91-a05405126494', CAST(N'2019-02-10T08:56:39.760' AS DateTime))
INSERT [dbo].[Producto] ([ProductoID], [ProductoCode], [Nombre], [CategoriaID], [MarcaID], [UnidadMedidaID], [PrecioMayor], [PrecioMenor], [StockActual], [StockMinimo], [Estado], [UsuarioCreador], [FechaCreacion], [UsuarioModificador], [FechaModificacion]) VALUES (5, N'000005555', N'impresora azul', 9, 2, 1, CAST(2500.00 AS Decimal(18, 2)), CAST(15800.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), 0, N'2a2899e1-b19c-4fcc-8a29-7138fb5ab88d', CAST(N'2019-02-10T08:57:06.000' AS DateTime), N'854dacda-74b8-4316-954d-2e4439fd6dac', CAST(N'2019-02-10T08:57:27.910' AS DateTime))
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
