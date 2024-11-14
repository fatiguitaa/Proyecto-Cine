USE [master]
GO
/****** Object:  Database [Cine_G01]    Script Date: 14/11/2024 03:21:34 ******/
CREATE DATABASE [Cine_G01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cine_G01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Cine_G01.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cine_G01_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Cine_G01_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Cine_G01] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cine_G01].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cine_G01] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cine_G01] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cine_G01] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cine_G01] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cine_G01] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cine_G01] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cine_G01] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cine_G01] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cine_G01] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cine_G01] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cine_G01] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cine_G01] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cine_G01] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cine_G01] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cine_G01] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Cine_G01] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cine_G01] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cine_G01] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cine_G01] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cine_G01] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cine_G01] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cine_G01] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cine_G01] SET RECOVERY FULL 
GO
ALTER DATABASE [Cine_G01] SET  MULTI_USER 
GO
ALTER DATABASE [Cine_G01] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cine_G01] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cine_G01] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cine_G01] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cine_G01] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cine_G01] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cine_G01', N'ON'
GO
ALTER DATABASE [Cine_G01] SET QUERY_STORE = ON
GO
ALTER DATABASE [Cine_G01] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Cine_G01]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[idPelicula] [int] IDENTITY(1,1) NOT NULL,
	[urlPortada] [text] NULL,
	[nombre] [varchar](30) NOT NULL,
	[fechaEstreno] [date] NOT NULL,
	[duracionMinutos] [int] NOT NULL,
	[sinopsis] [text] NULL,
	[idGenero] [int] NOT NULL,
	[estaActiva] [bit] NULL,
 CONSTRAINT [pkPeliculas] PRIMARY KEY CLUSTERED 
