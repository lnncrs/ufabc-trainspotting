USE [trainspotting]
GO
ALTER TABLE [dbo].[Precos] DROP CONSTRAINT [FK_Precos_Modais]
GO
ALTER TABLE [dbo].[Entregas] DROP CONSTRAINT [FK_Entregas_Precos]
GO
ALTER TABLE [dbo].[Entregas] DROP CONSTRAINT [FK_Entregas_Clientes]
GO
ALTER TABLE [dbo].[Dimensoes] DROP CONSTRAINT [FK_Dimensoes_Entregas]
GO
ALTER TABLE [dbo].[Dimensoes] DROP CONSTRAINT [FK_Dimensoes_DimensoesTipos]
GO
ALTER TABLE [dbo].[Precos] DROP CONSTRAINT [DF_Precos_Padrao]
GO
ALTER TABLE [dbo].[Entregas] DROP CONSTRAINT [DF_Entregas_Entregue]
GO
/****** Object:  Table [dbo].[Precos]    Script Date: 12/07/2018 01:08:37 ******/
DROP TABLE [dbo].[Precos]
GO
/****** Object:  Table [dbo].[Modais]    Script Date: 12/07/2018 01:08:37 ******/
DROP TABLE [dbo].[Modais]
GO
/****** Object:  Table [dbo].[Entregas]    Script Date: 12/07/2018 01:08:37 ******/
DROP TABLE [dbo].[Entregas]
GO
/****** Object:  Table [dbo].[DimensoesTipos]    Script Date: 12/07/2018 01:08:37 ******/
DROP TABLE [dbo].[DimensoesTipos]
GO
/****** Object:  Table [dbo].[Dimensoes]    Script Date: 12/07/2018 01:08:37 ******/
DROP TABLE [dbo].[Dimensoes]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 12/07/2018 01:08:37 ******/
DROP TABLE [dbo].[Clientes]
GO
USE [master]
GO
/****** Object:  Database [trainspotting]    Script Date: 12/07/2018 01:08:37 ******/
DROP DATABASE [trainspotting]
GO
/****** Object:  Database [trainspotting]    Script Date: 12/07/2018 01:08:37 ******/
CREATE DATABASE [trainspotting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'trainspotting', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL1\MSSQL\DATA\trainspotting.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'trainspotting_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQL1\MSSQL\DATA\trainspotting_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [trainspotting] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [trainspotting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [trainspotting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [trainspotting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [trainspotting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [trainspotting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [trainspotting] SET ARITHABORT OFF 
GO
ALTER DATABASE [trainspotting] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [trainspotting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [trainspotting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [trainspotting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [trainspotting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [trainspotting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [trainspotting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [trainspotting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [trainspotting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [trainspotting] SET  DISABLE_BROKER 
GO
ALTER DATABASE [trainspotting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [trainspotting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [trainspotting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [trainspotting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [trainspotting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [trainspotting] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [trainspotting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [trainspotting] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [trainspotting] SET  MULTI_USER 
GO
ALTER DATABASE [trainspotting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [trainspotting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [trainspotting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [trainspotting] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [trainspotting] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'trainspotting', N'ON'
GO
ALTER DATABASE [trainspotting] SET QUERY_STORE = OFF
GO
USE [trainspotting]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [trainspotting]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 12/07/2018 01:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ClienteId] [int] IDENTITY(1,1) NOT NULL,
	[Cliente] [nvarchar](100) NOT NULL,
	[Documento] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Telefone] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dimensoes]    Script Date: 12/07/2018 01:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimensoes](
	[DimensaoId] [int] IDENTITY(1,1) NOT NULL,
	[DimensaoTipoId] [int] NOT NULL,
	[EntregaId] [int] NOT NULL,
	[Valor] [decimal](16, 2) NOT NULL,
 CONSTRAINT [PK_Dimensoes] PRIMARY KEY CLUSTERED 
(
	[DimensaoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimensoesTipos]    Script Date: 12/07/2018 01:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimensoesTipos](
	[DimensaoTipoId] [int] IDENTITY(1,1) NOT NULL,
	[DimensaoTipo] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DimensoesTipos] PRIMARY KEY CLUSTERED 
(
	[DimensaoTipoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entregas]    Script Date: 12/07/2018 01:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entregas](
	[EntregasId] [int] IDENTITY(1,1) NOT NULL,
	[ClienteId] [int] NOT NULL,
	[PrecoId] [int] NOT NULL,
	[Saida] [datetime] NULL,
	[Chegada] [datetime] NULL,
	[Distancia] [decimal](16, 2) NULL,
	[Entregue] [bit] NOT NULL,
 CONSTRAINT [PK_Entregas] PRIMARY KEY CLUSTERED 
(
	[EntregasId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modais]    Script Date: 12/07/2018 01:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modais](
	[ModalId] [int] IDENTITY(1,1) NOT NULL,
	[Modal] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Modais] PRIMARY KEY CLUSTERED 
(
	[ModalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Precos]    Script Date: 12/07/2018 01:08:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Precos](
	[PrecoId] [int] IDENTITY(1,1) NOT NULL,
	[ModalId] [int] NOT NULL,
	[Valor] [money] NOT NULL,
	[Inicio] [datetime] NOT NULL,
	[Fim] [datetime] NOT NULL,
	[Padrao] [bit] NOT NULL,
 CONSTRAINT [PK_Precos] PRIMARY KEY CLUSTERED 
(
	[PrecoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DimensoesTipos] ON 

INSERT [dbo].[DimensoesTipos] ([DimensaoTipoId], [DimensaoTipo]) VALUES (1, N'Altura')
INSERT [dbo].[DimensoesTipos] ([DimensaoTipoId], [DimensaoTipo]) VALUES (2, N'Comprimento')
INSERT [dbo].[DimensoesTipos] ([DimensaoTipoId], [DimensaoTipo]) VALUES (3, N'Profundidade')
INSERT [dbo].[DimensoesTipos] ([DimensaoTipoId], [DimensaoTipo]) VALUES (4, N'Volume')
INSERT [dbo].[DimensoesTipos] ([DimensaoTipoId], [DimensaoTipo]) VALUES (5, N'Massa')
SET IDENTITY_INSERT [dbo].[DimensoesTipos] OFF
SET IDENTITY_INSERT [dbo].[Modais] ON 

INSERT [dbo].[Modais] ([ModalId], [Modal]) VALUES (1, N'ferroviário')
INSERT [dbo].[Modais] ([ModalId], [Modal]) VALUES (2, N'rodoviário')
INSERT [dbo].[Modais] ([ModalId], [Modal]) VALUES (3, N'hidroviário')
INSERT [dbo].[Modais] ([ModalId], [Modal]) VALUES (4, N'dutoviário')
INSERT [dbo].[Modais] ([ModalId], [Modal]) VALUES (5, N'aeroviário')
SET IDENTITY_INSERT [dbo].[Modais] OFF
ALTER TABLE [dbo].[Entregas] ADD  CONSTRAINT [DF_Entregas_Entregue]  DEFAULT ((0)) FOR [Entregue]
GO
ALTER TABLE [dbo].[Precos] ADD  CONSTRAINT [DF_Precos_Padrao]  DEFAULT ((0)) FOR [Padrao]
GO
ALTER TABLE [dbo].[Dimensoes]  WITH CHECK ADD  CONSTRAINT [FK_Dimensoes_DimensoesTipos] FOREIGN KEY([DimensaoTipoId])
REFERENCES [dbo].[DimensoesTipos] ([DimensaoTipoId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Dimensoes] CHECK CONSTRAINT [FK_Dimensoes_DimensoesTipos]
GO
ALTER TABLE [dbo].[Dimensoes]  WITH CHECK ADD  CONSTRAINT [FK_Dimensoes_Entregas] FOREIGN KEY([EntregaId])
REFERENCES [dbo].[Entregas] ([EntregasId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Dimensoes] CHECK CONSTRAINT [FK_Dimensoes_Entregas]
GO
ALTER TABLE [dbo].[Entregas]  WITH CHECK ADD  CONSTRAINT [FK_Entregas_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Entregas] CHECK CONSTRAINT [FK_Entregas_Clientes]
GO
ALTER TABLE [dbo].[Entregas]  WITH CHECK ADD  CONSTRAINT [FK_Entregas_Precos] FOREIGN KEY([PrecoId])
REFERENCES [dbo].[Precos] ([PrecoId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Entregas] CHECK CONSTRAINT [FK_Entregas_Precos]
GO
ALTER TABLE [dbo].[Precos]  WITH CHECK ADD  CONSTRAINT [FK_Precos_Modais] FOREIGN KEY([ModalId])
REFERENCES [dbo].[Modais] ([ModalId])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Precos] CHECK CONSTRAINT [FK_Precos_Modais]
GO
USE [master]
GO
ALTER DATABASE [trainspotting] SET  READ_WRITE 
GO
