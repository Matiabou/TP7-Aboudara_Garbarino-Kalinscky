USE [master]
GO
/****** Object:  Database [PreguntadOrt]    Script Date: 8/8/2023 09:05:13 ******/
CREATE DATABASE [PreguntadOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadOrt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadOrt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadOrt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadOrt] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadOrt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadOrt', N'ON'
GO
ALTER DATABASE [PreguntadOrt] SET QUERY_STORE = OFF
GO
USE [PreguntadOrt]
GO
/****** Object:  User [alumno]    Script Date: 8/8/2023 09:05:13 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 8/8/2023 09:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[IDCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Foto] [varchar](500) NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultad]    Script Date: 8/8/2023 09:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultad](
	[Id_Dificultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[Id_Dificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 8/8/2023 09:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[IDPregunta] [int] IDENTITY(1,1) NOT NULL,
	[FK_IDCategoria] [int] NOT NULL,
	[FK_IDDificultad] [int] NOT NULL,
	[Enunciado] [varchar](5000) NOT NULL,
	[Foto] [varchar](500) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IDPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 8/8/2023 09:05:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[IDRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[FK_IDPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](500) NOT NULL,
	[Correcta] [bit] NOT NULL,
	[Foto] [varchar](500) NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IDRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (1, N'Arte', NULL)
INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (2, N'Historia', NULL)
INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (3, N'Ciencia', NULL)
INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (4, N'Geografia', NULL)
INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (5, N'Deporte', NULL)
INSERT [dbo].[Categoria] ([IDCategoria], [Nombre], [Foto]) VALUES (6, N'Entretenimiento', NULL)
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Dificultad] ON 

INSERT [dbo].[Dificultad] ([Id_Dificultad], [Nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultad] ([Id_Dificultad], [Nombre]) VALUES (2, N'Medio')
INSERT [dbo].[Dificultad] ([Id_Dificultad], [Nombre]) VALUES (3, N'Dificil')
INSERT [dbo].[Dificultad] ([Id_Dificultad], [Nombre]) VALUES (4, N'Experto')
SET IDENTITY_INSERT [dbo].[Dificultad] OFF
GO
SET IDENTITY_INSERT [dbo].[Pregunta] ON 

INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (1, 1, 1, N'¿Quién pintó La Mona Lisa?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (2, 1, 1, N'¿En qué país se encuentra la Capilla Sixtina?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (3, 1, 2, N'¿Qué famoso pintor neerlandés cortó una parte de su oreja?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (4, 1, 2, N'¿Qué estilo artístico se caracteriza por sus líneas curvas y decoración exuberante?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (5, 1, 3, N'¿Qué famoso pintor es conocido por sus obras "Los girasoles" y "La noche estrellada"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (6, 1, 3, N'¿En qué museo se encuentra el cuadro "La Noche Estrellada" de Vincent van Gogh?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (7, 1, 4, N'¿Qué famoso escultor italiano es conocido por sus obras "David" y "La Piedad"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (8, 1, 4, N'¿Qué famosa escultura representa a un hombre desnudo con una honda en la mano?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (9, 1, 4, N'¿En qué ciudad se encuentra la famosa escultura "El Pensador" de Auguste Rodin?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (10, 1, 4, N'¿Qué monumento arquitectónico es un símbolo de la ciudad de París y fue construido para la Exposición Universal de 1889?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (11, 2, 1, N'¿En qué año comenzó la Primera Guerra Mundial?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (12, 2, 1, N'¿En qué año se firmó la Declaración de Independencia de los Estados Unidos?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (13, 2, 2, N'¿Cuál de los siguientes líderes fue el presidente de los Estados Unidos durante la Guerra Civil?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (14, 2, 2, N'¿En qué año llegó Cristóbal Colón a América?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (15, 2, 2, N'¿En qué año se declaró la Independencia de México?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (16, 2, 3, N'¿Qué país fue el primero en llegar a la Luna?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (17, 2, 3, N'¿En qué año se llevó a cabo la Revolución Rusa?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (18, 2, 4, N'¿Qué famoso líder militar fue el emperador de Francia y conquistó gran parte de Europa en el siglo XIX?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (19, 2, 4, N'¿Qué evento marcó el final de la Guerra Fría y la caída del Muro de Berlín en 1989?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (20, 3, 1, N'¿Cuál es la parte del cuerpo humano encargada de bombear la sangre?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (21, 3, 1, N'¿Cuál de las siguientes opciones NO es una capa de la Tierra?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (22, 3, 1, N'¿Cuál es la unidad básica de la vida?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (23, 3, 1, N'¿Cuál es el símbolo químico del agua?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (24, 3, 1, N'¿Cuál es el planeta más cercano al Sol en nuestro sistema solar?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (25, 3, 2, N'¿Cuál de los siguientes países es atravesado por el río Danubio?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (26, 3, 2, N'¿Cuál es la montaña más alta de África?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (27, 3, 3, N'¿Cuál de los siguientes países NO tiene una frontera con Brasil?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (28, 3, 3, N'¿En qué océano se encuentra la isla de Madagascar?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (29, 3, 4, N'¿Cuál de los siguientes países es conocido como el "país de los tulipanes"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (30, 4, 1, N'¿Cuál es el río más largo del mundo?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (31, 4, 1, N'¿En qué continente se encuentra el desierto del Sahara?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (32, 4, 2, N'¿Cuál es la capital de Canadá?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (33, 4, 2, N'¿Cuál de las siguientes ciudades es conocida como "La ciudad del amor"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (34, 4, 2, N'¿En qué continente se encuentra el Polo Sur?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (35, 4, 3, N'¿Qué país fue el primero en llegar a la Luna?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (36, 4, 3, N'¿En qué año se llevó a cabo la Revolución Rusa?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (37, 4, 4, N'¿Qué famoso líder militar fue el emperador de Francia y conquistó gran parte de Europa en el siglo XIX?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (38, 4, 4, N'¿Qué evento marcó el final de la Guerra Fría y la caída del Muro de Berlín en 1989?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (39, 5, 1, N'¿En qué deporte se otorga la "Copa del Mundo" cada cuatro años?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (40, 5, 1, N'¿Cuál es el deporte más popular en Estados Unidos?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (41, 5, 1, N'¿Cuántos jugadores conforman un equipo de baloncesto en el campo durante un partido?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (42, 5, 1, N'¿En qué deporte se compite por la "Copa Davis"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (43, 5, 1, N'¿Cuál es el equipo de fútbol más exitoso de la historia de la Liga de Campeones de la UEFA?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (44, 5, 2, N'¿En qué deporte se compite por el trofeo "Claret Jug"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (45, 5, 2, N'¿Cuál de los siguientes deportes NO es una disciplina olímpica?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (46, 5, 2, N'¿Qué golfista es conocido como "El Tigre"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (47, 5, 3, N'¿En qué deporte se compite por el trofeo "Copa Libertadores"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (48, 5, 3, N'¿Cuál de los siguientes países ha ganado más títulos en la Copa Mundial de Fútbol?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (49, 1, 1, N'¿Qué famoso escultor es conocido por crear la escultura "El Pensador"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (50, 1, 2, N'¿Cuál de las siguientes pinturas es de Vincent van Gogh?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (51, 1, 3, N'¿Qué artista pintó "Los Girasoles"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (52, 1, 4, N'¿Qué movimiento artístico, liderado por Salvador Dalí, se caracteriza por sus imágenes oníricas y surrealistas?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (53, 2, 1, N'¿En qué año tuvo lugar la Revolución Rusa?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (54, 2, 2, N'¿Qué imperio fue gobernado por el emperador Carlomagno?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (55, 2, 3, N'¿Cuál de las siguientes civilizaciones construyó las pirámides de Teotihuacán?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (56, 2, 4, N'¿En qué año se firmó el Tratado de Versalles, que puso fin a la Primera Guerra Mundial?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (57, 3, 1, N'¿Cuál de los siguientes países es conocido por sus fiordos?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (58, 3, 2, N'¿Cuál es el río más largo del mundo?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (59, 3, 3, N'¿Qué ciudad es conocida como "La Ciudad Eterna"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (60, 3, 4, N'¿Qué famoso desierto se encuentra en África?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (61, 4, 1, N'¿En qué deporte se utiliza una tabla para deslizarse sobre las olas?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (62, 4, 2, N'¿Cuál de las siguientes competiciones de tenis es un Grand Slam?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (63, 4, 3, N'¿En qué deporte se destaca Usain Bolt, conocido como "el hombre más rápido del mundo"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (64, 4, 4, N'¿Qué equipo de fútbol ha ganado más Copas Mundiales de la FIFA?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (65, 5, 1, N'¿Qué saga cinematográfica incluye películas como "The Fellowship of the Ring" y "The Return of the King"?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (66, 5, 2, N'¿Quién interpretó a Harry Potter en las películas basadas en los libros de J.K. Rowling?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (67, 5, 3, N'¿En qué película de Disney aparece el personaje Simba?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (68, 5, 4, N'¿Qué famoso actor es conocido por interpretar a James Bond en varias películas?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (69, 6, 1, N'¿Cuál es el elemento químico más abundante en la corteza terrestre?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (70, 6, 2, N'¿Qué científico formuló la teoría de la relatividad?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (71, 6, 3, N'¿Qué científico descubrió la ley de la gravedad?', NULL)
INSERT [dbo].[Pregunta] ([IDPregunta], [FK_IDCategoria], [FK_IDDificultad], [Enunciado], [Foto]) VALUES (72, 6, 4, N'¿Cuál es el proceso mediante el cual las plantas convierten la luz solar en energía?', NULL)
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuesta] ON 

INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (1, 1, 1, N'Leonardo da Vinci', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (2, 1, 2, N'Miguel Ángel', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (3, 1, 3, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (4, 1, 4, N'Rembrandt', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (5, 2, 1, N'Italia', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (6, 2, 2, N'España', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (7, 2, 3, N'Vaticano', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (8, 2, 4, N'Francia', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (9, 3, 1, N'Vincent van Gogh', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (10, 3, 2, N'Leonardo da Vinci', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (11, 3, 3, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (12, 3, 4, N'Claude Monet', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (13, 4, 1, N'Barroco', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (14, 4, 2, N'Renacimiento', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (15, 4, 3, N'Realismo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (16, 4, 4, N'Impresionismo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (17, 5, 1, N'Museo del Louvre', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (18, 5, 2, N'Museo de Orsay', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (19, 5, 3, N'Museo Van Gogh', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (20, 5, 4, N'Museo Guggenheim', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (21, 6, 1, N'Donatello', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (22, 6, 2, N'Michelangelo', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (23, 6, 3, N'Gian Lorenzo Bernini', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (24, 6, 4, N'Antonio Canova', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (25, 7, 1, N'David', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (26, 7, 2, N'Moisés', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (27, 7, 3, N'Busto de Nefertiti', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (28, 7, 4, N'El Pensador', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (29, 8, 1, N'Roma', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (30, 8, 2, N'Atenas', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (31, 8, 3, N'Estambul', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (32, 8, 4, N'París', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (33, 9, 1, N'Sagrada Familia', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (34, 9, 2, N'Torre Eiffel', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (35, 9, 3, N'Coliseo Romano', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (36, 9, 4, N'Gran Muralla China', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (37, 10, 1, N'1908', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (38, 10, 2, N'1914', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (39, 10, 3, N'1939', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (40, 10, 4, N'1945', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (41, 11, 1, N'1776', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (42, 11, 2, N'1787', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (43, 11, 3, N'1792', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (44, 11, 4, N'1804', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (45, 12, 1, N'Abraham Lincoln', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (46, 12, 2, N'Thomas Jefferson', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (47, 12, 3, N'George Washington', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (48, 12, 4, N'Andrew Johnson', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (49, 13, 1, N'1492', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (50, 13, 2, N'1498', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (51, 13, 3, N'1503', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (52, 13, 4, N'1507', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (53, 14, 1, N'1810', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (54, 14, 2, N'1821', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (55, 14, 3, N'1830', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (56, 14, 4, N'1848', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (57, 15, 1, N'Estados Unidos', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (58, 15, 2, N'Unión Soviética', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (59, 15, 3, N'China', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (60, 15, 4, N'Alemania', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (61, 16, 1, N'1969', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (62, 16, 2, N'1971', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (63, 16, 3, N'1975', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (64, 16, 4, N'1978', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (65, 17, 1, N'Napoleón Bonaparte', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (66, 17, 2, N'Julio César', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (67, 17, 3, N'Alexandre Dumas', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (68, 17, 4, N'Nicolás II de Rusia', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (69, 18, 1, N'Caída del Muro de Berlín', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (70, 18, 2, N'Disolución de la Unión Soviética', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (71, 18, 3, N'Revolución Rusa', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (72, 18, 4, N'Tratado de Versalles', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (73, 19, 1, N'El corazón', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (74, 19, 2, N'Los pulmones', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (75, 19, 3, N'El cerebro', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (76, 19, 4, N'El hígado', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (77, 20, 1, N'Manto', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (78, 20, 2, N'Núcleo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (79, 20, 3, N'Corteza', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (80, 20, 4, N'Mesosfera', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (81, 21, 1, N'Célula', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (82, 21, 2, N'Átomo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (83, 21, 3, N'Molécula', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (84, 21, 4, N'Tejido', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (85, 22, 1, N'H2O', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (86, 22, 2, N'CO2', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (87, 22, 3, N'O2', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (88, 22, 4, N'NaCl', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (89, 23, 1, N'Mercurio', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (90, 23, 2, N'Venus', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (91, 23, 3, N'Marte', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (92, 23, 4, N'Tierra', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (93, 24, 1, N'Austria', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (94, 24, 2, N'Rumania', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (95, 24, 3, N'Italia', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (96, 24, 4, N'Alemania', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (97, 25, 1, N'Monte Kilimanjaro', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (98, 25, 2, N'Monte Everest', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (99, 25, 3, N'Monte Aconcagua', 0, NULL)
GO
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (100, 25, 4, N'Monte McKinley', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (101, 26, 1, N'Uruguay', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (102, 26, 2, N'Perú', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (103, 26, 3, N'Argentina', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (104, 26, 4, N'Colombia', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (105, 27, 1, N'Océano Índico', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (106, 27, 2, N'Océano Pacífico', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (107, 27, 3, N'Océano Atlántico', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (108, 27, 4, N'Océano Ártico', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (109, 28, 1, N'Egipto', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (110, 28, 2, N'Surinam', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (111, 28, 3, N'Guyana', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (112, 28, 4, N'Venezuela', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (113, 29, 1, N'Nilo', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (114, 29, 2, N'Amazonas', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (115, 29, 3, N'Misisipi', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (116, 29, 4, N'Yangtsé', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (117, 30, 1, N'África', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (118, 30, 2, N'Asia', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (119, 30, 3, N'América', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (120, 30, 4, N'Europa', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (121, 31, 1, N'Fútbol', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (122, 31, 2, N'Rugby', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (123, 31, 3, N'Baloncesto', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (124, 31, 4, N'Voleibol', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (125, 32, 1, N'Fútbol Americano', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (126, 32, 2, N'Baloncesto', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (127, 32, 3, N'Béisbol', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (128, 32, 4, N'Hockey sobre hielo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (129, 33, 1, N'5', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (130, 33, 2, N'6', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (131, 33, 3, N'7', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (132, 33, 4, N'8', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (133, 34, 1, N'Tenis', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (134, 34, 2, N'Rugby', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (135, 34, 3, N'Fútbol', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (136, 34, 4, N'Golf', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (137, 35, 1, N'Real Madrid', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (138, 35, 2, N'FC Barcelona', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (139, 35, 3, N'Bayern de Múnich', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (140, 35, 4, N'Liverpool', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (141, 36, 1, N'Golf', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (142, 36, 2, N'Tenis', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (143, 36, 3, N'Fórmula 1', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (144, 36, 4, N'Críquet', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (145, 37, 1, N'Gimnasia rítmica', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (146, 37, 2, N'Bádminton', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (147, 37, 3, N'Hockey sobre hielo', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (148, 37, 4, N'Atletismo', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (149, 38, 1, N'Michael Jordan', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (150, 38, 2, N'LeBron James', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (151, 38, 3, N'Kobe Bryant', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (152, 38, 4, N'Shaquille O''Neal', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (153, 39, 1, N'Fútbol', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (154, 39, 2, N'Rugby', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (155, 39, 3, N'Baloncesto', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (156, 39, 4, N'Béisbol', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (157, 40, 1, N'Brasil', 1, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (158, 40, 2, N'Alemania', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (159, 40, 3, N'Italia', 0, NULL)
INSERT [dbo].[Respuesta] ([IDRespuesta], [FK_IDPregunta], [Opcion], [Contenido], [Correcta], [Foto]) VALUES (160, 40, 4, N'Argentina', 0, NULL)
SET IDENTITY_INSERT [dbo].[Respuesta] OFF
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([FK_IDCategoria])
REFERENCES [dbo].[Categoria] ([IDCategoria])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([FK_IDDificultad])
REFERENCES [dbo].[Dificultad] ([Id_Dificultad])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([FK_IDPregunta])
REFERENCES [dbo].[Pregunta] ([IDPregunta])
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [PreguntadOrt] SET  READ_WRITE 
GO
