USE [master]
GO
/****** Object:  Database [Cine_G01]    Script Date: 14/11/2024 11:17:57 ******/
CREATE DATABASE [Cine_G01]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cine_G01', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Cine_G01.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Peliculas]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Idiomas]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Reproducciones]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Promociones]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[DetalleFacturas]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  View [dbo].[V_IngresosPorPelicula]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Salas]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Filas]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Asientos]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[AsientosXReproducciones]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  View [dbo].[V_AsientosXReproducciones]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Empleados]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[SalasXEmpleados]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  View [dbo].[EmpleadosEnReproduccion]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Areas]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Carteleras]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 14/11/2024 11:17:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[apellido] [varchar](30) NOT NULL,
	[telefono] [varchar](30) NULL,
	[idUsuario] [int] NULL,
 CONSTRAINT [pkClientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facturas]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Generos]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[PeliculasXCarteleras]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[PeliculasXIdiomas]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[TiposSalas]    Script Date: 14/11/2024 11:17:57 ******/
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
/****** Object:  Table [dbo].[Usuarios]    Script Date: 14/11/2024 11:17:57 ******/
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
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (6, 0, 81, 528)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (7, 0, 24, 637)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (8, 0, 85, 575)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (9, 0, 38, 278)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (10, 0, 112, 251)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (11, 0, 78, 506)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (12, 0, 116, 424)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (13, 0, 95, 481)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (14, 0, 110, 459)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (15, 0, 24, 318)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (16, 0, 17, 274)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (17, 0, 28, 419)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (18, 0, 19, 625)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (19, 0, 73, 650)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (20, 0, 46, 509)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (21, 0, 73, 438)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (22, 0, 99, 513)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (23, 0, 112, 287)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (24, 0, 39, 298)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (25, 0, 42, 289)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (26, 0, 4, 341)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (27, 0, 30, 543)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (28, 0, 47, 665)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (29, 0, 52, 512)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (30, 0, 43, 617)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (31, 0, 82, 286)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (32, 0, 109, 453)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (33, 0, 110, 311)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (34, 0, 101, 221)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (35, 0, 89, 346)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (36, 0, 84, 220)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (37, 0, 107, 472)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (38, 0, 117, 279)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (39, 0, 13, 344)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (40, 0, 23, 410)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (41, 0, 78, 227)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (42, 0, 87, 439)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (43, 0, 57, 477)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (44, 0, 50, 254)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (45, 0, 77, 484)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (46, 0, 31, 482)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (47, 0, 24, 530)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (48, 0, 57, 396)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (49, 0, 83, 319)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (50, 0, 87, 367)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (51, 0, 66, 496)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (52, 0, 69, 522)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (53, 0, 102, 358)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (54, 0, 1, 350)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (55, 0, 81, 369)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (56, 0, 8, 398)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (57, 0, 54, 270)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (58, 0, 36, 664)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (59, 0, 15, 521)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (60, 0, 92, 234)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (61, 0, 102, 433)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (62, 0, 61, 662)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (63, 0, 9, 637)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (64, 0, 18, 242)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (65, 0, 18, 576)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (66, 0, 49, 480)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (67, 0, 46, 310)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (68, 0, 58, 233)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (69, 0, 114, 666)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (70, 0, 101, 430)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (71, 0, 48, 330)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (72, 0, 50, 244)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (73, 0, 100, 651)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (74, 0, 25, 649)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (75, 0, 109, 349)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (76, 0, 93, 265)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (77, 0, 120, 308)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (78, 0, 120, 448)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (79, 0, 24, 637)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (80, 0, 49, 509)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (81, 0, 115, 645)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (82, 0, 93, 478)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (83, 0, 112, 241)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (84, 0, 18, 559)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (85, 0, 86, 672)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (86, 0, 83, 220)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (87, 0, 51, 656)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (88, 0, 114, 382)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (89, 0, 85, 290)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (90, 0, 30, 586)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (91, 0, 42, 647)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (92, 0, 115, 657)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (93, 0, 59, 354)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (94, 0, 58, 487)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (95, 0, 44, 556)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (96, 0, 1, 395)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (97, 0, 87, 421)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (98, 0, 65, 275)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (99, 0, 76, 414)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (100, 0, 91, 526)
GO
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (101, 0, 48, 328)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (102, 0, 113, 370)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (103, 0, 94, 453)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (104, 0, 57, 653)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (105, 0, 6, 597)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (106, 0, 20, 419)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (107, 0, 98, 593)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (108, 0, 44, 650)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (109, 0, 21, 483)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (110, 0, 76, 540)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (111, 0, 73, 503)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (112, 0, 3, 479)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (113, 0, 117, 355)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (114, 0, 93, 599)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (115, 0, 76, 547)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (116, 0, 115, 355)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (117, 0, 14, 492)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (118, 0, 34, 612)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (119, 0, 51, 432)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (120, 0, 30, 312)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (121, 0, 71, 396)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (122, 0, 38, 538)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (123, 0, 36, 341)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (124, 0, 2, 392)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (125, 0, 93, 241)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (126, 0, 33, 655)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (127, 0, 37, 644)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (128, 0, 76, 584)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (129, 0, 53, 275)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (130, 0, 33, 365)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (131, 0, 53, 313)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (132, 0, 106, 533)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (133, 0, 10, 562)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (134, 0, 73, 267)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (135, 0, 56, 366)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (136, 0, 44, 589)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (137, 0, 87, 648)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (138, 0, 78, 577)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (139, 0, 25, 543)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (140, 0, 39, 289)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (141, 0, 101, 305)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (142, 0, 20, 222)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (143, 0, 113, 545)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (144, 0, 60, 257)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (145, 0, 99, 340)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (146, 0, 37, 614)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (147, 0, 61, 387)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (148, 0, 84, 369)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (149, 0, 42, 641)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (150, 0, 9, 576)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (151, 0, 47, 635)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (152, 0, 10, 606)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (153, 0, 80, 322)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (154, 0, 36, 537)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (155, 0, 16, 263)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (156, 0, 55, 301)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (157, 0, 102, 397)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (158, 0, 74, 289)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (159, 0, 62, 286)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (160, 0, 23, 546)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (161, 0, 101, 488)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (162, 0, 26, 413)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (163, 0, 8, 434)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (164, 0, 95, 605)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (165, 0, 8, 600)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (166, 0, 25, 640)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (167, 0, 113, 645)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (168, 0, 71, 264)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (169, 0, 106, 238)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (170, 0, 81, 509)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (171, 0, 25, 443)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (172, 0, 9, 416)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (173, 0, 70, 254)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (174, 0, 95, 290)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (175, 0, 96, 385)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (176, 0, 120, 241)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (177, 0, 82, 574)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (178, 0, 45, 512)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (179, 0, 107, 545)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (180, 0, 2, 470)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (181, 0, 85, 564)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (182, 0, 93, 630)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (183, 0, 100, 305)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (184, 0, 91, 234)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (185, 0, 53, 577)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (186, 0, 96, 238)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (187, 0, 28, 389)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (188, 0, 91, 602)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (189, 0, 106, 599)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (190, 0, 103, 548)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (191, 0, 36, 449)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (192, 0, 14, 446)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (193, 0, 120, 536)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (194, 0, 7, 243)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (195, 0, 34, 269)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (196, 0, 16, 622)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (197, 0, 19, 443)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (198, 0, 79, 455)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (199, 0, 111, 331)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (200, 0, 66, 538)
GO
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (201, 0, 25, 300)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (202, 0, 50, 372)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (203, 0, 39, 538)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (204, 0, 4, 537)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (205, 0, 72, 420)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (206, 0, 36, 514)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (207, 0, 111, 445)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (208, 0, 62, 230)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (209, 0, 83, 286)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (210, 0, 103, 608)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (211, 0, 28, 280)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (212, 0, 54, 319)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (213, 0, 14, 277)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (214, 0, 45, 278)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (215, 0, 14, 482)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (216, 0, 90, 611)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (217, 0, 44, 261)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (218, 0, 65, 336)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (219, 0, 34, 591)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (220, 0, 61, 644)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (221, 0, 98, 311)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (222, 0, 43, 635)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (223, 0, 105, 385)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (224, 0, 73, 450)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (225, 0, 22, 505)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (226, 0, 64, 369)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (227, 0, 69, 450)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (228, 0, 97, 238)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (229, 0, 117, 427)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (230, 0, 82, 604)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (231, 0, 17, 446)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (232, 0, 15, 446)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (233, 0, 84, 571)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (234, 0, 27, 291)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (235, 0, 5, 649)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (236, 0, 11, 392)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (237, 0, 1, 356)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (238, 0, 35, 543)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (239, 0, 86, 557)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (240, 0, 73, 563)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (241, 0, 24, 518)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (242, 0, 16, 288)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (243, 0, 96, 593)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (244, 0, 32, 470)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (245, 0, 4, 655)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (246, 0, 94, 376)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (247, 0, 22, 410)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (248, 0, 33, 303)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (249, 0, 71, 598)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (250, 0, 65, 580)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (251, 0, 88, 343)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (252, 0, 97, 445)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (253, 0, 81, 589)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (254, 0, 48, 484)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (255, 0, 58, 484)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (256, 0, 92, 397)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (257, 0, 16, 543)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (258, 0, 110, 578)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (259, 0, 38, 227)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (260, 0, 75, 372)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (261, 0, 3, 407)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (262, 0, 36, 531)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (263, 0, 98, 541)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (264, 0, 97, 536)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (265, 0, 56, 647)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (266, 0, 52, 261)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (267, 0, 70, 273)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (268, 0, 104, 412)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (269, 0, 21, 534)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (270, 0, 16, 534)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (271, 0, 109, 268)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (272, 0, 47, 535)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (273, 0, 25, 446)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (274, 0, 84, 307)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (275, 0, 25, 562)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (276, 0, 33, 407)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (277, 0, 111, 526)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (278, 0, 88, 578)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (279, 0, 54, 369)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (280, 0, 30, 486)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (281, 0, 30, 300)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (282, 0, 88, 485)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (283, 0, 102, 234)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (284, 0, 21, 473)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (285, 0, 41, 490)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (286, 0, 45, 223)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (287, 0, 27, 514)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (288, 0, 9, 631)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (289, 0, 110, 453)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (290, 0, 75, 638)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (291, 0, 59, 522)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (292, 0, 60, 390)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (293, 0, 58, 665)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (294, 0, 7, 586)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (295, 0, 30, 579)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (296, 0, 82, 461)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (297, 0, 24, 543)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (298, 0, 110, 602)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (299, 0, 27, 591)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (300, 0, 78, 614)
GO
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (301, 0, 99, 536)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (302, 0, 55, 316)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (303, 0, 71, 598)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (304, 0, 22, 643)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (305, 0, 103, 367)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (306, 0, 96, 343)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (307, 0, 12, 521)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (308, 0, 40, 584)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (309, 0, 4, 449)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (310, 0, 70, 369)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (311, 0, 109, 418)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (312, 0, 79, 301)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (313, 0, 22, 252)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (314, 0, 48, 261)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (315, 0, 120, 308)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (316, 0, 22, 463)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (317, 0, 49, 550)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (318, 0, 120, 564)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (319, 0, 13, 327)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (320, 0, 42, 348)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (321, 0, 6, 246)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (322, 0, 27, 440)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (323, 0, 85, 497)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (324, 0, 48, 286)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (325, 0, 13, 277)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (326, 0, 114, 561)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (327, 0, 25, 531)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (328, 0, 64, 432)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (329, 0, 86, 585)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (330, 0, 116, 418)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (331, 0, 33, 476)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (332, 0, 101, 578)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (333, 0, 33, 552)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (334, 0, 19, 649)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (335, 0, 78, 307)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (336, 0, 116, 385)
INSERT [dbo].[AsientosXReproducciones] ([idAsientoXReproduccion], [libre], [idAsiento], [idReproduccion]) VALUES (337, 0, 57, 556)
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

INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (1, N'ventanilla', N'ventanilla', N'555-1234', NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (2, N'María', N'Gómez', N'555-5678', NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (3, N'Carlos', N'Ramírez', N'555-9012', NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (4, N'Carlos', N'Ramírez', N'5551234567', NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (5, N'Ana', N'Martínez', NULL, NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (6, N'Luis', N'González', N'5552345678', NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (7, N'María', N'López', NULL, NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (8, N'Jorge', N'Pérez', N'5553456789', NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (9, N'Laura', N'Sánchez', N'5554567890', NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (10, N'Pablo', N'Rodríguez', NULL, NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (11, N'Silvia', N'Torres', N'5555678901', NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (12, N'Roberto', N'Hernández', NULL, NULL)
INSERT [dbo].[Clientes] ([idCliente], [nombre], [apellido], [telefono], [idUsuario]) VALUES (13, N'Carmen', N'Jiménez', N'5556789012', NULL)
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleFacturas] ON 

INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (1, 100, 1, 1, 1, 1)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (2, 80, 2, 2, 2, 2)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (7, 153, 6, 63, 256, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (9, 111, 29, 57, 556, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (10, 86, 15, 74, 583, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (11, 111, 2, 106, 463, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (12, 73, 27, 57, 389, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (13, 137, 14, 116, 385, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (14, 141, 2, 118, 490, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (15, 50, 26, 98, 243, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (16, 114, 3, 114, 435, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (17, 158, 21, 93, 347, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (18, 193, 23, 82, 376, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (19, 69, 3, 82, 634, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (20, 78, 6, 78, 307, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (21, 122, 4, 66, 259, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (22, 119, 28, 91, 589, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (23, 54, 1, 107, 558, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (24, 196, 17, 26, 414, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (25, 162, 18, 15, 302, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (26, 147, 18, 96, 441, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (27, 103, 27, 19, 649, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (28, 131, 18, 33, 552, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (29, 174, 1, 101, 578, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (30, 64, 22, 37, 300, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (31, 179, 23, 55, 670, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (32, 65, 8, 33, 476, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (33, 119, 28, 53, 334, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (34, 175, 18, 44, 499, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (35, 195, 11, 13, 313, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (36, 55, 18, 116, 418, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (37, 176, 8, 16, 605, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (38, 106, 7, 74, 238, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (39, 56, 3, 52, 425, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (40, 128, 9, 117, 291, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (41, 188, 1, 59, 460, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (42, 171, 28, 18, 393, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (43, 90, 20, 86, 585, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (44, 115, 6, 64, 432, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (45, 152, 24, 39, 253, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (46, 176, 20, 6, 424, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (47, 113, 1, 37, 513, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (48, 92, 27, 25, 531, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (49, 111, 23, 71, 578, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (50, 175, 20, 7, 391, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (51, 156, 28, 114, 561, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (52, 176, 18, 47, 243, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (53, 147, 6, 26, 568, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (54, 138, 29, 117, 570, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (55, 151, 18, 34, 526, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (56, 179, 4, 13, 277, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (57, 77, 20, 72, 373, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (58, 140, 7, 22, 610, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (59, 141, 5, 114, 250, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (60, 89, 26, 3, 244, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (61, 117, 16, 10, 376, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (62, 76, 29, 111, 601, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (63, 50, 27, 17, 535, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (64, 138, 6, 48, 286, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (65, 137, 24, 116, 244, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (66, 172, 8, 39, 612, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (67, 92, 3, 5, 320, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (68, 193, 5, 85, 497, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (69, 188, 21, 90, 516, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (70, 100, 23, 62, 243, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (71, 78, 13, 27, 440, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (72, 198, 27, 6, 246, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (73, 166, 11, 42, 348, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (74, 137, 26, 97, 243, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (75, 66, 9, 98, 598, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (76, 129, 30, 13, 327, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (77, 108, 15, 73, 284, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (78, 74, 15, 91, 570, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (79, 173, 24, 74, 640, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (80, 155, 22, 16, 672, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (81, 126, 28, 120, 564, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (82, 141, 7, 91, 239, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (83, 188, 30, 49, 550, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (84, 70, 23, 29, 414, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (85, 70, 14, 53, 266, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (86, 101, 6, 22, 463, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (87, 79, 19, 31, 669, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (88, 144, 12, 120, 308, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (89, 72, 1, 45, 630, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (90, 167, 1, 48, 261, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (91, 168, 20, 22, 252, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (92, 179, 14, 20, 305, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (93, 190, 7, 79, 301, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (94, 137, 14, 109, 235, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (95, 72, 3, 109, 418, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (96, 108, 29, 52, 293, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (97, 94, 12, 117, 646, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (98, 68, 4, 100, 422, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (99, 79, 16, 77, 483, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (100, 132, 7, 64, 321, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (101, 151, 22, 50, 394, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (102, 56, 12, 70, 369, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (103, 51, 9, 4, 449, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (104, 67, 1, 105, 538, 0)
GO
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (105, 84, 16, 112, 377, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (106, 63, 11, 4, 305, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (107, 99, 14, 69, 521, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (108, 131, 27, 31, 340, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (109, 156, 21, 108, 591, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (110, 174, 20, 40, 584, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (111, 141, 15, 43, 545, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (112, 63, 10, 75, 365, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (113, 172, 25, 12, 521, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (114, 143, 6, 99, 219, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (115, 134, 31, 73, 593, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (116, 105, 7, 64, 329, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (117, 69, 22, 96, 343, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (118, 169, 22, 37, 356, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (119, 162, 14, 2, 452, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (120, 87, 24, 41, 349, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (121, 159, 2, 103, 367, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (122, 175, 10, 22, 538, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (123, 125, 26, 22, 643, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (124, 122, 23, 90, 402, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (125, 188, 16, 71, 598, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (126, 157, 4, 60, 515, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (127, 141, 9, 84, 582, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (128, 110, 5, 55, 316, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (129, 66, 9, 99, 536, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (130, 128, 21, 78, 614, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (131, 145, 28, 27, 591, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (132, 91, 28, 110, 602, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (133, 75, 17, 31, 298, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (134, 116, 9, 99, 535, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (135, 102, 16, 11, 561, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (136, 161, 4, 76, 225, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (137, 112, 8, 94, 319, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (138, 172, 12, 55, 430, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (139, 164, 8, 24, 543, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (140, 178, 29, 57, 350, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (141, 129, 3, 118, 614, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (142, 88, 6, 79, 260, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (143, 180, 25, 41, 672, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (144, 104, 2, 46, 391, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (145, 152, 18, 63, 643, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (146, 172, 3, 87, 312, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (147, 175, 8, 82, 461, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (148, 130, 13, 15, 456, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (149, 57, 10, 30, 579, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (150, 126, 4, 7, 586, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (151, 92, 28, 28, 526, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (152, 138, 4, 55, 314, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (153, 105, 30, 58, 665, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (154, 178, 30, 115, 395, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (155, 187, 24, 4, 231, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (156, 198, 27, 46, 660, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (157, 142, 26, 11, 598, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (158, 111, 6, 60, 390, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (159, 138, 3, 59, 522, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (160, 107, 20, 50, 546, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (161, 80, 19, 46, 324, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (162, 98, 11, 120, 649, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (163, 103, 19, 75, 638, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (164, 189, 7, 56, 343, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (165, 106, 16, 73, 382, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (166, 70, 13, 110, 453, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (167, 186, 14, 19, 424, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (168, 105, 21, 9, 631, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (169, 194, 17, 27, 514, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (170, 76, 7, 98, 374, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (171, 187, 16, 45, 223, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (172, 179, 13, 41, 490, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (173, 103, 31, 65, 355, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (174, 119, 2, 21, 473, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (175, 134, 22, 120, 312, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (176, 72, 30, 104, 267, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (177, 76, 28, 102, 234, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (178, 89, 16, 88, 485, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (179, 161, 23, 61, 425, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (180, 87, 19, 30, 300, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (181, 198, 1, 6, 311, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (182, 130, 23, 11, 516, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (183, 125, 10, 98, 225, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (184, 110, 28, 30, 486, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (185, 133, 2, 89, 307, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (186, 141, 19, 54, 369, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (187, 131, 12, 23, 554, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (188, 77, 21, 114, 516, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (189, 105, 7, 100, 226, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (190, 117, 21, 51, 251, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (191, 76, 9, 105, 505, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (192, 82, 23, 108, 390, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (193, 138, 17, 49, 249, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (194, 65, 20, 10, 487, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (195, 147, 27, 88, 578, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (196, 191, 21, 69, 533, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (197, 119, 30, 111, 526, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (198, 98, 26, 33, 407, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (199, 116, 16, 25, 562, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (200, 76, 19, 118, 638, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (201, 118, 31, 84, 307, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (202, 116, 16, 25, 446, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (203, 178, 23, 47, 535, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (204, 159, 12, 98, 434, 0)
GO
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (205, 94, 10, 96, 414, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (206, 81, 2, 37, 515, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (207, 171, 30, 49, 238, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (208, 75, 7, 109, 268, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (209, 149, 31, 16, 534, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (210, 190, 21, 118, 277, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (211, 174, 6, 63, 451, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (212, 146, 6, 21, 534, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (213, 75, 15, 46, 533, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (214, 60, 22, 47, 642, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (215, 168, 1, 104, 412, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (216, 124, 25, 104, 254, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (217, 58, 12, 70, 273, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (218, 139, 2, 48, 291, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (219, 168, 25, 52, 261, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (220, 133, 4, 120, 579, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (221, 57, 25, 56, 647, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (222, 57, 26, 97, 536, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (223, 120, 3, 98, 541, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (224, 196, 15, 110, 635, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (225, 161, 19, 36, 531, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (226, 198, 22, 3, 407, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (227, 154, 10, 15, 635, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (228, 138, 24, 75, 372, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (229, 55, 23, 61, 557, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (230, 55, 20, 38, 227, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (231, 124, 6, 91, 573, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (232, 92, 8, 23, 551, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (233, 160, 8, 32, 444, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (234, 168, 24, 79, 520, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (235, 80, 17, 102, 519, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (236, 186, 29, 23, 336, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (237, 185, 4, 3, 393, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (238, 76, 8, 110, 266, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (239, 79, 8, 58, 591, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (240, 146, 14, 109, 401, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (241, 194, 12, 118, 463, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (242, 96, 26, 108, 335, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (243, 168, 3, 118, 483, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (244, 199, 5, 110, 578, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (245, 70, 16, 101, 281, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (246, 182, 8, 16, 543, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (247, 76, 1, 95, 650, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (248, 74, 27, 11, 551, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (249, 111, 8, 92, 397, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (250, 106, 1, 88, 532, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (251, 156, 7, 58, 484, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (252, 173, 8, 55, 228, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (253, 87, 12, 51, 465, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (254, 85, 9, 95, 591, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (255, 157, 5, 90, 281, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (256, 136, 22, 70, 622, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (257, 58, 9, 48, 484, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (258, 108, 4, 81, 589, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (259, 132, 20, 97, 445, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (260, 124, 28, 61, 225, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (261, 155, 21, 19, 557, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (262, 170, 16, 88, 343, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (263, 102, 16, 65, 580, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (264, 150, 31, 64, 596, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (265, 126, 31, 48, 232, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (266, 188, 19, 41, 236, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (267, 137, 31, 109, 269, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (268, 88, 6, 23, 641, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (269, 113, 4, 77, 347, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (270, 55, 23, 71, 598, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (271, 119, 9, 33, 303, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (272, 93, 24, 22, 410, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (273, 55, 25, 83, 466, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (274, 121, 21, 74, 672, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (275, 182, 11, 91, 556, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (276, 149, 12, 64, 440, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (277, 74, 24, 75, 229, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (278, 112, 30, 111, 667, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (279, 81, 19, 85, 606, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (280, 100, 22, 101, 537, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (281, 192, 13, 96, 637, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (282, 154, 15, 94, 376, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (283, 145, 3, 23, 439, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (284, 181, 17, 34, 385, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (285, 190, 2, 91, 417, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (286, 128, 1, 4, 655, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (287, 171, 8, 96, 614, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (288, 88, 23, 32, 470, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (289, 85, 20, 96, 593, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (290, 55, 29, 16, 288, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (291, 142, 4, 23, 408, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (292, 85, 15, 31, 429, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (293, 191, 19, 24, 518, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (294, 78, 6, 100, 301, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (295, 73, 2, 8, 296, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (296, 188, 21, 73, 563, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (297, 114, 22, 62, 344, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (298, 143, 5, 86, 557, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (299, 188, 25, 35, 543, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (300, 184, 26, 16, 602, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (301, 74, 10, 41, 306, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (302, 111, 31, 1, 356, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (303, 188, 27, 50, 398, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (304, 165, 27, 11, 392, 0)
GO
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (305, 135, 29, 5, 649, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (306, 199, 14, 27, 291, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (307, 60, 19, 89, 371, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (308, 95, 13, 80, 409, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (309, 165, 6, 84, 571, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (310, 92, 22, 63, 243, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (311, 102, 5, 116, 607, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (312, 51, 7, 15, 446, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (313, 148, 21, 100, 428, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (314, 166, 12, 17, 446, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (315, 61, 27, 82, 604, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (316, 72, 24, 117, 427, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (317, 91, 24, 53, 524, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (318, 88, 11, 97, 238, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (319, 85, 4, 69, 428, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (320, 105, 10, 36, 536, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (321, 58, 26, 53, 666, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (322, 131, 5, 80, 312, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (323, 99, 12, 91, 354, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (324, 60, 18, 50, 439, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (325, 174, 12, 91, 303, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (326, 184, 2, 73, 380, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (327, 105, 23, 97, 327, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (328, 159, 6, 45, 663, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (329, 76, 29, 22, 528, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (330, 105, 8, 43, 326, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (331, 195, 30, 82, 561, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (332, 161, 30, 69, 450, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (333, 71, 20, 64, 369, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (334, 139, 22, 35, 399, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (335, 56, 24, 22, 505, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (336, 128, 26, 60, 355, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (337, 164, 24, 73, 450, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (338, 195, 10, 6, 402, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (339, 78, 12, 105, 385, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (340, 98, 8, 64, 329, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (341, 86, 5, 107, 643, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (342, 199, 19, 43, 635, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (343, 197, 30, 87, 339, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (344, 133, 25, 98, 311, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (345, 78, 5, 27, 493, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (346, 121, 23, 88, 516, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (347, 89, 26, 59, 323, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (348, 150, 11, 83, 602, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (349, 65, 26, 99, 426, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (350, 119, 26, 64, 400, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (351, 192, 22, 57, 368, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (352, 74, 20, 48, 498, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (353, 192, 16, 61, 644, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (354, 91, 10, 79, 530, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (355, 101, 31, 96, 332, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (356, 172, 27, 88, 332, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (357, 95, 1, 34, 591, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (358, 169, 22, 26, 369, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (359, 126, 24, 65, 336, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (360, 172, 19, 8, 279, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (361, 75, 27, 108, 544, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (362, 106, 29, 11, 607, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (363, 198, 25, 102, 565, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (364, 170, 23, 109, 659, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (365, 83, 22, 11, 224, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (366, 190, 18, 21, 343, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (367, 160, 23, 17, 533, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (368, 113, 14, 40, 271, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (369, 185, 10, 90, 260, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (370, 161, 23, 89, 425, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (371, 84, 13, 53, 531, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (372, 116, 29, 24, 464, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (373, 128, 28, 106, 640, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (374, 165, 8, 44, 261, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (375, 161, 21, 90, 611, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (376, 196, 4, 14, 482, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (377, 176, 27, 77, 347, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (378, 65, 24, 45, 278, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (379, 116, 24, 33, 270, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (380, 99, 11, 14, 277, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (381, 178, 31, 89, 566, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (382, 159, 23, 74, 224, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (383, 168, 30, 54, 319, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (384, 167, 24, 29, 351, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (385, 74, 6, 98, 521, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (386, 179, 4, 112, 537, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (387, 182, 26, 27, 357, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (388, 52, 26, 28, 280, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (389, 151, 15, 103, 608, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (390, 90, 19, 59, 443, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (391, 64, 21, 37, 302, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (392, 169, 27, 86, 263, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (393, 167, 1, 41, 640, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (394, 83, 23, 83, 286, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (395, 83, 28, 11, 526, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (396, 52, 29, 93, 604, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (397, 77, 25, 62, 230, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (398, 121, 6, 118, 496, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (399, 95, 7, 111, 445, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (400, 78, 27, 36, 514, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (401, 97, 18, 72, 420, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (402, 117, 30, 4, 537, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (403, 160, 22, 39, 538, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (404, 102, 12, 98, 246, 0)
GO
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (405, 65, 8, 120, 416, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (406, 179, 25, 50, 372, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (407, 122, 17, 90, 307, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (408, 63, 10, 25, 300, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (409, 114, 17, 104, 587, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (410, 171, 14, 66, 538, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (411, 121, 10, 61, 606, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (412, 82, 30, 47, 377, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (413, 152, 28, 117, 592, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (414, 78, 18, 58, 356, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (415, 53, 30, 5, 230, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (416, 190, 13, 5, 626, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (417, 51, 25, 111, 331, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (418, 147, 22, 66, 637, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (419, 137, 19, 58, 646, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (420, 71, 1, 44, 539, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (421, 180, 16, 112, 543, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (422, 70, 29, 60, 636, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (423, 150, 2, 87, 489, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (424, 128, 21, 93, 356, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (425, 159, 10, 5, 406, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (426, 80, 22, 79, 455, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (427, 172, 27, 99, 464, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (428, 72, 30, 19, 443, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (429, 105, 26, 24, 238, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (430, 132, 3, 87, 474, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (431, 69, 5, 39, 284, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (432, 175, 3, 16, 622, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (433, 197, 31, 34, 269, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (434, 161, 16, 7, 243, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (435, 192, 1, 17, 289, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (436, 95, 27, 120, 536, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (437, 91, 12, 103, 454, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (438, 126, 22, 14, 446, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (439, 180, 19, 36, 449, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (440, 186, 17, 52, 422, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (441, 146, 7, 63, 618, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (442, 116, 15, 18, 604, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (443, 133, 22, 103, 548, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (444, 170, 18, 71, 258, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (445, 96, 27, 106, 599, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (446, 186, 20, 66, 303, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (447, 138, 13, 91, 602, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (448, 57, 2, 88, 469, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (449, 110, 12, 28, 389, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (450, 148, 30, 96, 238, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (451, 142, 10, 17, 578, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (452, 63, 8, 87, 489, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (453, 92, 25, 62, 272, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (454, 71, 5, 53, 577, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (455, 195, 22, 91, 234, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (456, 176, 10, 100, 305, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (457, 112, 13, 32, 276, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (458, 112, 17, 44, 395, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (459, 127, 26, 23, 301, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (460, 101, 31, 91, 532, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (461, 134, 30, 113, 330, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (462, 76, 26, 65, 279, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (463, 99, 19, 111, 531, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (464, 193, 28, 93, 630, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (465, 87, 23, 85, 564, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (466, 57, 1, 105, 366, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (467, 91, 30, 2, 470, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (468, 75, 3, 107, 545, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (469, 91, 7, 45, 512, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (470, 130, 4, 64, 497, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (471, 153, 9, 82, 574, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (472, 186, 27, 56, 272, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (473, 72, 16, 27, 599, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (474, 54, 18, 28, 585, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (475, 194, 5, 68, 655, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (476, 142, 27, 120, 241, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (477, 155, 30, 116, 435, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (478, 146, 1, 112, 637, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (479, 156, 22, 96, 385, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (480, 105, 5, 61, 277, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (481, 75, 5, 95, 290, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (482, 67, 14, 111, 511, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (483, 162, 28, 70, 254, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (484, 181, 7, 9, 283, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (485, 77, 22, 9, 416, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (486, 136, 9, 90, 563, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (487, 77, 11, 25, 443, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (488, 69, 10, 24, 402, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (489, 93, 12, 113, 259, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (490, 170, 3, 81, 509, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (491, 116, 21, 95, 455, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (492, 66, 2, 64, 400, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (493, 89, 14, 104, 670, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (494, 142, 24, 52, 365, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (495, 146, 1, 114, 458, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (496, 99, 13, 106, 238, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (497, 127, 21, 8, 307, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (498, 60, 13, 8, 391, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (499, 181, 6, 113, 321, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (500, 179, 7, 71, 264, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (501, 57, 4, 106, 254, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (502, 71, 7, 93, 332, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (503, 124, 15, 90, 257, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (504, 117, 19, 38, 639, 0)
GO
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (505, 133, 22, 113, 645, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (506, 137, 4, 82, 442, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (507, 136, 30, 88, 356, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (508, 174, 20, 84, 485, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (509, 69, 27, 33, 264, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (510, 159, 8, 92, 469, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (511, 86, 23, 25, 640, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (512, 116, 25, 8, 600, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (513, 157, 31, 95, 605, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (514, 136, 3, 78, 300, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (515, 52, 19, 71, 403, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (516, 190, 13, 84, 269, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (517, 90, 27, 89, 482, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (518, 198, 24, 22, 351, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (519, 167, 28, 8, 434, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (520, 145, 24, 56, 340, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (521, 148, 20, 26, 413, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (522, 188, 2, 95, 573, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (523, 53, 20, 11, 589, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (524, 87, 6, 33, 408, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (525, 126, 12, 101, 488, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (526, 165, 31, 64, 616, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (527, 61, 8, 23, 546, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (528, 90, 7, 62, 286, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (529, 57, 25, 61, 303, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (530, 192, 18, 37, 388, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (531, 137, 20, 72, 389, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (532, 169, 6, 74, 289, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (533, 174, 18, 102, 397, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (534, 158, 13, 72, 651, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (535, 90, 12, 55, 301, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (536, 135, 9, 16, 263, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (537, 148, 16, 36, 537, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (538, 117, 13, 9, 595, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (539, 153, 3, 34, 462, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (540, 192, 9, 80, 322, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (541, 94, 19, 10, 606, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (542, 130, 15, 111, 372, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (543, 124, 20, 48, 306, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (544, 140, 13, 66, 265, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (545, 127, 27, 97, 587, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (546, 156, 20, 37, 312, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (547, 122, 11, 35, 620, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (548, 197, 28, 101, 493, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (549, 169, 27, 47, 635, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (550, 89, 31, 93, 297, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (551, 130, 29, 9, 576, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (552, 185, 3, 42, 641, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (553, 142, 9, 24, 474, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (554, 195, 3, 84, 369, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (555, 185, 29, 28, 488, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (556, 173, 19, 61, 387, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (557, 198, 6, 6, 248, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (558, 165, 1, 105, 351, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (559, 83, 22, 11, 390, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (560, 106, 24, 35, 289, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (561, 168, 3, 103, 269, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (562, 98, 14, 35, 611, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (563, 132, 16, 37, 614, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (564, 57, 11, 54, 533, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (565, 101, 4, 76, 534, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (566, 100, 2, 99, 340, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (567, 108, 20, 11, 245, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (568, 153, 4, 60, 257, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (569, 51, 11, 2, 290, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (570, 168, 25, 106, 431, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (571, 69, 4, 102, 519, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (572, 147, 29, 1, 459, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (573, 67, 6, 42, 636, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (574, 188, 12, 9, 223, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (575, 193, 8, 95, 401, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (576, 97, 11, 113, 545, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (577, 178, 2, 20, 222, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (578, 160, 6, 40, 274, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (579, 121, 7, 73, 655, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (580, 121, 31, 73, 262, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (581, 69, 26, 101, 305, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (582, 83, 27, 33, 456, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (583, 109, 12, 1, 497, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (584, 71, 29, 68, 409, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (585, 101, 3, 92, 506, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (586, 160, 12, 39, 289, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (587, 188, 7, 59, 469, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (588, 50, 15, 119, 246, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (589, 90, 13, 25, 543, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (590, 188, 25, 78, 577, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (591, 73, 20, 87, 648, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (592, 157, 11, 10, 599, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (593, 132, 10, 49, 460, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (594, 65, 30, 56, 600, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (595, 110, 26, 11, 254, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (596, 163, 18, 44, 589, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (597, 137, 17, 56, 366, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (598, 182, 30, 68, 311, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (599, 64, 1, 73, 267, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (600, 175, 24, 107, 601, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (601, 191, 31, 81, 356, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (602, 123, 15, 57, 515, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (603, 169, 2, 10, 562, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (604, 93, 10, 106, 533, 0)
GO
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (605, 86, 20, 69, 219, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (606, 152, 19, 53, 313, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (607, 193, 24, 18, 322, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (608, 137, 9, 33, 365, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (609, 198, 16, 117, 567, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (610, 80, 12, 79, 274, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (611, 118, 24, 53, 275, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (612, 170, 17, 61, 431, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (613, 69, 31, 108, 306, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (614, 80, 5, 76, 584, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (615, 86, 26, 37, 644, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (616, 192, 6, 109, 277, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (617, 178, 5, 26, 302, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (618, 186, 17, 30, 400, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (619, 60, 7, 33, 655, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (620, 110, 30, 93, 241, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (621, 129, 29, 2, 392, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (622, 94, 22, 39, 367, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (623, 62, 24, 114, 443, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (624, 67, 21, 36, 341, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (625, 192, 1, 29, 478, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (626, 134, 27, 38, 538, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (627, 170, 28, 72, 606, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (628, 100, 13, 71, 627, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (629, 72, 29, 55, 297, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (630, 148, 7, 75, 297, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (631, 72, 12, 71, 396, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (632, 184, 29, 30, 312, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (633, 74, 19, 51, 432, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (634, 129, 30, 100, 300, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (635, 196, 24, 7, 468, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (636, 75, 21, 90, 309, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (637, 111, 1, 114, 310, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (638, 51, 6, 21, 308, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (639, 54, 6, 75, 631, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (640, 151, 15, 34, 525, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (641, 152, 31, 34, 612, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (642, 104, 5, 8, 663, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (643, 184, 4, 14, 492, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (644, 152, 8, 115, 355, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (645, 134, 30, 14, 358, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (646, 67, 9, 76, 547, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (647, 179, 12, 81, 391, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (648, 140, 1, 26, 448, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (649, 76, 27, 93, 599, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (650, 119, 25, 65, 239, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (651, 88, 17, 117, 355, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (652, 175, 14, 49, 331, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (653, 92, 15, 3, 479, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (654, 108, 13, 102, 372, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (655, 51, 5, 104, 443, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (656, 178, 9, 9, 244, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (657, 157, 14, 73, 503, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (658, 126, 3, 108, 601, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (659, 135, 9, 76, 540, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (660, 158, 30, 54, 337, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (661, 179, 14, 2, 234, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (662, 132, 4, 62, 658, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (663, 74, 31, 87, 451, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (664, 187, 12, 44, 463, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (665, 105, 24, 21, 483, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (666, 99, 16, 39, 379, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (667, 135, 22, 87, 644, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (668, 126, 28, 44, 650, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (669, 104, 28, 98, 593, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (670, 69, 18, 20, 419, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (671, 102, 26, 26, 284, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (672, 124, 12, 94, 635, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (673, 121, 4, 6, 597, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (674, 103, 6, 57, 653, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (675, 78, 9, 49, 613, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (676, 176, 3, 94, 453, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (677, 53, 22, 4, 624, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (678, 160, 13, 113, 370, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (679, 190, 17, 48, 328, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (680, 167, 15, 93, 466, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (681, 118, 7, 54, 265, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (682, 118, 21, 30, 638, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (683, 187, 3, 79, 445, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (684, 114, 14, 29, 240, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (685, 94, 20, 91, 526, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (686, 61, 5, 76, 414, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (687, 136, 26, 65, 275, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (688, 58, 9, 80, 521, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (689, 115, 4, 101, 257, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (690, 157, 3, 64, 655, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (691, 196, 24, 117, 289, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (692, 139, 26, 11, 516, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (693, 106, 3, 26, 442, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (694, 114, 13, 115, 600, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (695, 107, 4, 112, 528, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (696, 71, 15, 115, 595, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (697, 180, 19, 6, 279, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (698, 169, 13, 12, 351, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (699, 184, 1, 87, 277, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (700, 60, 10, 38, 465, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (701, 140, 12, 117, 225, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (702, 169, 15, 24, 604, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (703, 65, 23, 27, 641, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (704, 157, 17, 87, 421, 0)
GO
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (705, 154, 12, 55, 606, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (706, 162, 24, 1, 395, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (707, 103, 13, 79, 323, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (708, 164, 22, 67, 219, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (709, 150, 14, 62, 371, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (710, 176, 26, 100, 649, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (711, 149, 11, 44, 556, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (712, 193, 31, 110, 350, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (713, 180, 9, 58, 487, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (714, 194, 5, 28, 656, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (715, 182, 16, 38, 672, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (716, 103, 6, 59, 354, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (717, 110, 7, 21, 248, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (718, 162, 18, 40, 311, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (719, 105, 22, 115, 657, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (720, 109, 1, 43, 636, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (721, 62, 22, 101, 656, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (722, 176, 3, 72, 646, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (723, 128, 2, 45, 562, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (724, 140, 29, 4, 343, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (725, 146, 22, 102, 384, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (726, 91, 7, 10, 497, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (727, 57, 19, 5, 267, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (728, 52, 10, 37, 279, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (729, 86, 13, 25, 605, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (730, 64, 11, 14, 615, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (731, 82, 31, 22, 258, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (732, 123, 21, 42, 647, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (733, 62, 6, 30, 586, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (734, 161, 28, 34, 480, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (735, 74, 28, 118, 243, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (736, 60, 26, 5, 506, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (737, 189, 1, 85, 290, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (738, 171, 27, 75, 403, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (739, 128, 25, 114, 382, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (740, 161, 10, 51, 656, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (741, 137, 23, 109, 285, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (742, 175, 8, 102, 332, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (743, 155, 19, 83, 220, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (744, 92, 22, 60, 466, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (745, 116, 27, 57, 489, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (746, 118, 1, 86, 672, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (747, 73, 13, 18, 559, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (748, 187, 11, 81, 285, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (749, 76, 27, 16, 633, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (750, 170, 5, 34, 412, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (751, 96, 11, 69, 606, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (752, 149, 4, 43, 581, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (753, 59, 30, 91, 598, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (754, 107, 3, 88, 601, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (755, 78, 21, 31, 560, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (756, 152, 26, 107, 378, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (757, 72, 17, 112, 241, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (758, 163, 14, 42, 263, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (759, 107, 7, 67, 449, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (760, 107, 6, 48, 329, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (761, 158, 28, 116, 240, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (762, 193, 16, 104, 277, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (763, 74, 21, 1, 533, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (764, 52, 8, 106, 304, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (765, 190, 30, 40, 546, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (766, 122, 13, 80, 488, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (767, 79, 25, 70, 669, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (768, 184, 23, 93, 478, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (769, 147, 22, 17, 238, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (770, 90, 29, 118, 629, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (771, 107, 4, 64, 236, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (772, 84, 15, 6, 436, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (773, 173, 20, 51, 541, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (774, 63, 1, 115, 645, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (775, 116, 18, 111, 530, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (776, 152, 12, 71, 494, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (777, 178, 1, 49, 509, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (778, 92, 1, 24, 637, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (779, 119, 1, 119, 384, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (780, 54, 27, 70, 621, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (781, 198, 26, 111, 235, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (782, 123, 19, 58, 400, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (783, 68, 5, 22, 472, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (784, 95, 23, 81, 603, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (785, 54, 28, 120, 448, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (786, 102, 3, 119, 567, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (787, 89, 8, 120, 562, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (788, 173, 11, 120, 308, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (789, 184, 12, 36, 310, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (790, 167, 28, 47, 456, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (791, 125, 15, 93, 265, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (792, 160, 8, 83, 300, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (793, 144, 7, 109, 349, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (794, 54, 4, 26, 544, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (795, 145, 4, 114, 319, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (796, 90, 4, 10, 507, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (797, 184, 30, 101, 350, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (798, 118, 11, 83, 355, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (799, 195, 9, 41, 253, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (800, 165, 11, 47, 497, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (801, 153, 24, 25, 649, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (802, 81, 25, 100, 651, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (803, 104, 21, 22, 496, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (804, 69, 24, 79, 495, 0)
GO
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (805, 169, 26, 40, 627, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (806, 50, 25, 67, 552, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (807, 142, 15, 50, 244, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (808, 134, 8, 48, 330, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (809, 151, 29, 101, 430, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (810, 138, 23, 56, 545, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (811, 142, 11, 8, 301, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (812, 93, 9, 2, 325, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (813, 176, 29, 114, 666, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (814, 198, 23, 58, 233, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (815, 56, 13, 46, 310, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (816, 75, 26, 49, 480, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (817, 145, 30, 18, 576, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (818, 119, 30, 9, 656, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (819, 120, 27, 105, 506, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (820, 80, 1, 42, 365, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (821, 87, 14, 94, 419, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (822, 105, 11, 18, 242, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (823, 75, 16, 2, 317, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (824, 149, 10, 9, 637, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (825, 98, 25, 116, 399, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (826, 168, 16, 61, 662, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (827, 62, 2, 98, 319, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (828, 123, 19, 23, 292, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (829, 77, 5, 22, 405, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (830, 173, 23, 11, 512, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (831, 197, 14, 75, 391, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (832, 76, 7, 42, 332, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (833, 53, 4, 102, 433, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (834, 199, 1, 40, 296, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (835, 88, 1, 92, 594, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (836, 174, 20, 92, 234, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (837, 177, 22, 15, 521, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (838, 147, 29, 35, 532, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (839, 136, 29, 76, 627, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (840, 91, 25, 62, 439, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (841, 72, 5, 58, 469, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (842, 197, 10, 36, 664, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (843, 88, 26, 117, 330, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (844, 54, 28, 54, 270, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (845, 58, 27, 116, 307, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (846, 63, 17, 21, 654, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (847, 110, 23, 23, 310, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (848, 61, 12, 8, 398, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (849, 98, 5, 81, 369, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (850, 97, 19, 5, 245, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (851, 118, 8, 1, 350, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (852, 112, 21, 107, 460, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (853, 87, 10, 23, 452, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (854, 183, 16, 117, 327, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (855, 58, 9, 102, 358, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (856, 100, 22, 69, 522, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (857, 101, 24, 28, 471, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (858, 113, 17, 66, 496, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (859, 148, 5, 54, 494, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (860, 72, 29, 9, 270, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (861, 58, 8, 87, 367, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (862, 199, 3, 84, 498, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (863, 130, 22, 83, 319, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (864, 119, 27, 64, 299, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (865, 169, 1, 39, 585, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (866, 198, 2, 57, 396, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (867, 100, 21, 108, 264, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (868, 130, 1, 3, 571, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (869, 175, 25, 24, 530, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (870, 73, 12, 59, 643, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (871, 129, 2, 55, 600, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (872, 93, 23, 48, 329, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (873, 107, 28, 76, 327, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (874, 72, 23, 55, 317, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (875, 181, 15, 54, 242, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (876, 128, 6, 117, 612, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (877, 149, 26, 104, 243, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (878, 193, 3, 31, 482, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (879, 98, 13, 77, 484, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (880, 92, 21, 50, 254, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (881, 171, 31, 72, 409, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (882, 152, 30, 57, 477, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (883, 62, 28, 74, 271, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (884, 96, 31, 87, 439, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (885, 97, 4, 103, 573, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (886, 115, 5, 38, 349, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (887, 163, 18, 57, 631, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (888, 77, 19, 13, 284, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (889, 177, 13, 74, 219, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (890, 194, 25, 78, 227, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (891, 105, 6, 54, 355, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (892, 144, 26, 120, 647, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (893, 77, 14, 111, 225, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (894, 76, 21, 87, 381, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (895, 56, 4, 77, 449, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (896, 120, 20, 52, 622, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (897, 55, 22, 120, 471, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (898, 102, 9, 23, 410, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (899, 73, 13, 13, 344, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (900, 99, 7, 117, 279, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (901, 174, 18, 16, 577, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (902, 52, 10, 48, 401, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (903, 111, 15, 52, 622, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (904, 190, 13, 47, 478, 0)
GO
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (905, 72, 15, 65, 472, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (906, 123, 7, 78, 657, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (907, 64, 19, 107, 472, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (908, 110, 6, 84, 220, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (909, 133, 9, 74, 433, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (910, 186, 22, 115, 499, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (911, 132, 1, 89, 346, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (912, 79, 30, 14, 608, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (913, 53, 27, 57, 661, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (914, 98, 12, 36, 378, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (915, 127, 26, 34, 574, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (916, 106, 14, 101, 221, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (917, 98, 22, 21, 621, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (918, 104, 12, 110, 311, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (919, 149, 1, 79, 619, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (920, 102, 27, 119, 614, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (921, 67, 24, 109, 453, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (922, 193, 19, 66, 436, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (923, 166, 22, 82, 286, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (924, 133, 10, 70, 382, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (925, 67, 16, 90, 460, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (926, 163, 14, 22, 568, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (927, 156, 18, 43, 617, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (928, 82, 1, 46, 523, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (929, 79, 8, 103, 416, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (930, 163, 23, 4, 405, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (931, 56, 29, 15, 231, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (932, 78, 9, 52, 512, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (933, 96, 19, 41, 489, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (934, 170, 17, 86, 306, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (935, 159, 12, 47, 665, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (936, 168, 7, 50, 385, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (937, 154, 11, 77, 272, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (938, 166, 30, 63, 436, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (939, 58, 27, 30, 543, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (940, 89, 15, 114, 489, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (941, 120, 15, 4, 341, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (942, 83, 10, 42, 289, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (943, 194, 9, 79, 583, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (944, 151, 2, 6, 257, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (945, 59, 30, 39, 298, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (946, 185, 7, 29, 626, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (947, 171, 7, 85, 544, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (948, 50, 31, 36, 459, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (949, 92, 23, 54, 317, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (950, 101, 8, 64, 658, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (951, 166, 20, 112, 287, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (952, 179, 28, 61, 562, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (953, 178, 21, 82, 448, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (954, 77, 17, 55, 231, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (955, 130, 17, 58, 488, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (956, 71, 22, 8, 323, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (957, 137, 15, 19, 587, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (958, 105, 11, 43, 508, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (959, 153, 1, 99, 513, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (960, 148, 16, 75, 361, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (961, 112, 28, 59, 422, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (962, 146, 26, 47, 284, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (963, 85, 5, 53, 388, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (964, 184, 28, 67, 271, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (965, 121, 31, 29, 638, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (966, 129, 28, 73, 438, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (967, 94, 16, 35, 624, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (968, 58, 5, 46, 509, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (969, 88, 8, 55, 666, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (970, 97, 16, 73, 650, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (971, 93, 21, 67, 285, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (972, 109, 10, 19, 625, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (973, 80, 30, 36, 375, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (974, 52, 28, 98, 413, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (975, 177, 9, 119, 399, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (976, 87, 4, 28, 419, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (977, 72, 27, 80, 300, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (978, 71, 13, 66, 634, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (979, 141, 18, 17, 274, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (980, 89, 9, 112, 509, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (981, 107, 21, 65, 548, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (982, 111, 18, 87, 363, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (983, 63, 27, 24, 318, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (984, 67, 23, 88, 291, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (985, 66, 9, 46, 564, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (986, 57, 23, 110, 459, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (987, 123, 8, 100, 437, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (988, 163, 12, 98, 437, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (989, 110, 8, 95, 481, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (990, 67, 28, 49, 282, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (991, 147, 20, 64, 615, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (992, 135, 4, 6, 566, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (993, 90, 23, 59, 479, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (994, 110, 28, 113, 619, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (995, 90, 27, 80, 492, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (996, 53, 24, 116, 424, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (997, 166, 11, 82, 332, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (998, 134, 6, 82, 368, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (999, 92, 6, 103, 450, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (1000, 189, 9, 78, 506, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (1001, 101, 22, 112, 251, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (1002, 78, 15, 38, 278, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (1003, 94, 31, 85, 575, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (1004, 87, 12, 34, 268, 0)
GO
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (1005, 154, 10, 102, 556, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (1006, 189, 14, 117, 487, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (1007, 99, 24, 24, 637, 0)
INSERT [dbo].[DetalleFacturas] ([idDetalleFacturas], [precio], [idFactura], [idAsiento], [idReproduccion], [idPromocion]) VALUES (1008, 163, 19, 81, 528, 0)
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
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (7, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (8, CAST(N'2024-01-12T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (9, CAST(N'2024-01-19T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (10, CAST(N'2024-01-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (11, CAST(N'2024-02-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (12, CAST(N'2024-02-09T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (13, CAST(N'2024-02-16T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (14, CAST(N'2024-02-23T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (15, CAST(N'2024-03-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (16, CAST(N'2024-03-08T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (17, CAST(N'2024-03-15T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (18, CAST(N'2024-03-22T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (19, CAST(N'2024-03-29T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (20, CAST(N'2024-01-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (21, CAST(N'2024-01-15T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (22, CAST(N'2024-01-20T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (23, CAST(N'2024-01-25T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (24, CAST(N'2024-02-01T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (25, CAST(N'2024-02-06T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (26, CAST(N'2024-02-11T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (27, CAST(N'2024-02-16T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (28, CAST(N'2024-02-21T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (29, CAST(N'2024-02-26T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (30, CAST(N'2024-03-03T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Facturas] ([idFactura], [fecha], [idCliente]) VALUES (31, CAST(N'2024-03-08T00:00:00.000' AS DateTime), 13)
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
/****** Object:  StoredProcedure [dbo].[Consulta1]    Script Date: 14/11/2024 11:17:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Consulta1] @fechaInicio date, @fechaFin date
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
order by ingresosTotales desc
end
GO
/****** Object:  StoredProcedure [dbo].[consulta2]    Script Date: 14/11/2024 11:17:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[consulta2]
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
order by 7 desc
end
GO
/****** Object:  StoredProcedure [dbo].[consulta3]    Script Date: 14/11/2024 11:17:58 ******/
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
/****** Object:  StoredProcedure [dbo].[Consulta4]    Script Date: 14/11/2024 11:17:58 ******/
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
/****** Object:  StoredProcedure [dbo].[Consulta5]    Script Date: 14/11/2024 11:17:58 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_ObtenerTotalVentas]    Script Date: 14/11/2024 11:17:58 ******/
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
