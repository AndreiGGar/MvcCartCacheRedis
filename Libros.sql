USE [master]
GO
/****** Object:  Database [LIBROS]    Script Date: 22/05/2023 8:29:35 ******/
CREATE DATABASE [LIBROS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LIBROS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LIBROS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LIBROS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\LIBROS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LIBROS] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LIBROS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LIBROS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LIBROS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LIBROS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LIBROS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LIBROS] SET ARITHABORT OFF 
GO
ALTER DATABASE [LIBROS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LIBROS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LIBROS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LIBROS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LIBROS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LIBROS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LIBROS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LIBROS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LIBROS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LIBROS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LIBROS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LIBROS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LIBROS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LIBROS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LIBROS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LIBROS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LIBROS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LIBROS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LIBROS] SET  MULTI_USER 
GO
ALTER DATABASE [LIBROS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LIBROS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LIBROS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LIBROS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LIBROS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LIBROS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LIBROS] SET QUERY_STORE = OFF
GO
USE [LIBROS]
GO
/****** Object:  Table [dbo].[Libros]    Script Date: 22/05/2023 8:29:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libros](
	[ID] [int] NOT NULL,
	[Titulo] [varchar](100) NULL,
	[Autor] [varchar](100) NULL,
	[Precio] [decimal](10, 2) NULL,
	[Descripcion] [text] NULL,
	[Imagen] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (1, N'1984', N'George Orwell', CAST(15.99 AS Decimal(10, 2)), N'1984 es una novela distópica que presenta un futuro totalitario en el que el gobierno ejerce un control absoluto sobre la sociedad.', N'https://m.media-amazon.com/images/I/81StSOpmkjL.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (2, N'Don Quijote', N'Miguel de Cervantes', CAST(12.50 AS Decimal(10, 2)), N'Don Quijote es una obra maestra de la literatura española que narra las aventuras de un caballero soñador que se lanza a defender la justicia.', N'https://www.marcialpons.es/media/img/portadas/2023/4/18/9788408270881jfif')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (3, N'Orgullo y prejuicio', N'Jane Austen', CAST(9.99 AS Decimal(10, 2)), N'Orgullo y prejuicio es una novela romántica que explora la sociedad y las relaciones interpersonales en la Inglaterra del siglo XIX.', N'https://global-uploads.webflow.com/6034d7d1f3e0f52c50b2adee/625452ebb0e15e764981b44c_6034d7d1f3e0f55fcab2b2de_Orgullo-y-prejuicio-jane-austen-editorial-alma.jpeg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (4, N'El Gran Gatsby', N'F. Scott Fitzgerald', CAST(11.99 AS Decimal(10, 2)), N'El Gran Gatsby es una novela ambientada en la década de 1920 que retrata la vida de Jay Gatsby y su búsqueda del sueño americano.', N'https://m.media-amazon.com/images/I/914TFeOeMOL.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (5, N'Cien años de soledad', N'Gabriel García Márquez', CAST(14.50 AS Decimal(10, 2)), N'Cien años de soledad es una obra maestra del realismo mágico que narra la historia de la familia Buendía a lo largo de varias generaciones en el ficticio pueblo de Macondo.', N'https://m.media-amazon.com/images/I/91TvVQS7loL.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (6, N'Matar a un ruiseñor', N'Harper Lee', CAST(10.99 AS Decimal(10, 2)), N'Matar a un ruiseñor es una novela que aborda temas como la injusticia racial y la pérdida de la inocencia a través de la perspectiva de una niña en el sur de Estados Unidos.', N'https://m.media-amazon.com/images/I/71EqZnXaNoL.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (7, N'Ulises', N'James Joyce', CAST(13.99 AS Decimal(10, 2)), N'Ulises es una novela modernista que sigue un día en la vida de Leopold Bloom en la ciudad de Dublín, explorando temas como la identidad, el amor y la muerte.', N'https://m.media-amazon.com/images/I/41L+nx8lvES.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (8, N'En busca del tiempo perdido', N'Marcel Proust', CAST(16.99 AS Decimal(10, 2)), N'En busca del tiempo perdido es una extensa serie de novelas que reflexionan sobre la memoria, el tiempo y la sociedad francesa del siglo XIX.', N'https://m.media-amazon.com/images/I/617s0veLvuL.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (9, N'El señor de los anillos', N'J.R.R. Tolkien', CAST(19.99 AS Decimal(10, 2)), N'El señor de los anillos es una épica fantasía que sigue la búsqueda de un grupo de personajes para destruir un poderoso anillo y derrotar al malvado Sauron.', N'https://m.media-amazon.com/images/I/41PiLJMCmiL._SX507_BO1,204,203,200_.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (10, N'Crónica de una muerte anunciada', N'Gabriel García Márquez', CAST(8.99 AS Decimal(10, 2)), N'Crónica de una muerte anunciada es una novela que relata el asesinato de un hombre en un pequeño pueblo y explora los temas de la moralidad y la responsabilidad.', N'https://m.media-amazon.com/images/I/91geyJSGR6L.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (11, N'El retrato de Dorian Gray', N'Oscar Wilde', CAST(10.99 AS Decimal(10, 2)), N'El retrato de Dorian Gray es una historia que reflexiona sobre la belleza, el arte y la corrupción moral a través del retrato envejeciente de un hombre.', N'https://m.media-amazon.com/images/I/91KVu+3L8dL.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (12, N'Los miserables', N'Victor Hugo', CAST(17.99 AS Decimal(10, 2)), N'Los miserables es una novela clásica que sigue la vida de Jean Valjean y examina la redención, la justicia y la desigualdad social en la Francia del siglo XIX.', N'https://m.media-amazon.com/images/I/51oBbz9x91L.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (13, N'Moby-Dick', N'Herman Melville', CAST(14.99 AS Decimal(10, 2)), N'Moby-Dick es una obra maestra de la literatura que narra la obsesiva búsqueda del capitán Ahab por vengarse de la gran ballena blanca que le ha causado daño.', N'https://m.media-amazon.com/images/I/71Qe2yIBFmL.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (14, N'El alquimista', N'Paulo Coelho', CAST(11.99 AS Decimal(10, 2)), N'El alquimista es una novela espiritual que sigue el viaje de un joven pastor en busca de su propio destino y los secretos del universo.', N'https://m.media-amazon.com/images/I/812JR2xEL2L.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (15, N'La sombra del viento', N'Carlos Ruiz Zafón', CAST(13.50 AS Decimal(10, 2)), N'La sombra del viento es una novela ambientada en la Barcelona de posguerra que explora misterios, libros y secretos ocultos en un laberinto literario.', N'https://m.media-amazon.com/images/I/913rBE8gPQL.jpg')
INSERT [dbo].[Libros] ([ID], [Titulo], [Autor], [Precio], [Descripcion], [Imagen]) VALUES (16, N'El nombre del viento', N'Patrick Rothfuss', CAST(14.99 AS Decimal(10, 2)), N'Una cautivadora historia de magia, música y aventuras en un mundo lleno de misterio.', N'https://m.media-amazon.com/images/I/817eg2N66wL.jpg')
GO
USE [master]
GO
ALTER DATABASE [LIBROS] SET  READ_WRITE 
GO
