USE [master]
GO
/****** Object:  Database [backdesk]    Script Date: 13/6/2024 01:18:43 ******/
CREATE DATABASE [backdesk]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'backdesk', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\backdesk.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'backdesk_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\backdesk_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [backdesk] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [backdesk].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [backdesk] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [backdesk] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [backdesk] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [backdesk] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [backdesk] SET ARITHABORT OFF 
GO
ALTER DATABASE [backdesk] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [backdesk] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [backdesk] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [backdesk] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [backdesk] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [backdesk] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [backdesk] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [backdesk] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [backdesk] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [backdesk] SET  ENABLE_BROKER 
GO
ALTER DATABASE [backdesk] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [backdesk] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [backdesk] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [backdesk] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [backdesk] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [backdesk] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [backdesk] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [backdesk] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [backdesk] SET  MULTI_USER 
GO
ALTER DATABASE [backdesk] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [backdesk] SET DB_CHAINING OFF 
GO
ALTER DATABASE [backdesk] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [backdesk] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [backdesk] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [backdesk] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [backdesk] SET QUERY_STORE = ON
GO
ALTER DATABASE [backdesk] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [backdesk]
GO
/****** Object:  Table [dbo].[actividades]    Script Date: 13/6/2024 01:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[actividades](
	[id_actividad] [int] NOT NULL,
	[descripcion] [varchar](100) NULL,
	[nivel_dificultad] [int] NULL,
 CONSTRAINT [PK_actividades] PRIMARY KEY CLUSTERED 
(
	[id_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cargos]    Script Date: 13/6/2024 01:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cargos](
	[id_habitacion] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[importe] [money] NOT NULL,
 CONSTRAINT [PK_cargos] PRIMARY KEY CLUSTERED 
(
	[id_habitacion] ASC,
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleados]    Script Date: 13/6/2024 01:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleados](
	[id_empleado] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[cuil] [char](11) NOT NULL,
	[nombre_establecimiento] [varchar](100) NOT NULL,
 CONSTRAINT [PK_empleado] PRIMARY KEY CLUSTERED 
(
	[id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Establecimiento]    Script Date: 13/6/2024 01:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Establecimiento](
	[nombre_establecimiento] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[telefono] [char](10) NOT NULL,
	[contacto] [int] NULL,
 CONSTRAINT [PK_Establecimientos] PRIMARY KEY CLUSTERED 
(
	[nombre_establecimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[establecimiento_habitacion]    Script Date: 13/6/2024 01:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[establecimiento_habitacion](
	[id_habitacion] [int] NOT NULL,
	[nombre_establecimiento] [varchar](100) NOT NULL,
	[id_tipo_habitacion] [int] NOT NULL,
	[nro_habitacion] [char](3) NOT NULL,
	[tarifa] [int] NOT NULL,
	[banio] [char](1) NOT NULL,
 CONSTRAINT [PK_establecimiento_habitacion] PRIMARY KEY CLUSTERED 
(
	[id_habitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pasajero_actividad]    Script Date: 13/6/2024 01:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pasajero_actividad](
	[id_pax] [int] NOT NULL,
	[id_actividad] [int] NOT NULL,
 CONSTRAINT [PK_paxactividad] PRIMARY KEY CLUSTERED 
(
	[id_pax] ASC,
	[id_actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pasajeros]    Script Date: 13/6/2024 01:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pasajeros](
	[id_pax] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[dni] [char](8) NOT NULL,
 CONSTRAINT [PK_pax] PRIMARY KEY CLUSTERED 
(
	[id_pax] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pax_habitacion]    Script Date: 13/6/2024 01:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pax_habitacion](
	[id_habitacion] [int] NOT NULL,
	[id_pax] [int] NOT NULL,
 CONSTRAINT [PK_paxhabi] PRIMARY KEY CLUSTERED 
(
	[id_pax] ASC,
	[id_habitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_habitacion]    Script Date: 13/6/2024 01:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_habitacion](
	[id_tipo_habitacion] [int] NOT NULL,
	[descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_tipo_habitacion] PRIMARY KEY CLUSTERED 
(
	[id_tipo_habitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (1, N'Cabalgata 1/2 dia', 1)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (2, N'Cabalgata dia entero', 3)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (3, N'Avistaje de aves', 1)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (4, N'Trekking', 1)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (5, N'Trekking', 3)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (6, N'Rafting', 5)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (7, N'Rafting', 7)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (8, N'Rafting', 10)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (9, N'Ciclismo', 1)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (10, N'Ciclismo', 2)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (11, N'Kayak', 3)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (12, N'Escalada y Rappell', 3)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (13, N'Escalada y Rappell', 5)
INSERT [dbo].[actividades] ([id_actividad], [descripcion], [nivel_dificultad]) VALUES (14, N'Escalada y Rappell', 9)
GO
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (1, N'Roberto Lagos', N'ruta prov. 205 km 323', N'20187569543', N'El Bostezo')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (2, N'Alicia Suarez', N'ruta prov. 205 km 323', N'20137569543', N'El Bostezo')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (3, N'Juan Fierro', N'ruta prov. 205 km 323', N'20137349543', N'El Bostezo')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (4, N'Rogel Kupti', N'ruta prov. 205 km 323', N'20167666543', N'El Bostezo')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (5, N'Alejandra Gomez', N'ruta prov. 205 km 323', N'20124569543', N'El Bostezo')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (6, N'Carlos Moreno', N'ruta prov. 205 km 323', N'21333569543', N'El Bostezo')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (7, N'Carmen Castro', N'ruta prov 101 km 53', N'30187569543', N'Nido del Condor')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (8, N'Amanda Caspio', N'ruta prov 101 km 53', N'30157569543', N'Nido del Condor')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (9, N'Victoria Mandel', N'ruta prov 101 km 53', N'22157999543', N'Nido del Condor')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (10, N'Esteban Klati', N'ruta prov 101 km 53', N'20197569543', N'Nido del Condor')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (11, N'Alejandro Silvestre', N'ruta prov 101 km 53', N'21227569543', N'Nido del Condor')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (12, N'Carola Peterson', N'ruta prov 101 km 53', N'21217569543', N'Nido del Condor')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (13, N'Gala Peter', N'ruta nac. 40 km 40', N'21456549543', N'Arauco Hue')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (14, N'Olga Ramirez', N'ruta nac. 40 km 40', N'21217568653', N'Arauco Hue')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (15, N'Ricardo Rojas', N'ruta nac. 40 km 40', N'21785569543', N'Arauco Hue')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (16, N'Armando Gastaldi', N'ruta nac. 40 km 40', N'21623569543', N'Arauco Hue')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (17, N'Viviana Reyna', N'ruta nac. 40 km 40', N'21217569547', N'Arauco Hue')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (18, N'Leonidas Pascual', N'ruta nac. 40 km 40', N'30117569543', N'Arauco Hue')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (19, N'Marcela Rivada', N'ruta nac. 40 km 40', N'21217123543', N'Arauco Hue')
INSERT [dbo].[empleados] ([id_empleado], [nombre], [direccion], [cuil], [nombre_establecimiento]) VALUES (20, N'Augusto Mondia', N'ruta nac. 40 km 40', N'21456569543', N'Arauco Hue')
GO
INSERT [dbo].[Establecimiento] ([nombre_establecimiento], [direccion], [telefono], [contacto]) VALUES (N'Arauco Hue', N'ruta nac. 40 km 40', N'0224999545', 17)
INSERT [dbo].[Establecimiento] ([nombre_establecimiento], [direccion], [telefono], [contacto]) VALUES (N'El Bostezo', N'ruta prov. 205 km 323', N'0224982345', 2)
INSERT [dbo].[Establecimiento] ([nombre_establecimiento], [direccion], [telefono], [contacto]) VALUES (N'El Desafio', N'ruta nac. 40 km 540', N'0224965324', NULL)
INSERT [dbo].[Establecimiento] ([nombre_establecimiento], [direccion], [telefono], [contacto]) VALUES (N'Las Grutas', N'ruta nac. 22 km 323', N'0224987548', NULL)
INSERT [dbo].[Establecimiento] ([nombre_establecimiento], [direccion], [telefono], [contacto]) VALUES (N'Nido del Condor', N'ruta nac. 22 km 23', N'0224989856', 10)
INSERT [dbo].[Establecimiento] ([nombre_establecimiento], [direccion], [telefono], [contacto]) VALUES (N'Pire Pal', N'ruta nac. 22 km 214', N'0224980345', NULL)
INSERT [dbo].[Establecimiento] ([nombre_establecimiento], [direccion], [telefono], [contacto]) VALUES (N'Rincon del Lago', N'ruta prov. 101 km 53', N'0224982124', NULL)
GO
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (1, N'Pire Pal', 1, N'101', 115, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (2, N'Pire Pal', 2, N'102', 145, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (3, N'Pire Pal', 2, N'103', 145, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (4, N'Pire Pal', 1, N'201', 115, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (5, N'Pire Pal', 2, N'202', 145, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (6, N'Nido del Condor', 1, N'101', 135, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (7, N'Nido del Condor', 2, N'102', 185, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (8, N'Nido del Condor', 2, N'201', 185, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (9, N'Nido del Condor', 2, N'202', 115, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (10, N'Nido del Condor', 6, N'301', 345, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (11, N'El Bostezo', 1, N'101', 115, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (12, N'El Bostezo', 2, N'102', 130, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (13, N'El Bostezo', 2, N'103', 130, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (14, N'El Bostezo', 3, N'104', 105, N'N')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (15, N'El Bostezo', 1, N'201', 115, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (16, N'El Bostezo', 2, N'202', 130, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (17, N'El Bostezo', 2, N'203', 130, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (18, N'El Bostezo', 3, N'204', 105, N'N')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (19, N'El Bostezo', 4, N'301', 215, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (20, N'El Bostezo', 5, N'302', 215, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (21, N'Arauco Hue', 1, N'101', 100, N'N')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (22, N'Arauco Hue', 2, N'102', 140, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (23, N'Arauco Hue', 2, N'103', 140, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (24, N'Arauco Hue', 1, N'201', 100, N'N')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (25, N'Arauco Hue', 2, N'202', 140, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (26, N'Arauco Hue', 2, N'203', 140, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (27, N'Arauco Hue', 4, N'301', 255, N'S')
INSERT [dbo].[establecimiento_habitacion] ([id_habitacion], [nombre_establecimiento], [id_tipo_habitacion], [nro_habitacion], [tarifa], [banio]) VALUES (28, N'Arauco Hue', 5, N'302', 255, N'S')
GO
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (1, 1)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (2, 3)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (3, 4)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (4, 6)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (5, 6)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (6, 6)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (7, 3)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (8, 14)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (9, 14)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (10, 10)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (11, 10)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (12, 10)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (18, 10)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (19, 11)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (20, 11)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (21, 7)
INSERT [dbo].[pasajero_actividad] ([id_pax], [id_actividad]) VALUES (22, 6)
GO
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (1, N'Aguirre,Victor Daniel', N'20125487')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (2, N'Alonso,Veronica Adriana', N'18569874')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (3, N'Amado,Sergio Horacio', N'32456897')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (4, N'Araguna,Santiago', N'25789410')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (5, N'Asis,Ruben Francisco', N'15646987')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (6, N'Aspres,Rodolfo', N'20481487')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (7, N'Bagnarelli,Ricardo Marcelo', N'18925874')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (8, N'Basalo,Patricia Mabel', N'32812897')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (9, N'Benvenuti,Osvaldo Raul', N'26145410')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (10, N'Blanc,Oscar Alejandro', N'16002987')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (11, N'Boroni,Orlando', N'20837487')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (12, N'Cebeiro,Norma Beatriz Liliana', N'19281874')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (13, N'Cladera,Nestor Gustavo', N'33168897')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (14, N'Degiusti,Nestor Daniel', N'26501410')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (15, N'Derrer,Monica Adriana', N'16358987')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (16, N'Di Battista,Miguel Angel', N'21193487')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (17, N'Dicianna,Martin Marcelo Adrian', N'19637874')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (18, N'Enriquez Macias,Marta Noemi', N'33524897')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (19, N'Ferrer,Marta Noemi', N'26857410')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (20, N'Fliess,Maria Victoria', N'16714987')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (21, N'Fohs,Maria Ines', N'21549487')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (22, N'Ghidoli,Maria Gabriela', N'19993874')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (23, N'Grasso,Mara Eugenia', N'33880897')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (24, N'Jabif,Maria De Los Milagros', N'27213410')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (25, N'Lucero,Marcos Andres', N'17070987')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (26, N'Mazzucchelli,Marcela Alejandra', N'21905487')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (27, N'Monroy,Liliana', N'20349874')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (28, N'Montiel Nucci,Juan Pablo', N'34236897')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (29, N'Navarro,Joaquin', N'27569410')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (30, N'Peon,Ines Raquel', N'17426987')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (31, N'Prez Teruel,Gustavo Adolfo Enrique', N'22261487')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (32, N'Radvanski,Grettel Eugenia Del Valle', N'20705874')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (33, N'Ramirez,Flavia', N'34592897')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (34, N'Ramos,Fatima', N'27925410')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (35, N'Rizo Avellaneda,Ester Elena', N'17782987')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (36, N'Ruiz Diaz,Elizabeth Nancy', N'22617487')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (37, N'Saladino,Daniel Rodolfo', N'21061874')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (38, N'Sanchez,Daniel Marcelino', N'34948897')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (39, N'Soro,Aida Mabel', N'28281410')
INSERT [dbo].[pasajeros] ([id_pax], [nombre], [dni]) VALUES (40, N'Villares,Adrian Edgardo', N'18138987')
GO
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (1, 1)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (1, 2)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (2, 3)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (2, 4)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (3, 5)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (3, 6)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (3, 7)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (6, 8)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (6, 9)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (7, 10)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (7, 11)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (8, 12)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (12, 13)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (12, 14)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (14, 15)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (15, 16)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (15, 17)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (15, 18)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (17, 19)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (21, 24)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (21, 25)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (23, 26)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (23, 27)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (23, 28)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (24, 29)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (25, 30)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (25, 31)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (27, 32)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (27, 33)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (28, 34)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (11, 35)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (11, 36)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (11, 37)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (5, 38)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (5, 39)
INSERT [dbo].[pax_habitacion] ([id_habitacion], [id_pax]) VALUES (13, 40)
GO
INSERT [dbo].[tipo_habitacion] ([id_tipo_habitacion], [descripcion]) VALUES (1, N'Single')
INSERT [dbo].[tipo_habitacion] ([id_tipo_habitacion], [descripcion]) VALUES (2, N'Doble')
INSERT [dbo].[tipo_habitacion] ([id_tipo_habitacion], [descripcion]) VALUES (3, N'Triple')
INSERT [dbo].[tipo_habitacion] ([id_tipo_habitacion], [descripcion]) VALUES (4, N'Suite')
INSERT [dbo].[tipo_habitacion] ([id_tipo_habitacion], [descripcion]) VALUES (5, N'Suite Junior')
INSERT [dbo].[tipo_habitacion] ([id_tipo_habitacion], [descripcion]) VALUES (6, N'Suite Superior')
GO
/****** Object:  StoredProcedure [dbo].[mostrar_actividad]    Script Date: 13/6/2024 01:18:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[mostrar_actividad](@descripcion varchar(50)=null )
as
declare

@id_actividad int,
@id_dos_actividad int,
@nombre_e varchar(50),
@nombre_p varchar(50)

begin

	if(@descripcion is null)
		begin
			 declare act cursor for
			 select distinct pa.id_actividad, a.descripcion
			 from actividades a, pasajero_actividad pa
			 where a.id_actividad = pa.id_actividad 
		end
			else
				begin
						 declare act cursor for
						 select distinct pa.id_actividad, a.descripcion
						 from actividades a, pasajero_actividad pa
						 where a.id_actividad = pa.id_actividad 	
						 and a.descripcion = @descripcion
				end

		open act
		fetch next from act into @id_actividad, @descripcion

		while(@@FETCH_STATUS =0)
			begin
					print('  '  + @descripcion)
					declare dos cursor for
					select pa.id_actividad, p.nombre, eh.nombre_establecimiento
					from establecimiento_habitacion eh, pasajeros p, pasajero_actividad pa, pax_habitacion ph
					where eh.id_habitacion = ph.id_habitacion
					and ph.id_pax = pa.id_pax
					and pa.id_pax = p.id_pax
					and pa.id_actividad = @id_actividad 

					open dos
					fetch next from dos into @id_dos_actividad, @nombre_p, @nombre_e

					while (@@FETCH_STATUS =0)
						begin
								print('           ' + @nombre_p + ' - ' + @nombre_e)
								fetch next from dos into @id_dos_actividad, @nombre_p, @nombre_e

						end

						close dos
						deallocate dos
					
				fetch next from act into @id_actividad, @descripcion

			end

			close act
			deallocate act

end
GO
USE [master]
GO
ALTER DATABASE [backdesk] SET  READ_WRITE 
GO
