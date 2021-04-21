USE [master]
GO
/****** Object:  Database [guarderia]    Script Date: 31/03/2021 11:34:11 p. m. ******/
CREATE DATABASE [guarderia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'guarderia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\guarderia.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'guarderia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\guarderia_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [guarderia] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [guarderia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [guarderia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [guarderia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [guarderia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [guarderia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [guarderia] SET ARITHABORT OFF 
GO
ALTER DATABASE [guarderia] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [guarderia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [guarderia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [guarderia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [guarderia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [guarderia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [guarderia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [guarderia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [guarderia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [guarderia] SET  ENABLE_BROKER 
GO
ALTER DATABASE [guarderia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [guarderia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [guarderia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [guarderia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [guarderia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [guarderia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [guarderia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [guarderia] SET RECOVERY FULL 
GO
ALTER DATABASE [guarderia] SET  MULTI_USER 
GO
ALTER DATABASE [guarderia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [guarderia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [guarderia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [guarderia] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [guarderia] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [guarderia] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'guarderia', N'ON'
GO
ALTER DATABASE [guarderia] SET QUERY_STORE = OFF
GO
USE [guarderia]
GO
/****** Object:  Table [dbo].[cuota_mensual]    Script Date: 31/03/2021 11:34:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cuota_mensual](
	[id_mensualidad] [varchar](10) NOT NULL,
	[valor_mensualidad] [float] NOT NULL,
	[costo_comida] [float] NOT NULL,
	[pagador_id] [varchar](15) NOT NULL,
	[niño_id] [varchar](5) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_mensualidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingrediente]    Script Date: 31/03/2021 11:34:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingrediente](
	[nombre] [varchar](50) NOT NULL,
	[fecha_caducidad] [date] NULL,
	[niño_id] [varchar](5) NOT NULL,
	[plato_id] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 31/03/2021 11:34:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[id_menu] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_menu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nino]    Script Date: 31/03/2021 11:34:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nino](
	[id_matricula] [varchar](5) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fecha_ingreso] [date] NOT NULL,
	[comidas_realizadas] [int] NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[fecha_baja] [date] NULL,
	[persona_id] [varchar](15) NOT NULL,
	[menu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pagador]    Script Date: 31/03/2021 11:34:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pagador](
	[dni] [varchar](15) NOT NULL,
	[numero_cuenta] [varchar](20) NOT NULL,
	[banco] [varchar](50) NOT NULL
PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 31/03/2021 11:34:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[dni] [varchar](15) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[direccion] [text] NULL,
	[telefono] [varchar](10) NOT NULL,
	[parentezco] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plato]    Script Date: 31/03/2021 11:34:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plato](
	[nombre] [varchar](50) NOT NULL,
	[cantidad] [float] NULL,
	[descripcion] [text] NULL,
	[menu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_cuota_nino]    Script Date: 31/03/2021 11:34:11 p. m. ******/
CREATE NONCLUSTERED INDEX [idx_cuota_nino] ON [dbo].[cuota_mensual]
(
	[niño_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_cuota_pagador]    Script Date: 31/03/2021 11:34:11 p. m. ******/
CREATE NONCLUSTERED INDEX [idx_cuota_pagador] ON [dbo].[cuota_mensual]
(
	[pagador_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_ingrediente_nino]    Script Date: 31/03/2021 11:34:11 p. m. ******/
CREATE NONCLUSTERED INDEX [idx_ingrediente_nino] ON [dbo].[Ingrediente]
(
	[niño_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_ingrediente_plato]    Script Date: 31/03/2021 11:34:11 p. m. ******/
CREATE NONCLUSTERED INDEX [idx_ingrediente_plato] ON [dbo].[Ingrediente]
(
	[plato_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_nino_menu]    Script Date: 31/03/2021 11:34:11 p. m. ******/
CREATE NONCLUSTERED INDEX [idx_nino_menu] ON [dbo].[nino]
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_nino_persona]    Script Date: 31/03/2021 11:34:11 p. m. ******/
CREATE NONCLUSTERED INDEX [idx_nino_persona] ON [dbo].[nino]
(
	[persona_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_pagador_persona]    Script Date: 31/03/2021 11:34:11 p. m. ******/
CREATE NONCLUSTERED INDEX [idx_pagador_persona] ON [dbo].[pagador]
(
	[dni] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [idx_plato_menu]    Script Date: 31/03/2021 11:34:11 p. m. ******/
CREATE NONCLUSTERED INDEX [idx_plato_menu] ON [dbo].[Plato]
(
	[menu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cuota_mensual]  WITH CHECK ADD  CONSTRAINT [fk_cuota_nino] FOREIGN KEY([niño_id])
REFERENCES [dbo].[nino] ([id_matricula])
GO
ALTER TABLE [dbo].[cuota_mensual] CHECK CONSTRAINT [fk_cuota_nino]
GO
ALTER TABLE [dbo].[cuota_mensual]  WITH CHECK ADD  CONSTRAINT [fk_cuota_pagador] FOREIGN KEY([pagador_id])
REFERENCES [dbo].[pagador] ([dni])
GO
ALTER TABLE [dbo].[cuota_mensual] CHECK CONSTRAINT [fk_cuota_pagador]
GO
ALTER TABLE [dbo].[Ingrediente]  WITH CHECK ADD  CONSTRAINT [fk_ingrediente_nino] FOREIGN KEY([niño_id])
REFERENCES [dbo].[nino] ([id_matricula])
GO
ALTER TABLE [dbo].[Ingrediente] CHECK CONSTRAINT [fk_ingrediente_nino]
GO
ALTER TABLE [dbo].[Ingrediente]  WITH CHECK ADD  CONSTRAINT [fk_ingrediente_plato] FOREIGN KEY([plato_id])
REFERENCES [dbo].[Plato] ([nombre])
GO
ALTER TABLE [dbo].[Ingrediente] CHECK CONSTRAINT [fk_ingrediente_plato]
GO
ALTER TABLE [dbo].[nino]  WITH CHECK ADD  CONSTRAINT [fk_nino_menu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[Menu] ([id_menu])
GO
ALTER TABLE [dbo].[nino] CHECK CONSTRAINT [fk_nino_menu]
GO
ALTER TABLE [dbo].[nino]  WITH CHECK ADD  CONSTRAINT [fk_nino_persona] FOREIGN KEY([persona_id])
REFERENCES [dbo].[Persona] ([dni])
GO
ALTER TABLE [dbo].[nino] CHECK CONSTRAINT [fk_nino_persona]
GO
ALTER TABLE [dbo].[pagador]  WITH CHECK ADD  CONSTRAINT [fk_pagador_persona] FOREIGN KEY([dni])
REFERENCES [dbo].[Persona] ([dni])
GO
ALTER TABLE [dbo].[pagador] CHECK CONSTRAINT [fk_pagador_persona]
GO
ALTER TABLE [dbo].[Plato]  WITH CHECK ADD  CONSTRAINT [fk_plato_menu] FOREIGN KEY([menu_id])
REFERENCES [dbo].[Menu] ([id_menu])
GO
ALTER TABLE [dbo].[Plato] CHECK CONSTRAINT [fk_plato_menu]
GO
USE [master]
GO
ALTER DATABASE [guarderia] SET  READ_WRITE 
GO
