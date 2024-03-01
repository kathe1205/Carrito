USE [master]
GO

/****** Object:  Database [carrito]    Script Date: 29/02/2024 8:58:10 p. m. ******/
CREATE DATABASE [carrito]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'carrito', FILENAME = N'C:\\Program Files\\Microsoft SQL Server\\MSSQL16.MSSQLSERVER\\MSSQL\\DATA\\carrito.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'carrito_log', FILENAME = N'C:\\Program Files\\Microsoft SQL Server\\MSSQL16.MSSQLSERVER\\MSSQL\\DATA\\carrito_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

ALTER DATABASE [carrito] SET COMPATIBILITY_LEVEL = 160
GO

CREATE TABLE [dbo].[Detalles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_venta] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_u] [int] NOT NULL,
	[estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Detalles__3213E83FC356226C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Productos]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[stock] [int] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[estado] [varchar](10) NOT NULL,
	[precio] [int] NOT NULL,
	[imagen] [text] NOT NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Proveedores]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Proveedores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Proveedores] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Roles]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_rol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Usuarios]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contrasenia] [varchar](50) NOT NULL,
	[id_rol] [int] NOT NULL,
	[estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Ventas]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ventas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Ventas] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Detalles]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Detalles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_venta] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_u] [int] NOT NULL,
	[estado] [varchar](10) NOT NULL,
 CONSTRAINT [PK__Detalles__3213E83FC356226C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Detalles]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET IDENTITY_INSERT [dbo].[Detalles] ON 
INSERT [dbo].[Detalles] ([id], [id_venta], [id_producto], [cantidad], [precio_u], [estado]) VALUES (1, 3, 1, 1, 200, N'Activado')
SET IDENTITY_INSERT [dbo].[Detalles] OFF
GO

/****** Object:  Table [dbo].[Productos]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET IDENTITY_INSERT [dbo].[Productos] ON 
INSERT [dbo].[Productos] ([id], [nombre], [descripcion], [stock], [id_proveedor], [estado], [precio], [imagen]) VALUES (1, N'pantalon', N'pantalon de algodon, verde', 80, 2, N'Activo', 200, N'pantalon')
SET IDENTITY_INSERT [dbo].[Productos] OFF
GO

/****** Object:  Table [dbo].[Proveedores]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET IDENTITY_INSERT [dbo].[Proveedores] ON 
INSERT [dbo].[Proveedores] ([id], [nombre], [estado]) VALUES (2, N'proveedor1', N'Activado')
SET IDENTITY_INSERT [dbo].[Proveedores] OFF
GO

/****** Object:  Table [dbo].[Roles]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET IDENTITY_INSERT [dbo].[Roles] ON 
INSERT [dbo].[Roles] ([id], [nombre_rol]) VALUES (1, N'Administrador')
INSERT [dbo].[Roles] ([id], [nombre_rol]) VALUES (2, N'Usuario')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO

/****** Object:  Table [dbo].[Usuarios]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET IDENTITY_INSERT [dbo].[Usuarios] ON 
INSERT [dbo].[Usuarios] ([id], [nombre], [apellido], [usuario], [contrasenia], [id_rol], [estado]) VALUES (1, N'katherin', N'perez', N'adminkathe', N'1234', 1, N'Activo')
INSERT [dbo].[Usuarios] ([id], [nombre], [apellido], [usuario], [contrasenia], [id_rol], [estado]) VALUES (2, N'david', N'parra', N'davidp', N'12345', 2, N'Activo')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO

/****** Object:  Table [dbo].[Ventas]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET IDENTITY_INSERT [dbo].[Ventas] ON 
INSERT [dbo].[Ventas] ([id], [fecha], [id_usuario], [estado]) VALUES (3, CAST(N'2024-02-29' AS Date), 2, N'Activado')
SET IDENTITY_INSERT [dbo].[Ventas] OFF
GO

/****** Object:  Table [dbo].[Detalles]    Script Date: 29/02/2024 8:58:11 p. m. ******/
SET IDENTITY_INSERT [dbo].[Detalles] ON 
INSERT [dbo].[Detalles] ([id], [id_venta], [id_producto], [cantidad], [precio_u], [estado]) VALUES (2, 3, 2, 2, 300, N'Activado')
SET IDENTITY_INSERT [dbo].[Detalles] OFF
GO