(
	[idPelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Idiomas]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Idiomas](
	[idIdioma] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [pkIdiomas] PRIMARY KEY CLUSTERED 
(
	[idIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reproducciones]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reproducciones](
	[idReproduccion] [int] IDENTITY(1,1) NOT NULL,
	[numeroSala] [int] NOT NULL,
	[horarioInicio] [smalldatetime] NOT NULL,
	[idPelicula] [int] NOT NULL,
	[idIdioma] [int] NOT NULL,
 CONSTRAINT [pkReproducciones] PRIMARY KEY CLUSTERED 
(
	[idReproduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promociones]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promociones](
	[idPromocion] [int] IDENTITY(0,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[descuento] [decimal](18, 0) NOT NULL,
 CONSTRAINT [pkPromociones] PRIMARY KEY CLUSTERED 
(
	[idPromocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFacturas]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFacturas](
	[idDetalleFacturas] [int] IDENTITY(1,1) NOT NULL,
	[precio] [int] NOT NULL,
	[idFactura] [int] NOT NULL,
	[idAsiento] [int] NOT NULL,
	[idReproduccion] [int] NOT NULL,
	[idPromocion] [int] NOT NULL,
 CONSTRAINT [pkDetalleFacturas] PRIMARY KEY CLUSTERED 
(
	[idDetalleFacturas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_IngresosPorPelicula]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_IngresosPorPelicula] AS
SELECT 
    p.idPelicula,
    p.nombre AS Pelicula,
    i.nombre AS Idioma,
    COUNT(r.idReproduccion) AS TotalReproducciones,
    SUM(df.precio - df.precio * (pr.descuento / 100)) AS IngresoIdioma,
    SUM(SUM(df.precio - df.precio * (pr.descuento / 100))) OVER (PARTITION BY p.idPelicula) AS IngresoTotal
FROM Peliculas p
FULL JOIN Reproducciones r ON p.idPelicula = r.idPelicula
FULL JOIN Idiomas i ON r.idIdioma = i.idIdioma
FULL JOIN DetalleFacturas df ON r.idReproduccion = df.idReproduccion
FULL JOIN Promociones pr ON pr.idPromocion = df.idPromocion
WHERE p.idPelicula IN (
    SELECT r.idPelicula 
    FROM Reproducciones AS r
    GROUP BY r.idPelicula
    HAVING COUNT(DISTINCT r.idIdioma) > 1
)
GROUP BY p.idPelicula, p.nombre, i.nombre;
GO
/****** Object:  Table [dbo].[Salas]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salas](
	[numeroSala] [int] IDENTITY(1,1) NOT NULL,
	[idTipoSala] [int] NOT NULL,
 CONSTRAINT [pkSalas] PRIMARY KEY CLUSTERED 
(
	[numeroSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Filas]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Filas](
	[idFila] [int] IDENTITY(1,1) NOT NULL,
	[letra] [char](1) NOT NULL,
	[numeroSala] [int] NOT NULL,
 CONSTRAINT [pkFilas] PRIMARY KEY CLUSTERED 
(
	[idFila] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asientos]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asientos](
	[idAsiento] [int] IDENTITY(1,1) NOT NULL,
	[numeroAsiento] [int] NOT NULL,
	[idFila] [int] NOT NULL,
 CONSTRAINT [pkAsientos] PRIMARY KEY CLUSTERED 
(
	[idAsiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsientosXReproducciones]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsientosXReproducciones](
	[idAsientoXReproduccion] [int] IDENTITY(1,1) NOT NULL,
	[libre] [bit] NOT NULL,
	[idAsiento] [int] NOT NULL,
	[idReproduccion] [int] NOT NULL,
 CONSTRAINT [pkAsientosXReproducciones] PRIMARY KEY CLUSTERED 
(
	[idAsientoXReproduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_AsientosXReproducciones]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[V_AsientosXReproducciones] as
	(Select P.idPelicula,R.idReproduccion,AXR.libre,A.idAsiento,S.numeroSala,F.idFila,A.numeroAsiento from Peliculas as P
	inner join Reproducciones as R on R.idPelicula = P.idPelicula
	inner join AsientosXReproducciones as AXR on AXR.idReproduccion = R.idReproduccion
	inner join Asientos as A on A.idAsiento = AXR.idAsiento
	inner join Filas as F on F.idFila = A.idFila
	inner join Salas as S on S.numeroSala = F.numeroSala)
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[telefono] [varchar](30) NOT NULL,
	[idArea] [int] NOT NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [pkEmpleados] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalasXEmpleados]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalasXEmpleados](
	[idSalaXEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[numeroSala] [int] NOT NULL,
	[idEmpleado] [int] NOT NULL,
 CONSTRAINT [pkSalasXEmpleados] PRIMARY KEY CLUSTERED 
(
	[idSalaXEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[EmpleadosEnReproduccion]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[EmpleadosEnReproduccion] as 
select E.idEmpleado from Empleados as E 
inner join SalasXEmpleados as SXE on SXE.idEmpleado=E.idEmpleado
inner join Salas as S on S.numeroSala=SXE.numeroSala
inner join Reproducciones as R on R.numeroSala=S.numeroSala
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[idArea] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [pkAreas] PRIMARY KEY CLUSTERED 
(
	[idArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carteleras]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carteleras](
	[idCartelera] [int] IDENTITY(1,1) NOT NULL,
	[fechaInicio] [datetime] NOT NULL,
	[fechaFin] [datetime] NOT NULL,
 CONSTRAINT [pkCarteleras] PRIMARY KEY CLUSTERED 
(
	[idCartelera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[edad] [int] NOT NULL,
	[telefono] [varchar](30) NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [pkClientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facturas](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[idCliente] [int] NOT NULL,
 CONSTRAINT [pkFacturas] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[idGenero] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [pkGeneros] PRIMARY KEY CLUSTERED 
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeliculasXCarteleras]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeliculasXCarteleras](
	[idPeliculaXCartelera] [int] IDENTITY(1,1) NOT NULL,
	[idPelicula] [int] NOT NULL,
	[idCartelera] [int] NOT NULL,
 CONSTRAINT [pkPeliculasXCarteleras] PRIMARY KEY CLUSTERED 
(
	[idPeliculaXCartelera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PeliculasXIdiomas]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PeliculasXIdiomas](
	[idPeliculaXIdioma] [int] IDENTITY(1,1) NOT NULL,
	[idPelicula] [int] NOT NULL,
	[idIdioma] [int] NOT NULL,
 CONSTRAINT [pkPeliculasXIdiomas] PRIMARY KEY CLUSTERED 
(
	[idPeliculaXIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TiposSalas]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiposSalas](
	[idTipoSala] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
 CONSTRAINT [pkTiposSalas] PRIMARY KEY CLUSTERED 
(
	[idTipoSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[e-mail] [varchar](320) NULL,
	[contrasenia] [varchar](50) NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Areas] ON 

INSERT [dbo].[Areas] ([idArea], [nombre]) VALUES (1, N'Taquilla')
INSERT [dbo].[Areas] ([idArea], [nombre]) VALUES (2, N'Proyección')
INSERT [dbo].[Areas] ([idArea], [nombre]) VALUES (3, N'Limpieza')
SET IDENTITY_INSERT [dbo].[Areas] OFF
GO
SET IDENTITY_INSERT [dbo].[Asientos] ON 

INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (1, 1, 1)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (2, 2, 1)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (3, 1, 2)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (4, 3, 1)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (5, 4, 1)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (6, 5, 1)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (7, 6, 1)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (8, 7, 1)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (9, 1, 2)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (10, 2, 2)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (11, 3, 2)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (12, 4, 2)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (13, 5, 2)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (14, 6, 2)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (15, 7, 2)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (16, 1, 4)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (17, 2, 4)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (18, 3, 4)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (19, 4, 4)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (20, 5, 4)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (21, 6, 4)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (22, 7, 4)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (23, 1, 5)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (24, 2, 5)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (25, 3, 5)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (26, 4, 5)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (27, 5, 5)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (28, 6, 5)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (29, 7, 5)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (30, 1, 6)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (31, 2, 6)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (32, 3, 6)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (33, 4, 6)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (34, 5, 6)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (35, 6, 6)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (36, 7, 6)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (37, 1, 3)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (38, 2, 3)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (39, 3, 3)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (40, 4, 3)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (41, 5, 3)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (42, 6, 3)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (43, 7, 3)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (44, 8, 3)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (45, 1, 7)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (46, 2, 7)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (47, 3, 7)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (48, 4, 7)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (49, 5, 7)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (50, 6, 7)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (51, 7, 7)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (52, 8, 7)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (53, 1, 8)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (54, 2, 8)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (55, 3, 8)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (56, 4, 8)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (57, 5, 8)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (58, 6, 8)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (59, 7, 8)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (60, 8, 8)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (61, 1, 9)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (62, 2, 9)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (63, 3, 9)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (64, 4, 9)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (65, 5, 9)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (66, 6, 9)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (67, 7, 9)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (68, 8, 9)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (69, 1, 10)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (70, 2, 10)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (71, 3, 10)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (72, 4, 10)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (73, 5, 10)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (74, 6, 10)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (75, 7, 10)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (76, 8, 10)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (77, 1, 11)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (78, 2, 11)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (79, 3, 11)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (80, 4, 11)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (81, 5, 11)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (82, 6, 11)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (83, 7, 11)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (84, 8, 11)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (85, 1, 12)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (86, 2, 12)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (87, 3, 12)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (88, 4, 12)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (89, 1, 13)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (90, 2, 13)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (91, 3, 13)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (92, 4, 13)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (93, 1, 14)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (94, 2, 14)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (95, 3, 14)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (96, 4, 14)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (97, 1, 15)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (98, 2, 15)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (99, 3, 15)
GO
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (100, 4, 15)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (101, 1, 16)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (102, 2, 16)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (103, 3, 16)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (104, 4, 16)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (105, 1, 17)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (106, 2, 17)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (107, 3, 17)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (108, 4, 17)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (109, 1, 18)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (110, 2, 18)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (111, 3, 18)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (112, 4, 18)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (113, 1, 19)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (114, 2, 19)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (115, 3, 19)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (116, 4, 19)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (117, 1, 20)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (118, 2, 20)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (119, 3, 20)
INSERT [dbo].[Asientos] ([idAsiento], [numeroAsiento], [idFila]) VALUES (120, 4, 20)
SET IDENTITY_INSERT [dbo].[Asientos] OFF
GO
SET IDENTITY_INSERT [dbo].[AsientosXReproducciones] ON 

INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (1, 1, 1, 1)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (2, 0, 2, 1)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (3, 0, 69, 220)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (4, 0, 32, 259)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (5, 0, 33, 259)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (6, 0, 74, 304)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (7, 0, 120, 406)
SET IDENTITY_INSERT [dbo].[AsientosXReproducciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Carteleras] ON 

INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (1, CAST(N'2019-01-01T06:00:00.000' AS DateTime), CAST(N'2019-02-01T06:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (2, CAST(N'2019-02-01T06:00:00.000' AS DateTime), CAST(N'2019-03-01T06:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (3, CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (4, CAST(N'2024-02-01T00:00:00.000' AS DateTime), CAST(N'2024-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (5, CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (6, CAST(N'2024-04-01T00:00:00.000' AS DateTime), CAST(N'2024-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (7, CAST(N'2024-05-01T00:00:00.000' AS DateTime), CAST(N'2024-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (8, CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (9, CAST(N'2024-07-01T00:00:00.000' AS DateTime), CAST(N'2024-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (10, CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (11, CAST(N'2024-09-01T00:00:00.000' AS DateTime), CAST(N'2024-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (12, CAST(N'2024-10-01T00:00:00.000' AS DateTime), CAST(N'2024-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (13, CAST(N'2024-11-01T00:00:00.000' AS DateTime), CAST(N'2024-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (14, CAST(N'2024-12-01T00:00:00.000' AS DateTime), CAST(N'2025-01-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (15, CAST(N'2025-01-01T00:00:00.000' AS DateTime), CAST(N'2025-02-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (16, CAST(N'2025-02-01T00:00:00.000' AS DateTime), CAST(N'2025-03-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (17, CAST(N'2025-03-01T00:00:00.000' AS DateTime), CAST(N'2025-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (18, CAST(N'2025-04-01T00:00:00.000' AS DateTime), CAST(N'2025-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (19, CAST(N'2025-05-01T00:00:00.000' AS DateTime), CAST(N'2025-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (20, CAST(N'2025-06-01T00:00:00.000' AS DateTime), CAST(N'2025-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (21, CAST(N'2025-07-01T00:00:00.000' AS DateTime), CAST(N'2025-08-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (22, CAST(N'2025-08-01T00:00:00.000' AS DateTime), CAST(N'2025-09-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (23, CAST(N'2025-09-01T00:00:00.000' AS DateTime), CAST(N'2025-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (24, CAST(N'2025-10-01T00:00:00.000' AS DateTime), CAST(N'2025-11-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (25, CAST(N'2025-11-01T00:00:00.000' AS DateTime), CAST(N'2025-12-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Carteleras] ([idCartelera], [fechaInicio], [fechaFin]) VALUES (26, CAST(N'2025-12-01T00:00:00.000' AS DateTime), CAST(N'2026-01-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Carteleras] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [edad], [telefono], [idUsuario]) VALUES (1, N'ventanilla', N'ventanilla', 21, N'555-1234', NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [edad], [telefono], [idUsuario]) VALUES (2, N'María', N'Gómez', 34, N'555-5678', NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [edad], [telefono], [idUsuario]) VALUES (3, N'Carlos', N'Ramírez', 22, N'555-9012', NULL)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleFacturas] ON 

INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (1, 100, 1, 1, 1, 1)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (2, 80, 2, 2, 2, 2)
SET IDENTITY_INSERT [dbo].[DetalleFacturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleados] ON 

INSERT [dbo].[Empleados] ([idEmpleado], [nombre], [apellido], [telefono], [idArea], [idUsuario]) VALUES (1, N'Pedro', N'Sánchez', N'555-1111', 1, NULL)
INSERT [dbo].[Empleados] ([idEmpleado], [nombre], [apellido], [telefono], [idArea], [idUsuario]) VALUES (2, N'Laura', N'Cruz', N'555-2222', 2, NULL)
INSERT [dbo].[Empleados] ([idEmpleado], [nombre], [apellido], [telefono], [idArea], [idUsuario]) VALUES (3, N'Lucía', N'Morales', N'555-3333', 3, NULL)
SET IDENTITY_INSERT [dbo].[Empleados] OFF
GO
SET IDENTITY_INSERT [dbo].[Facturas] ON 

INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (1, CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (2, CAST(N'2023-07-15T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (3, CAST(N'2024-11-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (4, CAST(N'2024-11-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (5, CAST(N'2024-11-10T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (6, CAST(N'2024-11-10T00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Facturas] OFF
GO
SET IDENTITY_INSERT [dbo].[Filas] ON 

INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (1, N'A', 1)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (2, N'B', 1)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (3, N'A', 2)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (4, N'C', 1)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (5, N'D', 1)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (6, N'E', 1)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (7, N'B', 2)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (8, N'C', 2)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (9, N'D', 2)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (10, N'E', 2)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (11, N'F', 2)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (12, N'A', 3)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (13, N'B', 3)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (14, N'C', 3)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (15, N'D', 3)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (16, N'E', 3)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (17, N'F', 3)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (18, N'G', 3)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (19, N'H', 3)
INSERT [dbo].[Filas] ([idFila], [letra], [numeroSala]) VALUES (20, N'I', 3)
SET IDENTITY_INSERT [dbo].[Filas] OFF
GO
SET IDENTITY_INSERT [dbo].[Generos] ON 

INSERT [dbo].[Generos] ([idGenero], [nombre]) VALUES (1, N'Acción')
INSERT [dbo].[Generos] ([idGenero], [nombre]) VALUES (2, N'Comedia')
INSERT [dbo].[Generos] ([idGenero], [nombre]) VALUES (3, N'Drama')
INSERT [dbo].[Generos] ([idGenero], [nombre]) VALUES (4, N'Ciencia Ficción')
INSERT [dbo].[Generos] ([idGenero], [nombre]) VALUES (5, N'Terror')
SET IDENTITY_INSERT [dbo].[Generos] OFF
GO
SET IDENTITY_INSERT [dbo].[Idiomas] ON 

INSERT [dbo].[Idiomas] ([idIdioma], [nombre]) VALUES (1, N'Español')
INSERT [dbo].[Idiomas] ([idIdioma], [nombre]) VALUES (2, N'Inglés')
INSERT [dbo].[Idiomas] ([idIdioma], [nombre]) VALUES (3, N'Francés')
SET IDENTITY_INSERT [dbo].[Idiomas] OFF
GO
SET IDENTITY_INSERT [dbo].[Peliculas] ON 

INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (1, N'https://userscontent2.emaze.com/images/d223e155-1985-4650-9b38-b36e7273bf61/01cf077f-d4b0-4842-a3f1-1e91f598791bpng', N'La Gran Aventura', CAST(N'2023-06-01' AS Date), 120, N'Una épica historia de aventuras.', 1, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (2, N'https://static.cinemarkhoyts.com.ar/Images/ComingSoon/200x285/1312.jpg?v=00002442', N'Risas a Montones', CAST(N'2023-07-15' AS Date), 95, N'Una comedia familiar que te hará reír a carcajadas.', 2, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (3, N'https://i.imgur.com/DyLh5dB.jpeg', N'Drama en la Ciudad', CAST(N'2023-08-10' AS Date), 130, N'Una intensa historia de amor y traición.', 3, 0)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (4, N'https://i.kym-cdn.com/photos/images/original/002/691/042/583.jpg', N'Entre Nosotros', CAST(N'2023-02-01' AS Date), 125, N'En una nave espacial, un impostor amenaza la supervivencia de la tripulación', 1, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (5, N'https://aguacatec.es/wp-content/uploads/2023/10/e5a978b8-6772-4c85-a50e-15581af7d483.png', N'El Resplandor', CAST(N'2023-02-01' AS Date), 125, N'un exprofesor que acepta un puesto como vigilante de invierno en un solitario hotel de alta montaña para ocuparse del mantenimiento.', 1, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (6, N'https://http2.mlstatic.com/D_NQ_NP_685440-MLA26668136235_012018-O.webp', N'Furia en el Asfalto', CAST(N'2024-01-10' AS Date), 120, N'Una trepidante persecución en la ciudad.', 1, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (7, N'https://68.media.tumblr.com/fbda16e46d8b3b0c05b873afc7a4be66/tumblr_inline_oua9dcLrPU1rj0abt_540.jpg', N'Risas a Domicilio', CAST(N'2024-02-14' AS Date), 95, N'Una serie de enredos y malentendidos en una empresa de envíos.', 2, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (8, N'https://cdn.discordapp.com/attachments/560600855309451266/1306368158965174372/325_4.png?ex=673669a8&is=67351828&hm=3ed82849f3dce6dd2fe74756e76ec803e6f22bbc83453f5268fe379217cbc22f&', N'Corazones Rotos', CAST(N'2024-03-08' AS Date), 110, N'Dos almas se encuentran en medio del dolor.', 3, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (9, N'https://th.bing.com/th/id/R.7ed7fcbfbc1e2a83b2d12de5ae779de3?rik=Y7m2lxgnnIkyUQ&pid=ImgRaw&r=0', N'Viaje al Futuro', CAST(N'2024-04-21' AS Date), 130, N'Una aventura intergaláctica llena de misterio y descubrimientos.', 4, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (10, N'https://m.media-amazon.com/images/M/MV5BMTgyNTUwOTUxN15BMl5BanBnXkFtZTgwNjE0NzgwMzE@._V1_.jpg', N'La Noche Oscura', CAST(N'2024-05-18' AS Date), 105, N'Un grupo de amigos descubre una casa con un oscuro secreto.', 5, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (11, N'https://pics.filmaffinity.com/the_velocipastor-884723176-mmed.jpg', N'Velocidad Mortal', CAST(N'2024-06-15' AS Date), 115, N'Un policía se infiltra en una peligrosa banda de corredores.', 1, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (12, N'https://th.bing.com/th/id/R.324027f98a939384a169cdc24200bad8?rik=7qyI5M3iTj%2ffgg&pid=ImgRaw&r=0', N'Fiesta de Locos', CAST(N'2024-07-20' AS Date), 100, N'Un grupo de amigos vive una noche inolvidable.', 2, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (13, N'https://68.media.tumblr.com/a34f2a4f990e870fcbb8d372d6c5d238/tumblr_inline_oua8v8Yxqb1rj0abt_500.jpg', N'El Último Suspiro', CAST(N'2024-08-25' AS Date), 125, N'Una historia de amor en tiempos difíciles.', 3, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (14, N'https://4.bp.blogspot.com/-6r1mJPRbuz4/XNg0dLNqe3I/AAAAAAAACJE/OCcqoUy1FMYYyVJUN-daa85oLM84S-frwCLcBGAs/s1600/interestellar.jpg', N'Exploración Espacial', CAST(N'2024-09-10' AS Date), 140, N'Un viaje a los confines de la galaxia.', 4, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (15, N'https://i.blogs.es/b1dbdb/random-photos-turned-into-movie-posters-102__700-700x800/1366_2000.jpg', N'Pesadilla en el Lago', CAST(N'2024-10-31' AS Date), 90, N'Una serie de desapariciones misteriosas en un lago remoto.', 5, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (16, N'https://pics.filmaffinity.com/Dragon_Ball_The_Magic_Begins-289242889-large.jpg', N'Fuego en la Noche', CAST(N'2024-11-12' AS Date), 110, N'Una venganza que arde en las calles de la ciudad.', 1, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (17, N'https://i.pinimg.com/736x/73/9d/7a/739d7ae64d6298bce886eb80681b134e.jpg', N'Riendo sin Parar', CAST(N'2024-12-15' AS Date), 105, N'Una comedia de errores en una fiesta de navidad.', 2, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (18, N'https://pics.filmaffinity.com/the_velocipastor_2-717720489-large.jpg', N'Velocidad Mortal 2', CAST(N'2025-01-11' AS Date), 118, N'La secuela de la aclamada persecución urbana.', 1, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (19, N'https://www.lahiguera.net/cinemania/pelicula/9646/pan_de_limon_con_semillas_de_amapola-cartel-9634.jpg', N'Amor y Risas', CAST(N'2025-02-14' AS Date), 102, N'Una pareja improbable se encuentra en situaciones graciosas.', 2, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (20, N'https://th.bing.com/th/id/OIP.2dEfdwi-sTUqeicjLZDlxgHaK-?rs=1&pid=ImgDetMain', N'El Peso del Pasado', CAST(N'2025-03-08' AS Date), 115, N'Un hombre enfrenta su historia para seguir adelante.', 3, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (21, N'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi0YmXZNiY1Txtw_wLlWJVeGUHEK8thau_lixWgILjZZpDIA6vE-QVfVzYn8T4EKwnZupXNwqMnu_lAaIWrTpBlU67Kw7qPo08xICeFO77femtR9bW7TI1VguHmdYXf68DRsbANzCWkwnc-/s1349/spacehunter-adventures-in-the-forbidden-zone-md-web.jpg', N'Más Allá de las Estrellas', CAST(N'2025-04-19' AS Date), 138, N'Una misión de exploración que cambia el curso de la humanidad.', 4, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (22, N'https://static.filmin.es/images/es/media/11008/2/poster_0_3_210x0.webp', N'El Grito en la Oscuridad', CAST(N'2025-05-13' AS Date), 95, N'Extraños sucesos en una cabaña apartada.', 5, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (23, N'https://m.media-amazon.com/images/M/MV5BOGQ4NTRhNjMtODYyYi00NjJhLThmZTUtNmI4MTdlZWM5MDliXkEyXkFqcGdeQXVyMzMzMTExNzI@._V1_FMjpg_UX1000_.jpg', N'Bajo Fuego', CAST(N'2025-06-23' AS Date), 120, N'Un grupo de élite enfrenta una misión imposible.', 1, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (24, N'https://play-lh.googleusercontent.com/kLOrW4g8521TNkxRorOuPRdbC2mjeqVGd95U09gWihDT1q5kmxnFX8JeZjNEjisZoG8', N'Risas en el Verano', CAST(N'2025-07-16' AS Date), 98, N'Las desventuras de un grupo de amigos en vacaciones.', 2, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (25, N'https://th.bing.com/th/id/OIP.tC73lU8TaU1t6KZ5VWmJGgHaK6?rs=1&pid=ImgDetMain', N'Cicatrices del Alma', CAST(N'2025-08-22' AS Date), 112, N'Una historia conmovedora sobre el perdón y la redención.', 3, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (26, N'https://image.tmdb.org/t/p/original/e5mV1iVcjg7nkpJrskQOnFCR4H9.jpg', N'Horizonte Inexplorado', CAST(N'2025-09-17' AS Date), 136, N'Exploración y misterios en un planeta desconocido.', 4, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (27, N'https://static.filmin.es/images/es/media/16679/1/poster_0_3_210x0.webp', N'El Refugio del Miedo', CAST(N'2025-10-27' AS Date), 93, N'Un grupo de jóvenes queda atrapado en una casa maldita.', 5, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (28, N'https://static.filmin.es/images/es/media/28544/5/poster_0_3_210x0.webp', N'Operación Rescate', CAST(N'2025-11-09' AS Date), 108, N'Un agente debe salvar a rehenes en territorio hostil.', 1, 1)
INSERT [dbo].[Peliculas] ([idPelicula], [urlPortada], [nombre], [fechaEstreno], [duracionMinutos], [sinopsis], [idGenero], [estaActiva]) VALUES (29, N'https://hips.hearstapps.com/hmg-prod/images/gremlins-poster-658c3c086524e.jpg?resize=980:*', N'Navidad en Risa', CAST(N'2025-12-20' AS Date), 100, N'Diversión y caos en una fiesta navideña.', 2, 1)
SET IDENTITY_INSERT [dbo].[Peliculas] OFF
GO
SET IDENTITY_INSERT [dbo].[PeliculasXCarteleras] ON 

INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (1, 1, 1)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (2, 2, 1)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (3, 3, 2)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (59, 1, 1)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (60, 1, 5)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (61, 1, 7)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (62, 1, 10)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (63, 1, 12)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (64, 1, 15)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (65, 1, 20)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (66, 2, 2)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (67, 2, 4)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (68, 2, 6)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (69, 2, 9)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (70, 2, 14)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (71, 2, 18)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (72, 2, 22)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (73, 3, 3)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (74, 3, 8)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (75, 3, 10)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (76, 3, 13)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (77, 3, 17)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (78, 3, 21)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (79, 3, 25)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (80, 4, 2)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (81, 4, 5)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (82, 4, 8)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (83, 4, 11)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (84, 4, 14)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (85, 4, 16)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (86, 4, 19)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (87, 5, 3)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (88, 5, 6)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (89, 5, 9)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (90, 5, 13)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (91, 5, 15)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (92, 5, 20)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (93, 5, 23)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (94, 6, 1)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (95, 6, 4)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (96, 6, 7)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (97, 6, 10)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (98, 6, 12)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (99, 6, 17)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (100, 6, 22)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (101, 7, 2)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (102, 7, 6)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (103, 7, 8)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (104, 7, 11)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (105, 7, 14)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (106, 7, 18)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (107, 7, 25)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (108, 8, 1)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (109, 8, 5)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (110, 8, 9)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (111, 8, 12)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (112, 8, 16)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (113, 8, 20)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (114, 8, 24)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (115, 9, 3)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (116, 9, 7)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (117, 9, 10)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (118, 9, 13)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (119, 9, 17)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (120, 9, 19)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (121, 9, 26)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (122, 10, 4)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (123, 10, 6)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (124, 10, 11)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (125, 10, 14)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (126, 10, 18)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (127, 10, 22)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (128, 10, 25)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (129, 11, 2)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (130, 11, 5)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (131, 11, 8)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (132, 11, 13)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (133, 11, 15)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (134, 11, 17)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (135, 11, 21)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (136, 12, 1)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (137, 12, 3)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (138, 12, 7)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (139, 12, 9)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (140, 12, 12)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (141, 12, 16)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (142, 12, 19)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (143, 13, 5)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (144, 13, 8)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (145, 13, 11)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (146, 13, 14)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (147, 13, 17)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (148, 13, 22)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (149, 13, 24)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (150, 14, 6)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (151, 14, 10)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (152, 14, 12)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (153, 14, 15)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (154, 14, 18)
GO
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (155, 14, 23)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (156, 14, 26)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (157, 15, 2)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (158, 15, 7)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (159, 15, 9)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (160, 15, 13)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (161, 15, 16)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (162, 15, 20)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (163, 15, 22)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (164, 16, 4)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (165, 16, 6)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (166, 16, 11)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (167, 16, 14)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (168, 16, 17)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (169, 16, 21)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (170, 16, 26)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (171, 17, 1)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (172, 17, 3)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (173, 17, 8)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (174, 17, 12)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (175, 17, 14)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (176, 17, 18)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (177, 17, 23)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (178, 18, 2)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (179, 18, 7)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (180, 18, 10)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (181, 18, 13)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (182, 18, 15)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (183, 18, 19)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (184, 18, 26)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (185, 19, 5)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (186, 19, 8)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (187, 19, 12)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (188, 19, 16)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (189, 19, 20)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (190, 19, 22)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (191, 19, 25)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (192, 20, 1)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (193, 20, 3)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (194, 20, 6)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (195, 20, 9)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (196, 20, 12)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (197, 20, 18)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (198, 20, 24)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (199, 21, 4)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (200, 21, 7)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (201, 21, 11)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (202, 21, 14)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (203, 21, 17)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (204, 21, 22)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (205, 21, 26)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (206, 22, 2)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (207, 22, 5)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (208, 22, 8)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (209, 22, 13)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (210, 22, 15)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (211, 22, 19)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (212, 22, 25)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (213, 23, 1)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (214, 23, 6)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (215, 23, 9)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (216, 23, 12)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (217, 23, 14)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (218, 23, 18)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (219, 23, 21)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (220, 24, 3)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (221, 24, 7)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (222, 24, 10)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (223, 24, 15)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (224, 24, 17)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (225, 24, 22)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (226, 24, 26)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (227, 25, 5)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (228, 25, 8)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (229, 25, 11)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (230, 25, 14)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (231, 25, 19)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (232, 25, 23)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (233, 25, 26)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (234, 26, 2)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (235, 26, 6)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (236, 26, 9)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (237, 26, 12)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (238, 26, 16)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (239, 26, 20)
INSERT [dbo].[PeliculasXCarteleras] ([idPeliculaXCartelera], [idPelicula], [idCartelera]) VALUES (240, 26, 24)
SET IDENTITY_INSERT [dbo].[PeliculasXCarteleras] OFF
GO
SET IDENTITY_INSERT [dbo].[PeliculasXIdiomas] ON 

INSERT [dbo].[PeliculasXIdiomas] ([idPeliculaXIdioma], [idPelicula], [idIdioma]) VALUES (1, 1, 1)
INSERT [dbo].[PeliculasXIdiomas] ([idPeliculaXIdioma], [idPelicula], [idIdioma]) VALUES (2, 1, 2)
INSERT [dbo].[PeliculasXIdiomas] ([idPeliculaXIdioma], [idPelicula], [idIdioma]) VALUES (3, 2, 1)
INSERT [dbo].[PeliculasXIdiomas] ([idPeliculaXIdioma], [idPelicula], [idIdioma]) VALUES (4, 1, 3)
SET IDENTITY_INSERT [dbo].[PeliculasXIdiomas] OFF
GO
SET IDENTITY_INSERT [dbo].[Promociones] ON 

INSERT [dbo].[Promociones] ([idPromocion], [nombre], [descuento]) VALUES (0, N'Sin promocion', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Promociones] ([idPromocion], [nombre], [descuento]) VALUES (1, N'Sin Promoción', CAST(0 AS Decimal(18, 0)))
INSERT [dbo].[Promociones] ([idPromocion], [nombre], [descuento]) VALUES (2, N'Descuento Estudiante', CAST(0 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[Promociones] OFF
GO
SET IDENTITY_INSERT [dbo].[Reproducciones] ON 

INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (1, 1, CAST(N'2023-06-01T14:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (2, 2, CAST(N'2023-07-15T16:00:00' AS SmallDateTime), 2, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (219, 1, CAST(N'2024-09-02T10:00:00' AS SmallDateTime), 4, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (220, 2, CAST(N'2024-09-04T12:30:00' AS SmallDateTime), 7, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (221, 3, CAST(N'2024-09-06T14:00:00' AS SmallDateTime), 10, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (222, 1, CAST(N'2024-09-08T16:30:00' AS SmallDateTime), 13, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (223, 2, CAST(N'2024-09-10T18:30:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (224, 3, CAST(N'2024-09-12T20:00:00' AS SmallDateTime), 21, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (225, 1, CAST(N'2024-09-14T22:00:00' AS SmallDateTime), 25, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (226, 1, CAST(N'2024-10-01T10:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (227, 2, CAST(N'2024-10-03T12:30:00' AS SmallDateTime), 6, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (228, 3, CAST(N'2024-10-05T14:30:00' AS SmallDateTime), 8, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (229, 1, CAST(N'2024-10-07T16:30:00' AS SmallDateTime), 12, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (230, 2, CAST(N'2024-10-09T18:30:00' AS SmallDateTime), 14, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (231, 3, CAST(N'2024-10-11T20:00:00' AS SmallDateTime), 17, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (232, 1, CAST(N'2024-10-13T22:00:00' AS SmallDateTime), 19, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (233, 2, CAST(N'2024-10-15T10:00:00' AS SmallDateTime), 20, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (234, 3, CAST(N'2024-10-17T12:30:00' AS SmallDateTime), 23, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (235, 1, CAST(N'2024-10-19T14:30:00' AS SmallDateTime), 26, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (236, 1, CAST(N'2024-11-02T10:00:00' AS SmallDateTime), 3, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (237, 2, CAST(N'2024-11-04T12:00:00' AS SmallDateTime), 5, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (238, 3, CAST(N'2024-11-06T14:00:00' AS SmallDateTime), 9, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (239, 1, CAST(N'2024-11-08T16:00:00' AS SmallDateTime), 11, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (240, 2, CAST(N'2024-11-10T18:30:00' AS SmallDateTime), 15, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (241, 3, CAST(N'2024-11-12T20:00:00' AS SmallDateTime), 18, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (242, 1, CAST(N'2024-11-14T22:00:00' AS SmallDateTime), 22, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (243, 1, CAST(N'2025-01-02T10:00:00' AS SmallDateTime), 2, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (244, 2, CAST(N'2025-01-04T12:30:00' AS SmallDateTime), 4, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (245, 3, CAST(N'2025-01-06T14:30:00' AS SmallDateTime), 7, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (246, 1, CAST(N'2025-01-08T16:30:00' AS SmallDateTime), 10, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (247, 2, CAST(N'2025-01-10T18:00:00' AS SmallDateTime), 13, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (248, 3, CAST(N'2025-01-12T20:00:00' AS SmallDateTime), 16, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (249, 1, CAST(N'2025-01-14T22:00:00' AS SmallDateTime), 17, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (250, 2, CAST(N'2025-01-16T10:00:00' AS SmallDateTime), 21, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (251, 3, CAST(N'2025-01-18T12:30:00' AS SmallDateTime), 23, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (252, 1, CAST(N'2025-01-20T14:30:00' AS SmallDateTime), 25, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (253, 1, CAST(N'2025-02-02T10:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (254, 2, CAST(N'2025-02-04T12:30:00' AS SmallDateTime), 5, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (255, 3, CAST(N'2025-02-06T14:30:00' AS SmallDateTime), 11, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (256, 1, CAST(N'2025-02-08T16:30:00' AS SmallDateTime), 14, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (257, 2, CAST(N'2025-02-10T18:30:00' AS SmallDateTime), 18, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (258, 3, CAST(N'2025-02-12T20:00:00' AS SmallDateTime), 22, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (259, 1, CAST(N'2025-02-14T22:00:00' AS SmallDateTime), 24, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (260, 1, CAST(N'2025-03-02T10:00:00' AS SmallDateTime), 4, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (261, 2, CAST(N'2025-03-04T12:00:00' AS SmallDateTime), 8, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (262, 3, CAST(N'2025-03-06T14:00:00' AS SmallDateTime), 12, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (263, 1, CAST(N'2025-03-08T16:30:00' AS SmallDateTime), 15, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (264, 2, CAST(N'2025-03-10T18:00:00' AS SmallDateTime), 19, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (265, 3, CAST(N'2025-03-12T20:30:00' AS SmallDateTime), 26, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (266, 1, CAST(N'2025-04-01T10:00:00' AS SmallDateTime), 3, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (267, 2, CAST(N'2025-04-03T12:30:00' AS SmallDateTime), 6, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (268, 3, CAST(N'2025-04-05T14:00:00' AS SmallDateTime), 9, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (269, 1, CAST(N'2025-04-07T16:30:00' AS SmallDateTime), 11, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (270, 2, CAST(N'2025-04-09T18:00:00' AS SmallDateTime), 13, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (271, 3, CAST(N'2025-04-11T20:00:00' AS SmallDateTime), 16, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (272, 1, CAST(N'2025-04-13T22:00:00' AS SmallDateTime), 21, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (273, 2, CAST(N'2025-04-15T10:00:00' AS SmallDateTime), 24, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (274, 1, CAST(N'2025-05-01T10:00:00' AS SmallDateTime), 2, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (275, 2, CAST(N'2025-05-03T12:30:00' AS SmallDateTime), 7, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (276, 3, CAST(N'2025-05-05T14:30:00' AS SmallDateTime), 10, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (277, 1, CAST(N'2025-05-07T16:30:00' AS SmallDateTime), 14, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (278, 2, CAST(N'2025-05-09T18:00:00' AS SmallDateTime), 17, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (279, 3, CAST(N'2025-05-11T20:00:00' AS SmallDateTime), 19, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (280, 1, CAST(N'2025-05-13T22:00:00' AS SmallDateTime), 22, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (281, 2, CAST(N'2025-05-15T10:00:00' AS SmallDateTime), 25, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (282, 1, CAST(N'2025-02-01T10:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (283, 2, CAST(N'2025-02-01T12:00:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (284, 3, CAST(N'2025-02-02T14:30:00' AS SmallDateTime), 6, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (285, 1, CAST(N'2025-02-02T16:00:00' AS SmallDateTime), 6, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (286, 2, CAST(N'2025-02-03T18:30:00' AS SmallDateTime), 8, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (287, 3, CAST(N'2025-02-03T20:30:00' AS SmallDateTime), 8, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (288, 1, CAST(N'2025-02-04T22:00:00' AS SmallDateTime), 12, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (289, 2, CAST(N'2025-02-04T10:00:00' AS SmallDateTime), 12, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (290, 3, CAST(N'2025-02-05T12:30:00' AS SmallDateTime), 14, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (291, 1, CAST(N'2025-02-05T14:00:00' AS SmallDateTime), 14, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (292, 2, CAST(N'2025-02-06T16:30:00' AS SmallDateTime), 17, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (293, 3, CAST(N'2025-02-06T18:00:00' AS SmallDateTime), 17, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (294, 1, CAST(N'2025-02-07T20:00:00' AS SmallDateTime), 19, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (295, 2, CAST(N'2025-02-07T22:00:00' AS SmallDateTime), 19, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (296, 3, CAST(N'2025-02-08T10:00:00' AS SmallDateTime), 23, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (297, 1, CAST(N'2025-03-01T10:00:00' AS SmallDateTime), 3, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (298, 2, CAST(N'2025-03-01T12:30:00' AS SmallDateTime), 3, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (299, 3, CAST(N'2025-03-02T14:30:00' AS SmallDateTime), 5, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (300, 1, CAST(N'2025-03-02T16:30:00' AS SmallDateTime), 5, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (301, 2, CAST(N'2025-03-03T18:00:00' AS SmallDateTime), 9, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (302, 3, CAST(N'2025-03-03T20:00:00' AS SmallDateTime), 9, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (303, 1, CAST(N'2025-03-04T22:00:00' AS SmallDateTime), 11, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (304, 2, CAST(N'2025-03-04T10:00:00' AS SmallDateTime), 11, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (305, 3, CAST(N'2025-03-05T12:30:00' AS SmallDateTime), 13, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (306, 1, CAST(N'2025-03-05T14:00:00' AS SmallDateTime), 13, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (307, 2, CAST(N'2025-03-06T16:30:00' AS SmallDateTime), 15, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (308, 3, CAST(N'2025-03-06T18:00:00' AS SmallDateTime), 15, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (309, 1, CAST(N'2025-03-07T20:00:00' AS SmallDateTime), 18, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (310, 2, CAST(N'2025-03-07T22:00:00' AS SmallDateTime), 18, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (311, 3, CAST(N'2025-03-08T10:00:00' AS SmallDateTime), 22, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (312, 1, CAST(N'2025-04-01T10:00:00' AS SmallDateTime), 2, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (313, 2, CAST(N'2025-04-01T12:30:00' AS SmallDateTime), 2, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (314, 3, CAST(N'2025-04-02T14:30:00' AS SmallDateTime), 4, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (315, 1, CAST(N'2025-04-02T16:30:00' AS SmallDateTime), 4, 1)
GO
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (316, 2, CAST(N'2025-04-03T18:00:00' AS SmallDateTime), 7, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (317, 3, CAST(N'2025-04-03T20:30:00' AS SmallDateTime), 7, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (318, 1, CAST(N'2025-04-04T22:00:00' AS SmallDateTime), 10, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (319, 2, CAST(N'2025-04-04T10:00:00' AS SmallDateTime), 10, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (320, 3, CAST(N'2025-04-05T12:00:00' AS SmallDateTime), 13, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (321, 1, CAST(N'2025-04-05T14:00:00' AS SmallDateTime), 13, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (322, 2, CAST(N'2025-04-06T16:30:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (323, 3, CAST(N'2025-04-06T18:00:00' AS SmallDateTime), 16, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (324, 1, CAST(N'2025-04-07T20:00:00' AS SmallDateTime), 17, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (325, 2, CAST(N'2025-04-07T22:00:00' AS SmallDateTime), 17, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (326, 3, CAST(N'2025-04-08T10:00:00' AS SmallDateTime), 21, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (327, 1, CAST(N'2025-04-08T12:30:00' AS SmallDateTime), 23, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (328, 2, CAST(N'2025-04-09T14:30:00' AS SmallDateTime), 25, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (329, 1, CAST(N'2025-05-01T10:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (330, 2, CAST(N'2025-05-01T12:30:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (331, 3, CAST(N'2025-05-02T14:00:00' AS SmallDateTime), 5, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (332, 1, CAST(N'2025-05-02T16:30:00' AS SmallDateTime), 5, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (333, 2, CAST(N'2025-05-03T18:30:00' AS SmallDateTime), 11, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (334, 3, CAST(N'2025-05-03T20:00:00' AS SmallDateTime), 11, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (335, 1, CAST(N'2025-05-04T22:00:00' AS SmallDateTime), 14, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (336, 2, CAST(N'2025-05-04T10:00:00' AS SmallDateTime), 14, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (337, 3, CAST(N'2025-05-05T14:00:00' AS SmallDateTime), 18, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (338, 1, CAST(N'2025-05-06T16:30:00' AS SmallDateTime), 22, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (339, 2, CAST(N'2025-05-06T18:00:00' AS SmallDateTime), 22, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (340, 3, CAST(N'2025-05-07T20:00:00' AS SmallDateTime), 24, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (341, 1, CAST(N'2025-06-01T10:00:00' AS SmallDateTime), 4, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (342, 2, CAST(N'2025-06-01T12:30:00' AS SmallDateTime), 4, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (343, 3, CAST(N'2025-06-02T14:30:00' AS SmallDateTime), 8, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (344, 1, CAST(N'2025-06-02T16:30:00' AS SmallDateTime), 8, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (345, 2, CAST(N'2025-06-03T18:30:00' AS SmallDateTime), 12, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (346, 3, CAST(N'2025-06-03T20:30:00' AS SmallDateTime), 12, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (347, 1, CAST(N'2025-06-04T22:00:00' AS SmallDateTime), 16, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (348, 2, CAST(N'2025-06-04T10:00:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (349, 3, CAST(N'2025-06-05T12:30:00' AS SmallDateTime), 19, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (350, 1, CAST(N'2025-06-05T14:00:00' AS SmallDateTime), 19, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (351, 2, CAST(N'2025-06-06T16:30:00' AS SmallDateTime), 26, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (352, 3, CAST(N'2025-06-06T18:00:00' AS SmallDateTime), 26, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (353, 1, CAST(N'2025-07-01T10:00:00' AS SmallDateTime), 3, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (354, 2, CAST(N'2025-07-01T12:30:00' AS SmallDateTime), 3, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (355, 3, CAST(N'2025-07-02T14:30:00' AS SmallDateTime), 6, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (356, 1, CAST(N'2025-07-02T16:30:00' AS SmallDateTime), 6, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (357, 2, CAST(N'2025-07-03T18:00:00' AS SmallDateTime), 9, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (358, 3, CAST(N'2025-07-03T20:00:00' AS SmallDateTime), 9, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (359, 1, CAST(N'2025-07-04T22:00:00' AS SmallDateTime), 11, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (360, 2, CAST(N'2025-07-04T10:00:00' AS SmallDateTime), 11, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (361, 3, CAST(N'2025-07-05T12:30:00' AS SmallDateTime), 13, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (362, 1, CAST(N'2025-07-05T14:00:00' AS SmallDateTime), 13, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (363, 2, CAST(N'2025-07-06T16:30:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (364, 3, CAST(N'2025-07-06T18:00:00' AS SmallDateTime), 16, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (365, 1, CAST(N'2025-07-07T20:00:00' AS SmallDateTime), 21, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (366, 2, CAST(N'2025-07-07T22:00:00' AS SmallDateTime), 21, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (367, 3, CAST(N'2025-07-08T10:00:00' AS SmallDateTime), 24, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (368, 1, CAST(N'2025-08-01T10:00:00' AS SmallDateTime), 2, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (369, 2, CAST(N'2025-08-01T12:30:00' AS SmallDateTime), 2, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (370, 3, CAST(N'2025-08-02T14:30:00' AS SmallDateTime), 5, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (371, 1, CAST(N'2025-08-02T16:30:00' AS SmallDateTime), 5, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (372, 2, CAST(N'2025-08-03T18:00:00' AS SmallDateTime), 7, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (373, 3, CAST(N'2025-08-03T20:30:00' AS SmallDateTime), 7, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (374, 1, CAST(N'2025-08-04T22:00:00' AS SmallDateTime), 10, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (375, 2, CAST(N'2025-08-04T10:00:00' AS SmallDateTime), 10, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (376, 3, CAST(N'2025-08-05T12:30:00' AS SmallDateTime), 14, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (377, 1, CAST(N'2025-08-05T14:00:00' AS SmallDateTime), 14, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (378, 2, CAST(N'2025-08-06T16:30:00' AS SmallDateTime), 15, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (379, 3, CAST(N'2025-08-06T18:00:00' AS SmallDateTime), 15, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (380, 1, CAST(N'2025-08-07T20:00:00' AS SmallDateTime), 19, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (381, 2, CAST(N'2025-08-07T22:00:00' AS SmallDateTime), 19, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (382, 3, CAST(N'2025-08-08T10:00:00' AS SmallDateTime), 23, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (383, 1, CAST(N'2025-06-01T09:00:00' AS SmallDateTime), 4, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (384, 2, CAST(N'2025-06-01T12:00:00' AS SmallDateTime), 4, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (385, 3, CAST(N'2025-06-02T14:00:00' AS SmallDateTime), 8, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (386, 1, CAST(N'2025-06-02T16:00:00' AS SmallDateTime), 8, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (387, 2, CAST(N'2025-06-03T18:00:00' AS SmallDateTime), 12, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (388, 3, CAST(N'2025-06-03T20:00:00' AS SmallDateTime), 12, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (389, 1, CAST(N'2025-06-04T22:00:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (390, 2, CAST(N'2025-06-05T10:00:00' AS SmallDateTime), 16, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (391, 3, CAST(N'2025-06-05T13:00:00' AS SmallDateTime), 19, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (392, 1, CAST(N'2025-06-05T15:00:00' AS SmallDateTime), 19, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (393, 2, CAST(N'2025-06-06T17:00:00' AS SmallDateTime), 26, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (394, 3, CAST(N'2025-06-06T19:00:00' AS SmallDateTime), 26, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (395, 1, CAST(N'2025-06-01T09:00:00' AS SmallDateTime), 4, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (396, 2, CAST(N'2025-06-01T12:00:00' AS SmallDateTime), 4, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (397, 3, CAST(N'2025-06-02T14:00:00' AS SmallDateTime), 8, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (398, 1, CAST(N'2025-06-02T16:00:00' AS SmallDateTime), 8, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (399, 2, CAST(N'2025-06-03T18:00:00' AS SmallDateTime), 12, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (400, 3, CAST(N'2025-06-03T20:00:00' AS SmallDateTime), 12, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (401, 1, CAST(N'2025-06-04T22:00:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (402, 2, CAST(N'2025-06-05T10:00:00' AS SmallDateTime), 16, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (403, 3, CAST(N'2025-06-05T13:00:00' AS SmallDateTime), 19, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (404, 1, CAST(N'2025-06-05T15:00:00' AS SmallDateTime), 19, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (405, 2, CAST(N'2025-06-06T17:00:00' AS SmallDateTime), 26, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (406, 3, CAST(N'2025-06-06T19:00:00' AS SmallDateTime), 26, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (407, 1, CAST(N'2025-07-01T09:30:00' AS SmallDateTime), 3, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (408, 2, CAST(N'2025-07-01T12:00:00' AS SmallDateTime), 3, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (409, 3, CAST(N'2025-07-02T14:30:00' AS SmallDateTime), 6, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (410, 1, CAST(N'2025-07-02T17:00:00' AS SmallDateTime), 6, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (411, 2, CAST(N'2025-07-03T19:30:00' AS SmallDateTime), 9, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (412, 3, CAST(N'2025-07-03T21:30:00' AS SmallDateTime), 9, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (413, 1, CAST(N'2025-07-04T10:00:00' AS SmallDateTime), 11, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (414, 2, CAST(N'2025-07-04T12:30:00' AS SmallDateTime), 11, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (415, 3, CAST(N'2025-07-05T15:00:00' AS SmallDateTime), 13, 1)
GO
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (416, 1, CAST(N'2025-07-05T17:00:00' AS SmallDateTime), 13, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (417, 2, CAST(N'2025-07-06T19:00:00' AS SmallDateTime), 16, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (418, 3, CAST(N'2025-07-06T21:00:00' AS SmallDateTime), 16, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (419, 1, CAST(N'2025-07-07T09:00:00' AS SmallDateTime), 21, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (420, 2, CAST(N'2025-07-07T11:00:00' AS SmallDateTime), 21, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (421, 3, CAST(N'2025-07-08T13:30:00' AS SmallDateTime), 24, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (422, 1, CAST(N'2025-08-01T08:30:00' AS SmallDateTime), 2, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (423, 2, CAST(N'2025-08-01T10:30:00' AS SmallDateTime), 2, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (424, 3, CAST(N'2025-08-02T12:30:00' AS SmallDateTime), 5, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (425, 1, CAST(N'2025-08-02T15:00:00' AS SmallDateTime), 5, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (426, 2, CAST(N'2025-08-03T17:30:00' AS SmallDateTime), 7, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (427, 3, CAST(N'2025-08-03T20:00:00' AS SmallDateTime), 7, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (428, 1, CAST(N'2025-08-04T22:30:00' AS SmallDateTime), 10, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (429, 2, CAST(N'2025-08-04T10:30:00' AS SmallDateTime), 10, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (430, 3, CAST(N'2025-08-05T13:30:00' AS SmallDateTime), 14, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (431, 1, CAST(N'2025-08-05T15:30:00' AS SmallDateTime), 14, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (432, 2, CAST(N'2025-08-06T18:00:00' AS SmallDateTime), 15, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (433, 3, CAST(N'2025-08-06T20:30:00' AS SmallDateTime), 15, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (434, 1, CAST(N'2025-08-07T22:30:00' AS SmallDateTime), 19, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (435, 2, CAST(N'2025-08-07T10:30:00' AS SmallDateTime), 19, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (436, 3, CAST(N'2025-08-08T12:00:00' AS SmallDateTime), 23, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (437, 1, CAST(N'2025-04-01T09:00:00' AS SmallDateTime), 4, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (438, 2, CAST(N'2025-04-01T11:30:00' AS SmallDateTime), 4, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (439, 3, CAST(N'2025-04-01T14:00:00' AS SmallDateTime), 7, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (440, 1, CAST(N'2025-04-01T16:30:00' AS SmallDateTime), 7, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (441, 2, CAST(N'2025-04-02T18:00:00' AS SmallDateTime), 10, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (442, 3, CAST(N'2025-04-02T20:30:00' AS SmallDateTime), 10, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (443, 1, CAST(N'2025-04-03T09:30:00' AS SmallDateTime), 13, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (444, 2, CAST(N'2025-04-03T12:00:00' AS SmallDateTime), 13, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (445, 3, CAST(N'2025-04-04T14:30:00' AS SmallDateTime), 16, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (446, 1, CAST(N'2025-04-04T17:00:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (447, 2, CAST(N'2025-04-05T19:00:00' AS SmallDateTime), 21, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (448, 3, CAST(N'2025-04-05T21:30:00' AS SmallDateTime), 21, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (449, 1, CAST(N'2025-04-06T10:00:00' AS SmallDateTime), 25, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (450, 2, CAST(N'2025-04-06T13:00:00' AS SmallDateTime), 25, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (451, 1, CAST(N'2025-04-10T08:30:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (452, 2, CAST(N'2025-04-10T11:00:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (453, 3, CAST(N'2025-04-10T13:30:00' AS SmallDateTime), 6, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (454, 1, CAST(N'2025-04-10T16:00:00' AS SmallDateTime), 6, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (455, 2, CAST(N'2025-04-11T18:30:00' AS SmallDateTime), 8, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (456, 3, CAST(N'2025-04-11T21:00:00' AS SmallDateTime), 8, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (457, 1, CAST(N'2025-04-12T09:00:00' AS SmallDateTime), 12, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (458, 2, CAST(N'2025-04-12T11:30:00' AS SmallDateTime), 12, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (459, 3, CAST(N'2025-04-13T14:00:00' AS SmallDateTime), 14, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (460, 1, CAST(N'2025-04-13T16:30:00' AS SmallDateTime), 14, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (461, 2, CAST(N'2025-04-14T19:00:00' AS SmallDateTime), 17, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (462, 3, CAST(N'2025-04-14T21:30:00' AS SmallDateTime), 17, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (463, 1, CAST(N'2025-04-15T10:00:00' AS SmallDateTime), 19, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (464, 2, CAST(N'2025-04-15T12:30:00' AS SmallDateTime), 19, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (465, 3, CAST(N'2025-04-15T15:00:00' AS SmallDateTime), 20, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (466, 1, CAST(N'2025-04-15T17:30:00' AS SmallDateTime), 20, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (467, 2, CAST(N'2025-04-16T20:00:00' AS SmallDateTime), 23, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (468, 3, CAST(N'2025-04-16T22:30:00' AS SmallDateTime), 23, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (469, 1, CAST(N'2025-04-17T10:00:00' AS SmallDateTime), 26, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (470, 1, CAST(N'2025-04-20T09:00:00' AS SmallDateTime), 3, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (471, 2, CAST(N'2025-04-20T11:30:00' AS SmallDateTime), 3, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (472, 3, CAST(N'2025-04-20T14:00:00' AS SmallDateTime), 5, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (473, 1, CAST(N'2025-04-20T16:30:00' AS SmallDateTime), 5, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (474, 2, CAST(N'2025-04-21T18:00:00' AS SmallDateTime), 9, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (475, 3, CAST(N'2025-04-21T20:30:00' AS SmallDateTime), 9, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (476, 1, CAST(N'2025-04-22T09:00:00' AS SmallDateTime), 11, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (477, 2, CAST(N'2025-04-22T11:30:00' AS SmallDateTime), 11, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (478, 3, CAST(N'2025-04-23T14:00:00' AS SmallDateTime), 15, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (479, 1, CAST(N'2025-04-23T16:30:00' AS SmallDateTime), 15, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (480, 2, CAST(N'2025-04-24T18:00:00' AS SmallDateTime), 18, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (481, 3, CAST(N'2025-04-24T20:30:00' AS SmallDateTime), 18, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (482, 1, CAST(N'2025-04-25T09:30:00' AS SmallDateTime), 22, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (483, 1, CAST(N'2025-04-27T08:30:00' AS SmallDateTime), 2, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (484, 2, CAST(N'2025-04-27T10:30:00' AS SmallDateTime), 2, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (485, 3, CAST(N'2025-04-27T13:00:00' AS SmallDateTime), 4, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (486, 1, CAST(N'2025-04-27T15:30:00' AS SmallDateTime), 4, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (487, 2, CAST(N'2025-04-28T18:00:00' AS SmallDateTime), 7, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (488, 3, CAST(N'2025-04-28T20:30:00' AS SmallDateTime), 7, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (489, 1, CAST(N'2025-04-29T09:00:00' AS SmallDateTime), 10, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (490, 2, CAST(N'2025-04-29T11:30:00' AS SmallDateTime), 10, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (491, 3, CAST(N'2025-04-30T14:00:00' AS SmallDateTime), 13, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (492, 1, CAST(N'2025-04-30T16:30:00' AS SmallDateTime), 13, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (493, 2, CAST(N'2025-05-01T18:30:00' AS SmallDateTime), 16, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (494, 3, CAST(N'2025-05-01T21:00:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (495, 1, CAST(N'2025-05-02T09:30:00' AS SmallDateTime), 17, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (496, 2, CAST(N'2025-05-02T12:00:00' AS SmallDateTime), 21, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (497, 3, CAST(N'2025-05-02T14:30:00' AS SmallDateTime), 23, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (498, 1, CAST(N'2025-05-02T17:00:00' AS SmallDateTime), 25, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (499, 1, CAST(N'2024-08-01T10:30:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (500, 2, CAST(N'2024-08-03T12:00:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (501, 3, CAST(N'2024-08-05T14:30:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (502, 1, CAST(N'2024-08-07T16:00:00' AS SmallDateTime), 3, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (503, 2, CAST(N'2024-08-09T18:30:00' AS SmallDateTime), 3, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (504, 3, CAST(N'2024-08-11T20:00:00' AS SmallDateTime), 6, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (505, 1, CAST(N'2024-08-13T11:00:00' AS SmallDateTime), 6, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (506, 2, CAST(N'2024-08-15T13:30:00' AS SmallDateTime), 6, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (507, 3, CAST(N'2024-08-17T16:00:00' AS SmallDateTime), 9, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (508, 1, CAST(N'2024-08-19T18:30:00' AS SmallDateTime), 9, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (509, 2, CAST(N'2024-08-21T11:00:00' AS SmallDateTime), 14, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (510, 3, CAST(N'2024-08-23T13:00:00' AS SmallDateTime), 14, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (511, 1, CAST(N'2024-08-25T15:30:00' AS SmallDateTime), 18, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (512, 2, CAST(N'2024-08-27T17:00:00' AS SmallDateTime), 18, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (513, 3, CAST(N'2024-08-29T19:30:00' AS SmallDateTime), 24, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (514, 1, CAST(N'2024-08-31T21:00:00' AS SmallDateTime), 24, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (515, 1, CAST(N'2024-09-02T10:30:00' AS SmallDateTime), 4, 3)
GO
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (516, 2, CAST(N'2024-09-04T12:00:00' AS SmallDateTime), 4, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (517, 3, CAST(N'2024-09-06T14:30:00' AS SmallDateTime), 4, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (518, 1, CAST(N'2024-09-08T16:00:00' AS SmallDateTime), 7, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (519, 2, CAST(N'2024-09-10T18:30:00' AS SmallDateTime), 7, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (520, 3, CAST(N'2024-09-12T20:00:00' AS SmallDateTime), 10, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (521, 1, CAST(N'2024-09-14T11:00:00' AS SmallDateTime), 10, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (522, 2, CAST(N'2024-09-16T13:30:00' AS SmallDateTime), 10, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (523, 3, CAST(N'2024-09-18T16:00:00' AS SmallDateTime), 13, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (524, 1, CAST(N'2024-09-20T18:30:00' AS SmallDateTime), 13, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (525, 2, CAST(N'2024-09-22T11:00:00' AS SmallDateTime), 16, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (526, 3, CAST(N'2024-09-24T13:00:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (527, 1, CAST(N'2024-09-26T15:30:00' AS SmallDateTime), 21, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (528, 2, CAST(N'2024-09-28T17:00:00' AS SmallDateTime), 21, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (529, 3, CAST(N'2024-09-30T19:30:00' AS SmallDateTime), 25, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (530, 1, CAST(N'2024-09-30T21:00:00' AS SmallDateTime), 25, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (531, 1, CAST(N'2024-09-02T09:30:00' AS SmallDateTime), 4, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (532, 2, CAST(N'2024-09-09T14:00:00' AS SmallDateTime), 4, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (533, 3, CAST(N'2024-09-16T16:30:00' AS SmallDateTime), 4, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (534, 1, CAST(N'2024-09-23T18:00:00' AS SmallDateTime), 4, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (535, 2, CAST(N'2024-09-03T10:00:00' AS SmallDateTime), 7, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (536, 3, CAST(N'2024-09-10T12:00:00' AS SmallDateTime), 7, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (537, 1, CAST(N'2024-09-17T15:00:00' AS SmallDateTime), 7, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (538, 2, CAST(N'2024-09-24T17:30:00' AS SmallDateTime), 7, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (539, 1, CAST(N'2024-09-04T11:00:00' AS SmallDateTime), 10, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (540, 2, CAST(N'2024-09-11T13:30:00' AS SmallDateTime), 10, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (541, 3, CAST(N'2024-09-18T15:00:00' AS SmallDateTime), 10, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (542, 1, CAST(N'2024-09-25T18:30:00' AS SmallDateTime), 10, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (543, 1, CAST(N'2024-09-05T14:30:00' AS SmallDateTime), 13, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (544, 2, CAST(N'2024-09-12T16:00:00' AS SmallDateTime), 13, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (545, 3, CAST(N'2024-09-19T18:00:00' AS SmallDateTime), 13, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (546, 1, CAST(N'2024-09-26T19:30:00' AS SmallDateTime), 13, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (547, 2, CAST(N'2024-09-06T09:00:00' AS SmallDateTime), 16, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (548, 3, CAST(N'2024-09-13T11:30:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (549, 1, CAST(N'2024-09-20T13:30:00' AS SmallDateTime), 16, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (550, 2, CAST(N'2024-09-27T15:00:00' AS SmallDateTime), 16, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (551, 3, CAST(N'2024-09-07T12:30:00' AS SmallDateTime), 21, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (552, 1, CAST(N'2024-09-14T15:00:00' AS SmallDateTime), 21, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (553, 2, CAST(N'2024-09-21T17:00:00' AS SmallDateTime), 21, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (554, 3, CAST(N'2024-09-28T18:00:00' AS SmallDateTime), 21, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (555, 1, CAST(N'2024-09-08T10:00:00' AS SmallDateTime), 25, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (556, 2, CAST(N'2024-09-15T12:30:00' AS SmallDateTime), 25, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (557, 3, CAST(N'2024-09-22T14:00:00' AS SmallDateTime), 25, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (558, 1, CAST(N'2024-09-29T16:30:00' AS SmallDateTime), 25, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (559, 1, CAST(N'2024-10-02T09:30:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (560, 2, CAST(N'2024-10-09T14:00:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (561, 3, CAST(N'2024-10-16T16:30:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (562, 1, CAST(N'2024-10-23T18:00:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (563, 2, CAST(N'2024-10-03T10:00:00' AS SmallDateTime), 6, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (564, 3, CAST(N'2024-10-10T12:00:00' AS SmallDateTime), 6, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (565, 1, CAST(N'2024-10-17T15:00:00' AS SmallDateTime), 6, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (566, 2, CAST(N'2024-10-24T17:30:00' AS SmallDateTime), 6, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (567, 1, CAST(N'2024-10-04T11:00:00' AS SmallDateTime), 12, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (568, 2, CAST(N'2024-10-11T13:30:00' AS SmallDateTime), 12, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (569, 3, CAST(N'2024-10-18T15:00:00' AS SmallDateTime), 12, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (570, 1, CAST(N'2024-10-25T18:30:00' AS SmallDateTime), 12, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (571, 2, CAST(N'2024-10-05T14:30:00' AS SmallDateTime), 17, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (572, 3, CAST(N'2024-10-12T16:00:00' AS SmallDateTime), 17, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (573, 1, CAST(N'2024-10-19T18:00:00' AS SmallDateTime), 17, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (574, 2, CAST(N'2024-10-26T19:30:00' AS SmallDateTime), 17, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (575, 3, CAST(N'2024-10-06T09:00:00' AS SmallDateTime), 19, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (576, 1, CAST(N'2024-10-13T11:30:00' AS SmallDateTime), 19, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (577, 2, CAST(N'2024-10-20T13:30:00' AS SmallDateTime), 19, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (578, 3, CAST(N'2024-10-27T15:00:00' AS SmallDateTime), 19, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (579, 1, CAST(N'2024-10-07T12:30:00' AS SmallDateTime), 23, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (580, 2, CAST(N'2024-10-14T15:00:00' AS SmallDateTime), 23, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (581, 3, CAST(N'2024-10-21T17:00:00' AS SmallDateTime), 23, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (582, 1, CAST(N'2024-10-28T18:00:00' AS SmallDateTime), 23, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (583, 1, CAST(N'2024-11-02T09:30:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (584, 2, CAST(N'2024-11-08T11:30:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (585, 3, CAST(N'2024-11-14T13:30:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (586, 1, CAST(N'2024-11-20T15:00:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (587, 2, CAST(N'2024-11-26T17:00:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (588, 1, CAST(N'2024-11-03T10:00:00' AS SmallDateTime), 6, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (589, 2, CAST(N'2024-11-09T12:00:00' AS SmallDateTime), 6, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (590, 3, CAST(N'2024-11-15T14:00:00' AS SmallDateTime), 6, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (591, 1, CAST(N'2024-11-21T16:30:00' AS SmallDateTime), 6, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (592, 2, CAST(N'2024-11-27T18:30:00' AS SmallDateTime), 6, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (593, 3, CAST(N'2024-11-04T11:00:00' AS SmallDateTime), 12, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (594, 1, CAST(N'2024-11-10T13:30:00' AS SmallDateTime), 12, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (595, 2, CAST(N'2024-11-16T15:30:00' AS SmallDateTime), 12, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (596, 3, CAST(N'2024-11-22T17:00:00' AS SmallDateTime), 12, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (597, 1, CAST(N'2024-11-28T19:00:00' AS SmallDateTime), 12, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (598, 2, CAST(N'2024-11-05T10:30:00' AS SmallDateTime), 13, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (599, 3, CAST(N'2024-11-11T12:30:00' AS SmallDateTime), 13, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (600, 1, CAST(N'2024-11-17T14:00:00' AS SmallDateTime), 13, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (601, 2, CAST(N'2024-11-23T16:30:00' AS SmallDateTime), 13, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (602, 3, CAST(N'2024-11-29T18:30:00' AS SmallDateTime), 13, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (603, 1, CAST(N'2024-11-06T09:00:00' AS SmallDateTime), 18, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (604, 2, CAST(N'2024-11-12T11:30:00' AS SmallDateTime), 18, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (605, 3, CAST(N'2024-11-18T13:30:00' AS SmallDateTime), 18, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (606, 1, CAST(N'2024-11-24T15:00:00' AS SmallDateTime), 18, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (607, 2, CAST(N'2024-11-30T17:30:00' AS SmallDateTime), 18, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (608, 3, CAST(N'2024-11-07T10:00:00' AS SmallDateTime), 26, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (609, 1, CAST(N'2024-11-13T12:30:00' AS SmallDateTime), 26, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (610, 2, CAST(N'2024-11-19T14:00:00' AS SmallDateTime), 26, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (611, 3, CAST(N'2024-11-25T16:00:00' AS SmallDateTime), 26, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (612, 1, CAST(N'2024-11-30T18:00:00' AS SmallDateTime), 26, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (613, 1, CAST(N'2024-12-02T09:30:00' AS SmallDateTime), 2, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (614, 2, CAST(N'2024-12-08T11:30:00' AS SmallDateTime), 2, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (615, 3, CAST(N'2024-12-14T13:30:00' AS SmallDateTime), 2, 3)
GO
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (616, 1, CAST(N'2024-12-20T15:00:00' AS SmallDateTime), 2, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (617, 2, CAST(N'2024-12-26T17:00:00' AS SmallDateTime), 2, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (618, 3, CAST(N'2024-12-03T10:00:00' AS SmallDateTime), 5, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (619, 1, CAST(N'2024-12-09T12:00:00' AS SmallDateTime), 5, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (620, 2, CAST(N'2024-12-15T14:00:00' AS SmallDateTime), 5, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (621, 3, CAST(N'2024-12-21T16:30:00' AS SmallDateTime), 5, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (622, 1, CAST(N'2024-12-27T18:30:00' AS SmallDateTime), 5, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (623, 2, CAST(N'2024-12-04T11:00:00' AS SmallDateTime), 10, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (624, 3, CAST(N'2024-12-10T13:30:00' AS SmallDateTime), 10, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (625, 1, CAST(N'2024-12-16T15:30:00' AS SmallDateTime), 10, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (626, 2, CAST(N'2024-12-22T17:00:00' AS SmallDateTime), 10, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (627, 3, CAST(N'2024-12-28T19:00:00' AS SmallDateTime), 10, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (628, 1, CAST(N'2024-12-05T10:30:00' AS SmallDateTime), 14, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (629, 2, CAST(N'2024-12-11T12:30:00' AS SmallDateTime), 14, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (630, 3, CAST(N'2024-12-17T14:00:00' AS SmallDateTime), 14, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (631, 1, CAST(N'2024-12-23T16:30:00' AS SmallDateTime), 14, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (632, 2, CAST(N'2024-12-29T18:30:00' AS SmallDateTime), 14, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (633, 3, CAST(N'2024-12-06T09:00:00' AS SmallDateTime), 19, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (634, 1, CAST(N'2024-12-12T11:30:00' AS SmallDateTime), 19, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (635, 2, CAST(N'2024-12-18T13:30:00' AS SmallDateTime), 19, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (636, 3, CAST(N'2024-12-24T15:00:00' AS SmallDateTime), 19, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (637, 1, CAST(N'2024-12-30T17:30:00' AS SmallDateTime), 19, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (638, 2, CAST(N'2024-12-07T10:00:00' AS SmallDateTime), 25, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (639, 3, CAST(N'2024-12-13T12:30:00' AS SmallDateTime), 25, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (640, 1, CAST(N'2024-12-19T14:00:00' AS SmallDateTime), 25, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (641, 2, CAST(N'2024-12-25T16:00:00' AS SmallDateTime), 25, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (642, 3, CAST(N'2024-12-31T18:00:00' AS SmallDateTime), 25, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (643, 1, CAST(N'2025-01-02T09:30:00' AS SmallDateTime), 1, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (644, 2, CAST(N'2025-01-08T11:30:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (645, 3, CAST(N'2025-01-14T13:30:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (646, 1, CAST(N'2025-01-20T15:00:00' AS SmallDateTime), 1, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (647, 2, CAST(N'2025-01-26T17:00:00' AS SmallDateTime), 1, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (648, 3, CAST(N'2025-01-03T10:00:00' AS SmallDateTime), 5, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (649, 1, CAST(N'2025-01-09T12:00:00' AS SmallDateTime), 5, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (650, 2, CAST(N'2025-01-15T14:00:00' AS SmallDateTime), 5, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (651, 3, CAST(N'2025-01-21T16:30:00' AS SmallDateTime), 5, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (652, 1, CAST(N'2025-01-27T18:30:00' AS SmallDateTime), 5, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (653, 2, CAST(N'2025-01-04T11:00:00' AS SmallDateTime), 9, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (654, 3, CAST(N'2025-01-10T13:30:00' AS SmallDateTime), 9, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (655, 1, CAST(N'2025-01-16T15:30:00' AS SmallDateTime), 9, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (656, 2, CAST(N'2025-01-22T17:00:00' AS SmallDateTime), 9, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (657, 3, CAST(N'2025-01-28T19:00:00' AS SmallDateTime), 9, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (658, 1, CAST(N'2025-01-05T10:30:00' AS SmallDateTime), 13, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (659, 2, CAST(N'2025-01-11T12:30:00' AS SmallDateTime), 13, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (660, 3, CAST(N'2025-01-17T14:00:00' AS SmallDateTime), 13, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (661, 1, CAST(N'2025-01-23T16:30:00' AS SmallDateTime), 13, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (662, 2, CAST(N'2025-01-29T18:30:00' AS SmallDateTime), 13, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (663, 3, CAST(N'2025-01-06T09:00:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (664, 1, CAST(N'2025-01-12T11:30:00' AS SmallDateTime), 16, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (665, 2, CAST(N'2025-01-18T13:30:00' AS SmallDateTime), 16, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (666, 3, CAST(N'2025-01-24T15:00:00' AS SmallDateTime), 16, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (667, 1, CAST(N'2025-01-30T17:30:00' AS SmallDateTime), 16, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (668, 2, CAST(N'2025-01-07T10:00:00' AS SmallDateTime), 20, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (669, 3, CAST(N'2025-01-13T12:30:00' AS SmallDateTime), 20, 2)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (670, 1, CAST(N'2025-01-19T14:00:00' AS SmallDateTime), 20, 3)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (671, 2, CAST(N'2025-01-25T16:00:00' AS SmallDateTime), 20, 1)
INSERT [dbo].[Reproducciones] ([idReproduccion], [numeroSala], [horarioInicio], [idPelicula], [idIdioma]) VALUES (672, 3, CAST(N'2025-01-31T18:00:00' AS SmallDateTime), 20, 2)
SET IDENTITY_INSERT [dbo].[Reproducciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Salas] ON 

INSERT [dbo].[Salas] ([numeroSala], [idTipoSala]) VALUES (1, 1)
INSERT [dbo].[Salas] ([numeroSala], [idTipoSala]) VALUES (2, 2)
INSERT [dbo].[Salas] ([numeroSala], [idTipoSala]) VALUES (3, 3)
SET IDENTITY_INSERT [dbo].[Salas] OFF
GO
SET IDENTITY_INSERT [dbo].[SalasXEmpleados] ON 

INSERT [dbo].[SalasXEmpleados] ([idSalaXEmpleado], [numeroSala], [idEmpleado]) VALUES (1, 1, 1)
INSERT [dbo].[SalasXEmpleados] ([idSalaXEmpleado], [numeroSala], [idEmpleado]) VALUES (2, 2, 2)
INSERT [dbo].[SalasXEmpleados] ([idSalaXEmpleado], [numeroSala], [idEmpleado]) VALUES (3, 3, 3)
SET IDENTITY_INSERT [dbo].[SalasXEmpleados] OFF
GO
SET IDENTITY_INSERT [dbo].[TiposSalas] ON 

INSERT [dbo].[TiposSalas] ([idTipoSala], [nombre]) VALUES (1, N'Estándar')
INSERT [dbo].[TiposSalas] ([idTipoSala], [nombre]) VALUES (2, N'3D')
INSERT [dbo].[TiposSalas] ([idTipoSala], [nombre]) VALUES (3, N'IMAX')
SET IDENTITY_INSERT [dbo].[TiposSalas] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([idUsuario], [e-mail], [contrasenia]) VALUES (1, N'sapepepino@gmail.com', N'MQAyADMANAA1ADYANwA4AA==')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Asientos]  WITH CHECK ADD  CONSTRAINT [fkFilasAsientos] FOREIGN KEY([idFila])
REFERENCES [dbo].[Filas] ([idFila])
GO
ALTER TABLE [dbo].[Asientos] CHECK CONSTRAINT [fkFilasAsientos]
GO
ALTER TABLE [dbo].[AsientosXReproducciones]  WITH CHECK ADD  CONSTRAINT [fkAsientosAsientosXReproducciones] FOREIGN KEY([idAsiento])
REFERENCES [dbo].[Asientos] ([idAsiento])
GO
ALTER TABLE [dbo].[AsientosXReproducciones] CHECK CONSTRAINT [fkAsientosAsientosXReproducciones]
GO
ALTER TABLE [dbo].[AsientosXReproducciones]  WITH CHECK ADD  CONSTRAINT [fkReproduccionesAsientosXReproducciones] FOREIGN KEY([idReproduccion])
REFERENCES [dbo].[Reproducciones] ([idReproduccion])
GO
ALTER TABLE [dbo].[AsientosXReproducciones] CHECK CONSTRAINT [fkReproduccionesAsientosXReproducciones]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_clientes_usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_clientes_usuarios]
GO
ALTER TABLE [dbo].[DetalleFacturas]  WITH CHECK ADD  CONSTRAINT [fkAsientosDetalleFacturas] FOREIGN KEY([idAsiento])
REFERENCES [dbo].[Asientos] ([idAsiento])
GO
ALTER TABLE [dbo].[DetalleFacturas] CHECK CONSTRAINT [fkAsientosDetalleFacturas]
GO
ALTER TABLE [dbo].[DetalleFacturas]  WITH CHECK ADD  CONSTRAINT [fkFacturasDetalleFacturas] FOREIGN KEY([idFactura])
REFERENCES [dbo].[Facturas] ([idFactura])
GO
ALTER TABLE [dbo].[DetalleFacturas] CHECK CONSTRAINT [fkFacturasDetalleFacturas]
GO
ALTER TABLE [dbo].[DetalleFacturas]  WITH CHECK ADD  CONSTRAINT [fkPromocionesDetalleFacturas] FOREIGN KEY([idPromocion])
REFERENCES [dbo].[Promociones] ([idPromocion])
GO
ALTER TABLE [dbo].[DetalleFacturas] CHECK CONSTRAINT [fkPromocionesDetalleFacturas]
GO
ALTER TABLE [dbo].[DetalleFacturas]  WITH CHECK ADD  CONSTRAINT [fkReproduccionesDetalleFacturas] FOREIGN KEY([idReproduccion])
REFERENCES [dbo].[Reproducciones] ([idReproduccion])
GO
ALTER TABLE [dbo].[DetalleFacturas] CHECK CONSTRAINT [fkReproduccionesDetalleFacturas]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [FK_empleados_usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [FK_empleados_usuarios]
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD  CONSTRAINT [fkAreasEmpleados] FOREIGN KEY([idArea])
REFERENCES [dbo].[Areas] ([idArea])
GO
ALTER TABLE [dbo].[Empleados] CHECK CONSTRAINT [fkAreasEmpleados]
GO
ALTER TABLE [dbo].[Facturas]  WITH CHECK ADD  CONSTRAINT [fkClientesFacturas] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Facturas] CHECK CONSTRAINT [fkClientesFacturas]
GO
ALTER TABLE [dbo].[Filas]  WITH CHECK ADD  CONSTRAINT [fkSalasFilas] FOREIGN KEY([numeroSala])
REFERENCES [dbo].[Salas] ([numeroSala])
GO
ALTER TABLE [dbo].[Filas] CHECK CONSTRAINT [fkSalasFilas]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [fkGenerosPeliculas] FOREIGN KEY([idGenero])
REFERENCES [dbo].[Generos] ([idGenero])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [fkGenerosPeliculas]
GO
ALTER TABLE [dbo].[PeliculasXCarteleras]  WITH CHECK ADD  CONSTRAINT [fkCartelerasPeliculasXCarteleras] FOREIGN KEY([idCartelera])
REFERENCES [dbo].[Carteleras] ([idCartelera])
GO
ALTER TABLE [dbo].[PeliculasXCarteleras] CHECK CONSTRAINT [fkCartelerasPeliculasXCarteleras]
GO
ALTER TABLE [dbo].[PeliculasXCarteleras]  WITH CHECK ADD  CONSTRAINT [fkPeliculasPeliculasXCarteleras] FOREIGN KEY([idPelicula])
REFERENCES [dbo].[Peliculas] ([idPelicula])
GO
ALTER TABLE [dbo].[PeliculasXCarteleras] CHECK CONSTRAINT [fkPeliculasPeliculasXCarteleras]
GO
ALTER TABLE [dbo].[PeliculasXIdiomas]  WITH CHECK ADD  CONSTRAINT [fkIdiomasPeliculasXIdiomas] FOREIGN KEY([idIdioma])
REFERENCES [dbo].[Idiomas] ([idIdioma])
GO
ALTER TABLE [dbo].[PeliculasXIdiomas] CHECK CONSTRAINT [fkIdiomasPeliculasXIdiomas]
GO
ALTER TABLE [dbo].[PeliculasXIdiomas]  WITH CHECK ADD  CONSTRAINT [fkPeliculasPeliculasXIdiomas] FOREIGN KEY([idPelicula])
REFERENCES [dbo].[Peliculas] ([idPelicula])
GO
ALTER TABLE [dbo].[PeliculasXIdiomas] CHECK CONSTRAINT [fkPeliculasPeliculasXIdiomas]
GO
ALTER TABLE [dbo].[Reproducciones]  WITH CHECK ADD  CONSTRAINT [fkIdiomasReproducciones] FOREIGN KEY([idIdioma])
REFERENCES [dbo].[Idiomas] ([idIdioma])
GO
ALTER TABLE [dbo].[Reproducciones] CHECK CONSTRAINT [fkIdiomasReproducciones]
GO
ALTER TABLE [dbo].[Reproducciones]  WITH CHECK ADD  CONSTRAINT [fkPeliculasReproducciones] FOREIGN KEY([idPelicula])
REFERENCES [dbo].[Peliculas] ([idPelicula])
GO
ALTER TABLE [dbo].[Reproducciones] CHECK CONSTRAINT [fkPeliculasReproducciones]
GO
ALTER TABLE [dbo].[Reproducciones]  WITH CHECK ADD  CONSTRAINT [fkSalasReproducciones] FOREIGN KEY([numeroSala])
REFERENCES [dbo].[Salas] ([numeroSala])
GO
ALTER TABLE [dbo].[Reproducciones] CHECK CONSTRAINT [fkSalasReproducciones]
GO
ALTER TABLE [dbo].[Salas]  WITH CHECK ADD  CONSTRAINT [fkTiposSalasSalas] FOREIGN KEY([idTipoSala])
REFERENCES [dbo].[TiposSalas] ([idTipoSala])
GO
ALTER TABLE [dbo].[Salas] CHECK CONSTRAINT [fkTiposSalasSalas]
GO
ALTER TABLE [dbo].[SalasXEmpleados]  WITH CHECK ADD  CONSTRAINT [fkEmpleadosSalasXEmpleados] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleados] ([idEmpleado])
GO
ALTER TABLE [dbo].[SalasXEmpleados] CHECK CONSTRAINT [fkEmpleadosSalasXEmpleados]
GO
ALTER TABLE [dbo].[SalasXEmpleados]  WITH CHECK ADD  CONSTRAINT [fkSalasSalasXEmpleados] FOREIGN KEY([numeroSala])
REFERENCES [dbo].[Salas] ([numeroSala])
GO
ALTER TABLE [dbo].[SalasXEmpleados] CHECK CONSTRAINT [fkSalasSalasXEmpleados]
GO
/****** Object:  StoredProcedure [dbo].[Consulta1]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Consulta1] @fechaInicio date, @fechaFin date
as
begin
select p.idPelicula, p.nombre, sum(df.precio - df.precio * (pr.descuento
/ 100.0)) AS ingresosTotales, f.fecha AS Fecha
from Peliculas as p
 join Reproducciones as r on r.idPelicula = p.idPelicula
 join DetalleFacturas as df on df.idReproduccion = r.idReproduccion
 join Facturas as f on f.idFactura = df.idFactura
 join Promociones as pr on pr.idPromocion = df.idPromocion
where f.fecha between @fechaInicio and @fechaFin
group by p.idPelicula, p.nombre,f.fecha
order by ingresosTotales desc
end
GO
/****** Object:  StoredProcedure [dbo].[consulta2]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[consulta2]
@duracion int
as
begin
select P.idPelicula,P.nombre,P.fechaEstreno,P.duracionMinutos,P.sinopsis,G.nombre as Genero,
		(select sum(D.precio-D.precio*(Pr.descuento/100)) from Reproducciones as R
		inner join DetalleFacturas as D on D.idReproduccion = R.idReproduccion
		inner join Promociones as Pr on Pr.idPromocion = D.idPromocion
		where R.idPelicula = P.idPelicula
		group by R.idPelicula) as MontoGenerado 
from Peliculas as P	
inner join Generos as G on G.idGenero=P.idGenero
where P.duracionMinutos > @duracion
end
GO
/****** Object:  StoredProcedure [dbo].[consulta3]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[consulta3]
@idPelicula int,
@asientoLibre bit
as
begin
--select R.idReproduccion,R.numeroSala,R.idPelicula,I.nombre as Idioma,R.horarioInicio from Reproducciones as R
select top 1 R.idReproduccion,R.numeroSala,R.idPelicula,I.nombre as Idioma,R.horarioInicio,count(*) as CantidadAsientos from Peliculas as P
inner join Reproducciones as R on R.idPelicula = P.idPelicula
inner join Idiomas as I on I.idIdioma = R.idIdioma
full join AsientosXReproducciones as V on V.idReproduccion = R.idReproduccion
inner join Salas as S on S.numeroSala = R.numeroSala
inner join Filas as F on F.numeroSala=S.numeroSala
inner join Asientos as A on A.idFila = F.idFila
	where ((@asientoLibre = 0 and (V.libre = 0 and V.idAsiento=A.idAsiento)) or (@asientoLibre = 1 and ((V.libre = 1 and V.idAsiento=A.idAsiento) or V.libre is null))) and P.idPelicula = @idPelicula -- <-- ID PELICULA
	group by R.idReproduccion,R.numeroSala,R.idPelicula,I.nombre,R.horarioInicio
	order by count(*) desc
end
GO
/****** Object:  StoredProcedure [dbo].[Consulta4]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*create view EmpleadosEnReproduccion as 
select E.idEmpleado from Empleados as E 
inner join SalasXEmpleados as SXE on SXE.idEmpleado=E.idEmpleado
inner join Salas as S on S.numeroSala=SXE.numeroSala
inner join Reproducciones as R on R.numeroSala=S.numeroSala*/

CREATE procedure [dbo].[Consulta4]
@idsala int
as
begin

select
concat(F.letra,'-',A.numeroAsiento) as Asiento,count(AXR.idAsientoXReproduccion)
as Usos,
Concat((Count(AXR.idAsientoXReproduccion)*100)/
(select count(*)
	FROM Reproducciones as R
	inner join AsientosXReproducciones as ARX on ARX.idReproduccion = R.idReproduccion
	inner join Asientos as A2 on A2.idAsiento = ARX.idAsiento
	inner join Filas as F on F.idFila=A2.idFila
	inner join Salas as S on S.numeroSala = F.numeroSala
	where S.numeroSala = @idsala),'%') as Porcentaje
from Asientos as A
inner join Filas as F on F.idFila = A.idFila
inner join Salas as S on S.numeroSala = F.numeroSala
full join AsientosXReproducciones as AXR on AXR.idAsiento = A.idAsiento
where S.numeroSala = @idsala
group by F.letra,A.numeroAsiento
order by 3 desc,1,2


end
GO
/****** Object:  StoredProcedure [dbo].[Consulta5]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Consulta5]
@montoMinimo decimal(12,2)
as
begin
--select p.nombre as Pelicula,
--i.nombre as Idioma,
--count(r.idReproduccion) as TotalReproducciones,
--sum(df.precio-df.precio*(pr.descuento/100)) as IngresoIdioma,
--sum(sum(df.precio-df.precio*(pr.descuento/100))) over(partition by p.idPelicula) as IngresoTotal
--from Peliculas p
--full join Reproducciones r on p.idPelicula = r.idPelicula
--full join Idiomas i on r.idIdioma = i.idIdioma
--full join DetalleFacturas df on r.idReproduccion = df.idReproduccion
--full join Promociones as pr on pr.idPromocion = df.idPromocion
--where p.idPelicula in
--(select r.idPelicula from Reproducciones as R
--group by r.idPelicula
--having count(distinct r.idIdioma)>1)
--group by p.idPelicula,p.nombre, i.nombre
--having ((sum(df.precio-df.precio*(pr.descuento/100))) > @montoMinimo or @montoMinimo = 0) -- <--MontoMinimo
--order by 5 desc,4 descSELECT 
    Pelicula,
    Idioma,
    TotalReproducciones,
    IngresoIdioma,
    IngresoTotal
FROM V_IngresosPorPelicula
WHERE IngresoTotal > @montoMinimo or @montoMinimo = 0
ORDER BY IngresoTotal DESC,IngresoIdioma DESC;
end
GO
/****** Object:  StoredProcedure [dbo].[SP_ObtenerTotalVentas]    Script Date: 14/11/2024 03:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SP_ObtenerTotalVentas] @fechaInicio date, @fechaFin date
as
begin
select p.idPelicula, p.nombre, sum(df.precio - df.precio * (pr.descuento
/ 100.0)) AS ingresosTotales
from Peliculas as p
join Reproducciones as r on r.idPelicula = p.idPelicula
join DetalleFacturas as df on df.idReproduccion = r.idReproduccion
join Facturas as f on f.idFactura = df.idFactura
join Promociones as pr on pr.idPromocion = df.idPromocion
where f.fecha between @fechaInicio and @fechaFin
group by p.idPelicula, p.nombre
order by ingresosTotales asc
end
GO
USE [master]
GO
ALTER DATABASE [Cine_G01] SET  READ_WRITE 
GO
