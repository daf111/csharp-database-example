USE [master]
GO
/****** Object:  Database [BaseDatosTest]    Script Date: 6/29/2022 1:02:35 PM ******/
CREATE DATABASE [BaseDatosTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BaseDatosTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BaseDatosTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BaseDatosTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BaseDatosTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BaseDatosTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BaseDatosTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BaseDatosTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BaseDatosTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BaseDatosTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BaseDatosTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BaseDatosTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [BaseDatosTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BaseDatosTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BaseDatosTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BaseDatosTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BaseDatosTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BaseDatosTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BaseDatosTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BaseDatosTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BaseDatosTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BaseDatosTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BaseDatosTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BaseDatosTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BaseDatosTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BaseDatosTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BaseDatosTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BaseDatosTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BaseDatosTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BaseDatosTest] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BaseDatosTest] SET  MULTI_USER 
GO
ALTER DATABASE [BaseDatosTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BaseDatosTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BaseDatosTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BaseDatosTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BaseDatosTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BaseDatosTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BaseDatosTest] SET QUERY_STORE = OFF
GO
USE [BaseDatosTest]
GO
/****** Object:  UserDefinedFunction [dbo].[Saludar]    Script Date: 6/29/2022 1:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[Saludar] ()
RETURNS varchar(50)
AS
BEGIN
	
	-- Return the result of the function
	RETURN 'Hola mundo!'

END
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 6/29/2022 1:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](10) NOT NULL,
	[email] [varchar](100) NULL,
	[provincia_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido]    Script Date: 6/29/2022 1:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[descuento] [numeric](18, 0) NOT NULL,
	[cliente_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pedido_producto]    Script Date: 6/29/2022 1:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedido_producto](
	[pedido_id] [int] NOT NULL,
	[producto_id] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [numeric](18, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pedido_id] ASC,
	[producto_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 6/29/2022 1:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[precio] [numeric](18, 0) NOT NULL,
	[stock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 6/29/2022 1:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincia](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[poblacion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (1, N'Jannel', N'Hamilton', N'jhamilton0@stumbleupon.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (2, N'Petronille', N'Glackin', N'pglackin1@loc.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (3, N'Kaylyn', N'Shrubsall', N'kshrubsall2@woothemes.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (4, N'Valentine', N'Chritchlow', N'vchritchlow3@sbwire.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (5, N'Christal', N'Vint', N'cvint4@bbc.co.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (6, N'Jeannine', N'Decourt', N'jdecourt5@tinypic.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (7, N'Stanislas', N'Meins', N'smeins6@multiply.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (8, N'Abbe', N'Eland', N'aeland7@sogou.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (9, N'Jareb', N'Goodbanne', N'jgoodbanne8@newsvine.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (10, N'Danya', N'Harkness', N'dharkness9@about.me', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (11, N'Bryn', N'Ridsdell', N'bridsdella@tuttocitta.it', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (12, N'Bing', N'Sidnell', N'bsidnellb@vkontakte.ru', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (13, N'Helli', N'Brozek', N'hbrozekc@hao123.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (14, N'Madella', N'Wharlton', N'mwharltond@apache.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (15, N'Dalston', N'Moores', N'dmoorese@twitter.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (16, N'Oates', N'Craine', N'ocrainef@gizmodo.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (17, N'Linette', N'Hallows', N'lhallowsg@mysql.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (18, N'Jarvis', N'MacKaig', N'jmackaigh@reuters.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (19, N'Bill', N'Andreasen', N'bandreaseni@apple.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (20, N'Ynez', N'Haglinton', N'yhaglintonj@auda.org.au', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (21, N'Pebrook', N'Samwaye', N'psamwayek@bing.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (22, N'Antonin', N'Brolechan', N'abrolechanl@ebay.co.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (23, N'Millie', N'Lobb', N'mlobbm@comsenz.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (24, N'Mel', N'Crowest', N'mcrowestn@simplemachines.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (25, N'Cissy', N'Barkess', N'cbarkesso@businessinsider.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (26, N'Aile', N'Ourry', N'aourryp@harvard.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (27, N'Teodoro', N'Ancliffe', N'tancliffeq@sbwire.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (28, N'Maiga', N'Burfoot', N'mburfootr@hud.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (29, N'Giselbert', N'Nyland', N'gnylands@nytimes.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (30, N'Arlana', N'Seson', N'asesont@si.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (31, N'Salem', N'Bastiman', N'sbastimanu@imdb.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (32, N'Charis', N'Bellocht', N'cbellochtv@studiopress.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (33, N'Paloma', N'Sheron', N'psheronw@yolasite.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (34, N'Randell', N'Pietrzak', N'rpietrzakx@histats.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (35, N'Nonah', N'Rackley', N'nrackleyy@latimes.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (36, N'Carrol', N'Brockbank', N'cbrockbankz@amazon.co.jp', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (37, N'Billie', N'Wadesworth', N'bwadesworth10@ovh.net', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (38, N'Conn', N'Eubank', N'ceubank11@csmonitor.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (39, N'Brennen', N'Case', N'bcase12@oaic.gov.au', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (40, N'Mada', N'Scargle', N'mscargle13@jalbum.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (41, N'Sansone', N'Coan', N'scoan14@exblog.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (42, N'Cyndy', N'Greenlees', N'cgreenlees15@woothemes.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (43, N'Marmaduke', N'Frane', N'mfrane16@telegraph.co.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (44, N'Renaud', N'Ellar', N'rellar17@yellowbook.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (45, N'Milly', N'Adamczyk', N'madamczyk18@berkeley.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (46, N'Carline', N'Jills', N'cjills19@unicef.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (47, N'Mabel', N'Chatband', N'mchatband1a@geocities.jp', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (48, N'Humfrey', N'Brockwell', N'hbrockwell1b@lulu.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (49, N'Den', N'Tarr', N'dtarr1c@taobao.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (50, N'Isadore', N'Lorenz', N'ilorenz1d@over-blog.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (51, N'Noby', N'Eddins', N'neddins1e@state.tx.us', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (52, N'Dodie', N'Hupe', N'dhupe1f@google.es', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (53, N'Clarence', N'Bandey', N'cbandey1g@sciencedaily.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (54, N'Reynolds', N'Redholls', N'rredholls1h@gov.uk', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (55, N'Rowena', N'Axell', N'raxell1i@independent.co.uk', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (56, N'Alejandro', N'Rathbourne', N'arathbourne1j@posterous.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (57, N'Melly', N'Hanton', N'mhanton1k@google.nl', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (58, N'Morganica', N'Riddlesden', N'mriddlesden1l@exblog.jp', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (59, N'Orran', N'Brittain', N'obrittain1m@slideshare.net', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (60, N'Kory', N'Bemand', N'kbemand1n@php.net', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (61, N'Ruy', N'Camacho', N'rcamacho1o@about.me', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (62, N'Del', N'Allcorn', N'dallcorn1p@techcrunch.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (63, N'Darrel', N'Pimmocke', N'dpimmocke1q@mediafire.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (64, N'Arlin', N'Ancell', N'aancell1r@gravatar.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (65, N'Orin', N'Tregunna', N'otregunna1s@constantcontact.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (66, N'Nathalia', N'Bayston', N'nbayston1t@1und1.de', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (67, N'Hamish', N'Punch', N'hpunch1u@slideshare.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (68, N'Lavena', N'Greenroyd', N'lgreenroyd1v@admin.ch', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (70, N'Vania', N'Dowthwaite', N'vdowthwaite1x@icio.us', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (71, N'Ignatius', N'Coal', N'icoal1y@flavors.me', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (72, N'Nicky', N'Mirfield', N'nmirfield1z@tiny.cc', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (73, N'Zorina', N'Brabbins', N'zbrabbins20@stanford.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (74, N'Goldarina', N'Wycherley', N'gwycherley21@themeforest.net', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (75, N'Clemente', N'Glowinski', N'cglowinski22@hostgator.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (76, N'Corbet', N'Drever', N'cdrever23@google.ru', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (77, N'Chrissy', N'Castelyn', N'ccastelyn24@typepad.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (78, N'Horst', N'Froom', N'hfroom25@patch.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (79, N'Nevile', N'Stothard', N'nstothard26@xinhuanet.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (80, N'Tobe', N'Gorring', N'tgorring27@hugedomains.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (81, N'Cherrita', N'Bestman', N'cbestman28@creativecommons.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (82, N'Winnifred', N'Rickaby', N'wrickaby29@google.co.jp', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (83, N'Jorey', N'Bricknell', N'jbricknell2a@shop-pro.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (84, N'Austen', N'Littledyke', N'alittledyke2b@time.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (85, N'Abdel', N'Beardshaw', N'abeardshaw2c@woothemes.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (86, N'Timofei', N'Kensett', N'tkensett2d@istockphoto.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (87, N'Ferdy', N'Cockson', N'fcockson2e@taobao.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (88, N'Maura', N'Kobera', N'mkobera2f@instagram.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (89, N'Quill', N'Palomba', N'qpalomba2g@nhs.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (90, N'Stanislaw', N'Tilzey', N'stilzey2h@abc.net.au', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (91, N'Alexandr', N'Johnsson', N'ajohnsson2i@ucoz.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (92, N'Carlotta', N'Tethcote', N'ctethcote2j@facebook.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (94, N'Gracia', N'Titchen', N'gtitchen2l@geocities.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (95, N'Georgia', N'Larver', N'glarver2m@harvard.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (96, N'Hurlee', N'Masarrat', N'hmasarrat2n@umn.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (97, N'Tuck', N'Cregin', N'tcregin2o@usgs.gov', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (98, N'Meridith', N'Frill', N'mfrill2p@i2i.jp', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (100, N'Dena', N'Belsham', N'dbelsham2r@shinystat.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (101, N'Shina', N'Schoffel', N'sschoffel2s@google.it', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (102, N'Rheta', N'Edison', N'redison2t@vimeo.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (103, N'Ellery', N'Craigheid', N'ecraigheid2u@omniture.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (104, N'Georgina', N'Welden', N'gwelden2v@amazon.co.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (105, N'Marna', N'Barthelet', N'mbarthelet2w@amazon.co.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (106, N'Danika', N'Yelding', N'dyelding2x@ow.ly', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (107, N'Melonie', N'Lovick', N'mlovick2y@cisco.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (108, N'Kristi', N'Selbach', N'kselbach2z@surveymonkey.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (109, N'Dallis', N'Meert', N'dmeert30@ask.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (110, N'Zaria', N'Branch', N'zbranch31@webs.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (112, N'Jonie', N'Roubert', N'jroubert33@omniture.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (114, N'Velma', N'Bradnam', N'vbradnam35@mtv.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (115, N'Ronnie', N'Hassall', N'rhassall36@so-net.ne.jp', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (116, N'Taylor', N'Piel', N'tpiel37@woothemes.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (117, N'Kirbee', N'Moxon', N'kmoxon38@patch.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (118, N'Benoite', N'Seiler', N'bseiler39@sogou.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (119, N'Ericka', N'Finnimore', N'efinnimore3a@prlog.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (120, N'Joni', N'Brettel', N'jbrettel3b@senate.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (121, N'Burg', N'Senyard', N'bsenyard3c@naver.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (122, N'Belva', N'Olden', N'bolden3d@scribd.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (123, N'Jelene', N'Hebbs', N'jhebbs3e@symantec.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (124, N'Jillie', N'Bendin', N'jbendin3f@1688.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (125, N'Kelci', N'Bramwich', N'kbramwich3g@ebay.co.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (126, N'Fredrika', N'Purcer', N'fpurcer3h@squarespace.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (127, N'Husain', N'Titheridge', N'htitheridge3i@360.cn', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (128, N'Diannne', N'Humpatch', N'dhumpatch3j@reddit.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (129, N'Eadmund', N'Peyro', N'epeyro3k@ox.ac.uk', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (130, N'Trenton', N'Clerc', N'tclerc3l@si.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (131, N'Woodrow', N'Coombes', N'wcoombes3m@networkadvertising.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (132, N'Zach', N'Lamb', N'zlamb3n@geocities.jp', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (133, N'Mariellen', N'Dotterill', N'mdotterill3o@wsj.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (134, N'Vincenty', N'Pencost', N'vpencost3p@quantcast.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (135, N'Muffin', N'Zukerman', N'mzukerman3q@amazon.co.uk', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (137, N'Gale', N'Wiggall', N'gwiggall3s@dion.ne.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (138, N'Rachele', N'Clifford', N'rclifford3t@spotify.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (139, N'Gerardo', N'Ealles', N'gealles3u@list-manage.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (140, N'Erinn', N'Ledbetter', N'eledbetter3v@blogs.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (141, N'Lou', N'Peachey', N'lpeachey3w@list-manage.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (142, N'Francisco', N'Huggons', N'fhuggons3x@unesco.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (143, N'Caye', N'Smitton', N'csmitton3y@apple.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (144, N'Alexandros', N'Spurge', N'aspurge3z@home.pl', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (145, N'Brita', N'Binden', N'bbinden40@yellowbook.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (146, N'Omero', N'Starten', N'ostarten41@slideshare.net', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (147, N'Verney', N'Soeiro', N'vsoeiro42@cargocollective.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (148, N'Stirling', N'Clubley', N'sclubley43@accuweather.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (149, N'Ariella', N'Curds', N'acurds44@omniture.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (150, N'Rubetta', N'Larenson', N'rlarenson45@mediafire.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (151, N'Delphine', N'Grimditch', N'dgrimditch46@quantcast.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (153, N'Adriaens', N'Schenkel', N'aschenkel48@elpais.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (154, N'Tabbie', N'Lewson', N'tlewson49@unc.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (155, N'Bourke', N'Wallage', N'bwallage4a@last.fm', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (156, N'Dmitri', N'Jerzak', N'djerzak4b@purevolume.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (158, N'Celinka', N'Durnford', N'cdurnford4d@sohu.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (159, N'Dom', N'Heady', N'dheady4e@wikipedia.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (160, N'Aidan', N'Giorgioni', N'agiorgioni4f@friendfeed.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (161, N'Gale', N'Lazar', N'glazar4g@vk.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (162, N'Tonye', N'Yes', N'tyes4h@aboutads.info', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (163, N'Bobby', N'Alner', N'balner4i@so-net.ne.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (164, N'Gerianna', N'Cosgry', N'gcosgry4j@tmall.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (165, N'Raddie', N'Slemming', N'rslemming4k@last.fm', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (166, N'Renae', N'Langcaster', N'rlangcaster4l@abc.net.au', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (167, N'April', N'Kilgallon', N'akilgallon4m@mayoclinic.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (168, N'Ottilie', N'Bauer', N'obauer4n@wufoo.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (169, N'Arlena', N'Torregiani', N'atorregiani4o@xinhuanet.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (170, N'Page', N'Tipple', N'ptipple4p@washington.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (171, N'Morissa', N'Bezarra', N'mbezarra4q@gnu.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (172, N'Giles', N'Loads', N'gloads4r@whitehouse.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (173, N'Nady', N'Bonnier', N'nbonnier4s@etsy.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (174, N'Clerkclaude', N'Congreave', N'ccongreave4t@shutterfly.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (175, N'Iosep', N'Hilliam', N'ihilliam4u@ask.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (176, N'Amelia', N'Houchen', N'ahouchen4v@zimbio.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (177, N'Lucia', N'Saffin', N'lsaffin4w@dailymotion.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (178, N'Kristen', N'Archbould', N'karchbould4x@macromedia.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (179, N'Sig', N'Mays', N'smays4y@auda.org.au', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (180, N'Elizabeth', N'Neil', N'eneil4z@mapy.cz', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (182, N'Imojean', N'Banger', N'ibanger51@over-blog.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (183, N'May', N'Rue', N'mrue52@discovery.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (184, N'Rosie', N'Hubeaux', N'rhubeaux53@bravesites.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (185, N'Marlee', N'Dradey', N'mdradey54@over-blog.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (186, N'Padraig', N'Aiers', N'paiers55@cpanel.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (187, N'Tiffanie', N'Mennear', N'tmennear56@photobucket.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (188, N'Arnuad', N'Pagett', N'apagett57@goo.gl', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (189, N'Natala', N'Louedey', N'nlouedey58@time.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (190, N'Jeanette', N'Androsik', N'jandrosik59@wp.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (191, N'Rockwell', N'Worsall', N'rworsall5a@stumbleupon.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (192, N'Franzen', N'Halesworth', N'fhalesworth5b@usnews.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (193, N'Irene', N'Petrillo', N'ipetrillo5c@ebay.co.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (194, N'Mannie', N'Orr', N'morr5d@nature.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (195, N'Jamil', N'Iskower', N'jiskower5e@pinterest.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (196, N'Burty', N'Wandrack', N'bwandrack5f@studiopress.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (197, N'Bertine', N'Binning', N'bbinning5g@cdc.gov', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (198, N'Mavra', N'Handes', N'mhandes5h@simplemachines.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (199, N'Dotty', N'Whyberd', N'dwhyberd5i@netscape.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (200, N'Maxwell', N'Ireson', N'mireson5j@joomla.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (201, N'Kilian', N'Pree', N'kpree5k@thetimes.co.uk', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (202, N'Kathy', N'Kittman', N'kkittman5l@wikispaces.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (203, N'Marcelia', N'Waleran', N'mwaleran5m@blogtalkradio.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (204, N'Nicki', N'Cosgrave', N'ncosgrave5n@microsoft.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (205, N'Colleen', N'Harring', N'charring5o@ibm.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (206, N'Towny', N'Donhardt', N'tdonhardt5p@about.me', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (207, N'Clare', N'Wensley', N'cwensley5q@topsy.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (208, N'Judas', N'Janusz', N'jjanusz5r@prlog.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (209, N'Matilda', N'Stitson', N'mstitson5s@cornell.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (210, N'Torie', N'Quinn', N'tquinn5t@jugem.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (211, N'Kristal', N'Vuittet', N'kvuittet5u@list-manage.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (213, N'Marta', N'Zoppo', N'mzoppo5w@cam.ac.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (214, N'Karita', N'Tripp', N'ktripp5x@e-recht24.de', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (215, N'Morley', N'McAlarney', N'mmcalarney5y@drupal.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (216, N'Rockie', N'Shildrick', N'rshildrick5z@360.cn', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (217, N'Sid', N'Morgon', N'smorgon60@icq.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (218, N'Michal', N'Santacrole', N'msantacrole61@vk.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (220, N'Boot', N'Dawber', N'bdawber63@so-net.ne.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (222, N'Deane', N'Menhci', N'dmenhci65@dedecms.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (223, N'Mamie', N'Asbury', N'masbury66@people.com.cn', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (224, N'Sheila', N'Gedney', N'sgedney67@vinaora.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (225, N'Karyn', N'Bearblock', N'kbearblock68@merriam-webster.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (226, N'Annetta', N'Joreau', N'ajoreau69@blog.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (227, N'Skelly', N'Shann', N'sshann6a@google.cn', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (228, N'Stormi', N'Kelsell', N'skelsell6b@businessweek.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (229, N'Phillis', N'Lindop', N'plindop6c@virginia.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (230, N'Otes', N'Donaho', N'odonaho6d@sina.com.cn', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (231, N'Dena', N'Uzielli', N'duzielli6e@free.fr', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (232, N'Lucita', N'Tourry', N'ltourry6f@theatlantic.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (234, N'Torrin', N'Blaszczak', N'tblaszczak6h@geocities.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (235, N'Chelsea', N'Gideon', N'cgideon6i@biglobe.ne.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (236, N'Saw', N'Lorait', N'slorait6j@smh.com.au', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (237, N'Nathanael', N'Maggs', N'nmaggs6k@networksolutions.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (239, N'Beverie', N'Epelett', N'bepelett6m@jigsy.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (240, N'Quent', N'Mulmuray', N'qmulmuray6n@discuz.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (241, N'Pauli', N'Batty', N'pbatty6o@umich.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (243, N'Vaughn', N'Chanson', N'vchanson6q@ning.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (244, N'Beckie', N'Assad', N'bassad6r@unicef.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (245, N'Staci', N'Stubbeley', N'sstubbeley6s@usda.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (246, N'Wenonah', N'Gaiford', N'wgaiford6t@jiathis.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (247, N'Enrika', N'Brusle', N'ebrusle6u@arstechnica.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (248, N'Anneliese', N'Hellier', N'ahellier6v@mit.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (249, N'Waly', N'Marde', N'wmarde6w@cnet.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (250, N'Klaus', N'Schrinel', N'kschrinel6x@goodreads.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (251, N'Selinda', N'Kores', N'skores6y@ow.ly', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (252, N'Nyssa', N'Lonsdale', N'nlonsdale6z@shinystat.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (253, N'Gherardo', N'Sweed', N'gsweed70@ehow.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (254, N'Emiline', N'Unthank', N'eunthank71@scribd.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (255, N'Lucienne', N'Skeats', N'lskeats72@slideshare.net', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (256, N'Edouard', N'Beecheno', N'ebeecheno73@fastcompany.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (257, N'Guilbert', N'Vickerman', N'gvickerman74@cdbaby.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (258, N'Mallorie', N'Pugsley', N'mpugsley75@alexa.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (259, N'Idelle', N'Niesel', N'iniesel76@sakura.ne.jp', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (260, N'Sande', N'Nunson', N'snunson77@marketwatch.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (261, N'Margi', N'Braven', N'mbraven78@cpanel.net', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (262, N'Twila', N'Vogel', N'tvogel79@com.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (263, N'Sydney', N'Bril', N'sbril7a@github.io', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (265, N'Karen', N'Firks', N'kfirks7c@baidu.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (266, N'Olin', N'Felderer', N'ofelderer7d@whitehouse.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (267, N'Dorotea', N'Noir', N'dnoir7e@photobucket.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (268, N'Ruperto', N'Mityushkin', N'rmityushkin7f@tmall.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (269, N'Jocko', N'Robecon', N'jrobecon7g@accuweather.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (270, N'Gae', N'Rochester', N'grochester7h@nyu.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (271, N'Corbin', N'Scriven', N'cscriven7i@alexa.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (272, N'Nicki', N'Stolli', N'nstolli7j@ameblo.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (273, N'Jamey', N'Scadden', N'jscadden7k@nhs.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (274, N'Adolpho', N'Dunbabin', N'adunbabin7l@friendfeed.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (275, N'Pall', N'Sutty', N'psutty7m@infoseek.co.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (276, N'Leonanie', N'Percival', N'lpercival7n@harvard.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (277, N'Bernita', N'Caiger', N'bcaiger7o@illinois.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (278, N'Ewell', N'Godsafe', N'egodsafe7p@unc.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (279, N'Derby', N'Blight', N'dblight7q@nymag.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (280, N'Francois', N'Medford', N'fmedford7r@miibeian.gov.cn', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (281, N'Donia', N'Champneys', N'dchampneys7s@usnews.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (282, N'Kermy', N'Probey', N'kprobey7t@qq.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (283, N'Anny', N'Squibbs', N'asquibbs7u@howstuffworks.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (284, N'Gaylor', N'Richford', N'grichford7v@symantec.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (286, N'Marcelo', N'Southcoat', N'msouthcoat7x@nasa.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (287, N'Lucita', N'Zanazzi', N'lzanazzi7y@rakuten.co.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (288, N'Selig', N'Wiffen', N'swiffen7z@amazonaws.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (289, N'Coreen', N'Wesson', N'cwesson80@lycos.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (290, N'Dasi', N'Epps', N'depps81@utexas.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (291, N'Bride', N'Striker', N'bstriker82@youku.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (292, N'Ruthanne', N'Purver', N'rpurver83@senate.gov', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (293, N'Hobie', N'Wark', N'hwark84@skyrock.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (294, N'Thatcher', N'Gley', N'tgley85@whitehouse.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (295, N'Johnathan', N'Sivell', N'jsivell86@apache.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (296, N'Marchall', N'Cliburn', N'mcliburn87@aol.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (297, N'Rey', N'Treace', N'rtreace88@hhs.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (298, N'Brenn', N'Tubritt', N'btubritt89@indiatimes.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (299, N'Lea', N'Iddens', N'liddens8a@discuz.net', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (300, N'Lilia', N'Leyfield', N'lleyfield8b@rambler.ru', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (301, N'Teena', N'Durand', N'tdurand8c@google.nl', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (302, N'Tiffanie', N'Macak', N'tmacak8d@odnoklassniki.ru', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (303, N'Eugine', N'Bach', N'ebach8e@tiny.cc', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (304, N'Antoinette', N'Strivens', N'astrivens8f@flickr.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (305, N'Cathe', N'Lampett', N'clampett8g@independent.co.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (306, N'Carlene', N'Raise', N'craise8h@ask.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (307, N'Cecilia', N'O''Canavan', N'cocanavan8i@paginegialle.it', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (308, N'Karon', N'Ridett', N'kridett8j@irs.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (309, N'Gene', N'Edginton', N'gedginton8k@multiply.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (310, N'Berri', N'July', N'bjuly8l@typepad.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (311, N'Nicolette', N'Mattheis', N'nmattheis8m@yandex.ru', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (312, N'Caressa', N'Immins', N'cimmins8n@ibm.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (313, N'Haily', N'Boodell', N'hboodell8o@domainmarket.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (314, N'Julienne', N'Aizikovich', N'jaizikovich8p@yelp.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (315, N'Pail', N'Carlino', N'pcarlino8q@facebook.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (316, N'Gallard', N'Suttie', N'gsuttie8r@ustream.tv', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (317, N'Jacqueline', N'Blackater', N'jblackater8s@sogou.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (318, N'Emlyn', N'Husselbee', N'ehusselbee8t@go.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (319, N'Lyndsey', N'Ducker', N'lducker8u@wp.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (320, N'Thalia', N'Lashley', N'tlashley8v@lycos.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (321, N'Kassi', N'Vynarde', N'kvynarde8w@fema.gov', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (322, N'Fairleigh', N'Oppie', N'foppie8x@xinhuanet.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (323, N'Orlan', N'Golson', N'ogolson8y@privacy.gov.au', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (324, N'Doll', N'Wetton', N'dwetton8z@google.co.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (325, N'Chiquita', N'Scoffins', N'cscoffins90@ovh.net', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (326, N'Adolphus', N'Ramberg', N'aramberg91@eventbrite.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (327, N'Gaven', N'Becerra', N'gbecerra92@vinaora.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (328, N'Lucie', N'Lilie', N'llilie93@surveymonkey.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (329, N'Claiborne', N'Daveley', N'cdaveley94@flavors.me', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (330, N'Phil', N'Laxston', N'plaxston95@hud.gov', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (331, N'Lance', N'Mowbury', N'lmowbury96@addtoany.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (332, N'Lucais', N'Befroy', N'lbefroy97@statcounter.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (333, N'Charity', N'Pohl', N'cpohl98@angelfire.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (334, N'Inger', N'Brisseau', N'ibrisseau99@plala.or.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (335, N'Matty', N'Tranter', N'mtranter9a@sitemeter.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (336, N'Inness', N'Fuggle', N'ifuggle9b@census.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (337, N'Symon', N'Melbourn', N'smelbourn9c@elegantthemes.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (338, N'Karola', N'Amberg', N'kamberg9d@ftc.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (339, N'Hector', N'Gumm', N'hgumm9e@nyu.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (340, N'Kiley', N'Rehn', N'krehn9f@moonfruit.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (341, N'Querida', N'Charman', N'qcharman9g@marketwatch.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (342, N'Zola', N'Kenvin', N'zkenvin9h@miibeian.gov.cn', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (343, N'Inger', N'Becken', N'ibecken9i@bloomberg.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (344, N'Celeste', N'Marzellano', N'cmarzellano9j@devhub.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (345, N'Dallas', N'Dunniom', N'ddunniom9k@dailymotion.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (346, N'Penny', N'McLauchlin', N'pmclauchlin9l@google.ru', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (348, N'Claire', N'Blaiklock', N'cblaiklock9n@exblog.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (349, N'Randell', N'Parmley', N'rparmley9o@fastcompany.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (350, N'Salomon', N'Grunbaum', N'sgrunbaum9p@nsw.gov.au', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (351, N'Cassy', N'Piggens', N'cpiggens9q@slate.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (352, N'Wilburt', N'Hegdonne', N'whegdonne9r@mozilla.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (353, N'Candi', N'Szymczyk', N'cszymczyk9s@t.co', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (354, N'Rainer', N'Doblin', N'rdoblin9t@ucsd.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (355, N'Juline', N'Swyn', N'jswyn9u@gravatar.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (356, N'Lula', N'Latchmore', N'llatchmore9v@intel.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (357, N'Denver', N'Demogeot', N'ddemogeot9w@google.ca', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (358, N'Jere', N'Liquorish', N'jliquorish9x@google.com.au', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (359, N'Alexei', N'Ogelsby', N'aogelsby9y@redcross.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (360, N'Swen', N'Obeney', N'sobeney9z@mysql.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (362, N'Reinaldos', N'Janaud', N'rjanauda1@dailymail.co.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (363, N'Gwenny', N'Bossel', N'gbossela2@desdev.cn', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (364, N'Carmen', N'Pyffe', N'cpyffea3@engadget.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (365, N'Melody', N'Speachley', N'mspeachleya4@skype.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (366, N'Salomon', N'Behrens', N'sbehrensa5@spiegel.de', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (367, N'Ford', N'Duiguid', N'fduiguida6@google.co.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (368, N'Jacinthe', N'Werrett', N'jwerretta7@tinyurl.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (369, N'Raimundo', N'Coultish', N'rcoultisha8@wordpress.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (370, N'Francklin', N'Poynser', N'fpoynsera9@smh.com.au', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (371, N'Cindie', N'Skeete', N'cskeeteaa@rambler.ru', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (372, N'Kriste', N'Eastbrook', N'keastbrookab@cnn.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (373, N'Nara', N'O''Grada', N'nogradaac@wiley.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (374, N'Parnell', N'Gall', N'pgallad@4shared.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (375, N'Giselbert', N'Ducroe', N'gducroeae@dot.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (376, N'Thacher', N'Deville', N'tdevilleaf@whitehouse.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (377, N'Kanya', N'Oxtiby', N'koxtibyag@altervista.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (378, N'Taylor', N'Coulston', N'tcoulstonah@mediafire.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (379, N'Bordie', N'Mallett', N'bmallettai@google.com.hk', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (380, N'Julita', N'Coy', N'jcoyaj@php.net', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (381, N'Ethan', N'Spinke', N'espinkeak@1688.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (382, N'Koralle', N'Hans', N'khansal@ebay.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (383, N'Adlai', N'McKinlay', N'amckinlayam@cmu.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (384, N'Garik', N'Sweetland', N'gsweetlandan@studiopress.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (385, N'Emalia', N'Cocking', N'ecockingao@state.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (386, N'Caryl', N'Bentall', N'cbentallap@sina.com.cn', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (387, N'Glyn', N'Blune', N'gbluneaq@t.co', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (388, N'Billi', N'Eppson', N'beppsonar@cmu.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (389, N'Maddy', N'Venmore', N'mvenmoreas@alibaba.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (390, N'Barri', N'Dain', N'bdainat@epa.gov', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (391, N'Claudina', N'Pudden', N'cpuddenau@wordpress.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (392, N'Nicolle', N'Tomson', N'ntomsonav@amazon.co.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (393, N'Dwayne', N'Stothard', N'dstothardaw@wikipedia.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (394, N'Tyson', N'Wickens', N'twickensax@hp.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (395, N'Irma', N'Icke', N'iickeay@businesswire.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (396, N'Thorsten', N'Slipper', N'tslipperaz@ehow.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (397, N'Hamil', N'Whittam', N'hwhittamb0@wikipedia.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (398, N'Aaren', N'Pealing', N'apealingb1@washington.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (399, N'Maje', N'Raecroft', N'mraecroftb2@icio.us', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (400, N'Emery', N'Pochin', N'epochinb3@answers.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (401, N'Bella', N'Charlson', N'bcharlsonb4@foxnews.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (402, N'Mackenzie', N'Paszek', N'mpaszekb5@gmpg.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (403, N'Obadiah', N'MacClancey', N'omacclanceyb6@discovery.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (404, N'Jenifer', N'Bullerwell', N'jbullerwellb7@webnode.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (405, N'Randall', N'Garbar', N'rgarbarb8@huffingtonpost.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (406, N'Pate', N'Kerfod', N'pkerfodb9@europa.eu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (407, N'Worden', N'Rableau', N'wrableauba@sfgate.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (408, N'Flossi', N'Cassells', N'fcassellsbb@jalbum.net', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (409, N'Federico', N'Pulley', N'fpulleybc@narod.ru', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (410, N'Denice', N'Munkton', N'dmunktonbd@soundcloud.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (411, N'Angelle', N'Sporrij', N'asporrijbe@elegantthemes.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (412, N'Dalli', N'Allsupp', N'dallsuppbf@gravatar.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (413, N'Ashely', N'Fleischer', N'afleischerbg@cbc.ca', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (414, N'Luci', N'Roubeix', N'lroubeixbh@bloglines.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (416, N'Ronnie', N'Korejs', N'rkorejsbj@yellowbook.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (417, N'Ann-marie', N'Pyke', N'apykebk@prlog.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (418, N'Dud', N'Ticksall', N'dticksallbl@people.com.cn', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (419, N'Adelina', N'Rubartelli', N'arubartellibm@infoseek.co.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (420, N'Sada', N'Epdell', N'sepdellbn@gov.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (421, N'Bebe', N'Bordiss', N'bbordissbo@devhub.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (422, N'Tierney', N'Cicetti', N'tcicettibp@amazon.de', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (423, N'Erhart', N'Torrent', N'etorrentbq@privacy.gov.au', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (424, N'Ag', N'Wetherhead', N'awetherheadbr@spotify.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (425, N'Angela', N'Lemmertz', N'alemmertzbs@nytimes.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (426, N'Archibaldo', N'Yo', N'ayobt@instagram.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (427, N'Rowen', N'Hobble', N'rhobblebu@qq.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (428, N'Terrell', N'Mallard', N'tmallardbv@google.ru', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (429, N'Ludwig', N'Paddefield', N'lpaddefieldbw@washington.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (430, N'Caril', N'Chittem', N'cchittembx@quantcast.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (431, N'Myrtice', N'McBryde', N'mmcbrydeby@unicef.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (432, N'Romola', N'Goodison', N'rgoodisonbz@gravatar.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (433, N'Benson', N'O''Dowd', N'bodowdc0@opensource.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (434, N'Rosalyn', N'Wood', N'rwoodc1@archive.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (435, N'Johanna', N'Crosio', N'jcrosioc2@studiopress.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (436, N'Francine', N'Rizzi', N'frizzic3@cornell.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (437, N'Gracia', N'Jonathon', N'gjonathonc4@weebly.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (438, N'Griffin', N'Smithe', N'gsmithec5@stumbleupon.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (439, N'Gallard', N'Chaddock', N'gchaddockc6@seattletimes.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (440, N'North', N'Nelson', N'nnelsonc7@weibo.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (441, N'Rubina', N'D''Ambrosi', N'rdambrosic8@yelp.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (442, N'Helenka', N'Hydes', N'hhydesc9@harvard.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (443, N'Tynan', N'Rennolds', N'trennoldsca@twitpic.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (444, N'Niccolo', N'Greson', N'ngresoncb@ca.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (445, N'Farand', N'Sarle', N'fsarlecc@cnn.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (446, N'Guthrey', N'Pendlebury', N'gpendleburycd@google.ru', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (447, N'Darryl', N'Sibthorp', N'dsibthorpce@4shared.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (448, N'Lorita', N'Giroldo', N'lgiroldocf@nba.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (449, N'Ker', N'Harsnipe', N'kharsnipecg@paypal.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (450, N'Archaimbaud', N'Alloisi', N'aalloisich@hubpages.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (451, N'Malina', N'Burnsall', N'mburnsallci@blog.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (452, N'Ulises', N'Zealey', N'uzealeycj@eventbrite.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (453, N'Carina', N'Rawdall', N'crawdallck@diigo.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (454, N'Hillery', N'Whorlow', N'hwhorlowcl@goodreads.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (455, N'Cherri', N'Ettles', N'cettlescm@cargocollective.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (456, N'Evangelia', N'Roggieri', N'eroggiericn@berkeley.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (457, N'Candy', N'Randleson', N'crandlesonco@disqus.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (458, N'Nettle', N'Pendergast', N'npendergastcp@examiner.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (459, N'Ivy', N'Parmer', N'iparmercq@ocn.ne.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (460, N'Sanson', N'Bavage', N'sbavagecr@weibo.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (461, N'Marina', N'Overill', N'moverillcs@skyrock.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (462, N'Margalit', N'Maymand', N'mmaymandct@nature.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (463, N'Nikolai', N'Kohnemann', N'nkohnemanncu@hao123.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (464, N'Kit', N'Spriggin', N'kspriggincv@dyndns.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (465, N'Hanson', N'Gritskov', N'hgritskovcw@globo.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (466, N'Keary', N'Rapin', N'krapincx@csmonitor.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (467, N'Cecilius', N'Moulton', N'cmoultoncy@ycombinator.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (468, N'Karlene', N'Bagge', N'kbaggecz@hao123.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (469, N'Janina', N'Swanne', N'jswanned0@desdev.cn', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (470, N'Bernard', N'MacAfee', N'bmacafeed1@biglobe.ne.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (471, N'Cletus', N'Rubrow', N'crubrowd2@cocolog-nifty.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (472, N'Shannan', N'Colin', N'scolind3@samsung.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (473, N'Arabel', N'Simanenko', N'asimanenkod4@vinaora.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (474, N'Ralf', N'Bernardini', N'rbernardinid5@cnet.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (475, N'Pryce', N'Vigus', N'pvigusd6@yandex.ru', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (476, N'Fayth', N'Cisneros', N'fcisnerosd7@parallels.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (477, N'Antony', N'Borland', N'aborlandd8@ucoz.ru', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (478, N'Silvanus', N'Heber', N'sheberd9@accuweather.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (479, N'Rosalind', N'Ameer-Beg', N'rameerbegda@phpbb.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (480, N'Christos', N'Chadd', N'cchadddb@wikimedia.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (481, N'Ragnar', N'Santacrole', N'rsantacroledc@ning.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (482, N'Delaney', N'Gorman', N'dgormandd@tamu.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (483, N'Aeriela', N'Duffin', N'aduffinde@slashdot.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (484, N'Karrie', N'Cranmer', N'kcranmerdf@nbcnews.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (485, N'Delora', N'Chaplin', N'dchaplindg@youtu.be', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (486, N'Elie', N'Strang', N'estrangdh@jigsy.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (487, N'Mary', N'Bertin', N'mbertindi@w3.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (488, N'Andie', N'Sleeford', N'asleeforddj@jiathis.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (489, N'Marla', N'Parken', N'mparkendk@skyrock.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (490, N'Ardisj', N'Prestidge', N'aprestidgedl@soundcloud.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (491, N'Kizzie', N'Mantram', N'kmantramdm@smugmug.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (492, N'Opalina', N'De Mico', N'odemicodn@creativecommons.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (494, N'Etti', N'Grimble', N'egrimbledp@vistaprint.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (495, N'Salomone', N'Bezley', N'sbezleydq@odnoklassniki.ru', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (496, N'Kaiser', N'Lamlin', N'klamlindr@bigcartel.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (497, N'Lusa', N'Farrent', N'lfarrentds@huffingtonpost.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (498, N'Rick', N'Tilly', N'rtillydt@is.gd', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (499, N'Tore', N'Maynard', N'tmaynarddu@studiopress.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (500, N'Saree', N'Kolak', N'skolakdv@alexa.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (501, N'Vachel', N'Buttfield', N'vbuttfielddw@w3.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (502, N'Rachelle', N'Simonin', N'rsimonindx@sourceforge.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (503, N'Marven', N'Jeffreys', N'mjeffreysdy@vinaora.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (504, N'Dulcinea', N'Shires', N'dshiresdz@adobe.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (505, N'Allayne', N'Elgee', N'aelgeee0@fastcompany.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (506, N'Jsandye', N'Ormesher', N'jormeshere1@unblog.fr', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (507, N'Carly', N'Jollye', N'cjollyee2@bravesites.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (509, N'Jabez', N'Oake', N'joakee4@multiply.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (510, N'Christian', N'Balducci', N'cbalduccie5@wikispaces.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (511, N'Michelina', N'Stoffersen', N'mstoffersene6@icio.us', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (512, N'Leif', N'Hinrichsen', N'lhinrichsene7@examiner.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (513, N'Brandyn', N'Tomsen', N'btomsene8@livejournal.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (514, N'Goraud', N'Chipp', N'gchippe9@skype.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (515, N'Aurthur', N'Wooff', N'awooffea@techcrunch.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (516, N'Kendre', N'Butts', N'kbuttseb@google.fr', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (517, N'Halli', N'Bernat', N'hbernatec@google.cn', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (518, N'Kassi', N'Glinde', N'kglindeed@skype.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (519, N'Zechariah', N'Trahear', N'ztrahearee@diigo.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (520, N'Lin', N'Leahey', N'lleaheyef@odnoklassniki.ru', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (521, N'Finley', N'Delhanty', N'fdelhantyeg@weebly.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (522, N'Phil', N'Iacopini', N'piacopinieh@people.com.cn', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (523, N'Maximo', N'Crozier', N'mcrozierei@vinaora.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (524, N'Sterling', N'Dowdeswell', N'sdowdeswellej@wunderground.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (525, N'Somerset', N'Walby', N'swalbyek@rakuten.co.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (526, N'Marianne', N'Ellcome', N'mellcomeel@devhub.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (527, N'Kendal', N'Heymann', N'kheymannem@woothemes.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (528, N'Dasya', N'Roebottom', N'droebottomen@free.fr', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (529, N'Carter', N'McCrory', N'cmccroryeo@digg.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (530, N'Nickolas', N'Trewman', N'ntrewmanep@comsenz.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (531, N'Livy', N'Hugnet', N'lhugneteq@hhs.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (532, N'Emmey', N'Venard', N'evenarder@hibu.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (533, N'Umberto', N'Gouge', N'ugougees@ihg.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (534, N'Sukey', N'Danilewicz', N'sdanilewiczet@mapy.cz', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (535, N'Harlie', N'Allcroft', N'hallcrofteu@answers.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (536, N'Tomkin', N'Exall', N'texallev@comsenz.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (537, N'Sheffie', N'Omand', N'somandew@house.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (538, N'Carol-jean', N'Drayson', N'cdraysonex@miitbeian.gov.cn', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (539, N'Noby', N'Lebreton', N'nlebretoney@archive.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (540, N'Free', N'Plain', N'fplainez@independent.co.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (541, N'Lenna', N'Muckleston', N'lmucklestonf0@technorati.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (542, N'Mead', N'Mabbs', N'mmabbsf1@omniture.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (543, N'Leo', N'Walewicz', N'lwalewiczf2@google.cn', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (544, N'Willie', N'Hawlgarth', N'whawlgarthf3@oracle.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (545, N'Trstram', N'Besque', N'tbesquef4@phoca.cz', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (546, N'Andrei', N'Ragat', N'aragatf5@amazon.co.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (547, N'Dehlia', N'Florentine', N'dflorentinef6@mayoclinic.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (548, N'Alfonse', N'Everit', N'aeveritf7@uol.com.br', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (549, N'Mirella', N'Kynston', N'mkynstonf8@utexas.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (550, N'Ruperta', N'Gresley', N'rgresleyf9@reference.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (551, N'Kyla', N'Jansey', N'kjanseyfa@sbwire.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (552, N'Florentia', N'Geharke', N'fgeharkefb@naver.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (553, N'Gerry', N'Mollene', N'gmollenefc@timesonline.co.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (554, N'Culver', N'Wildes', N'cwildesfd@usgs.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (555, N'Lay', N'Bendley', N'lbendleyfe@globo.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (556, N'Cathleen', N'Klazenga', N'cklazengaff@cbslocal.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (557, N'Rodolfo', N'Stevani', N'rstevanifg@bigcartel.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (558, N'Basile', N'Gabbott', N'bgabbottfh@acquirethisname.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (559, N'Ceciley', N'Mallock', N'cmallockfi@myspace.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (560, N'Jarrad', N'Lindermann', N'jlindermannfj@myspace.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (561, N'Whitby', N'Rizzetti', N'wrizzettifk@vk.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (562, N'Anya', N'Alpine', N'aalpinefl@oracle.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (563, N'Samara', N'Waistell', N'swaistellfm@people.com.cn', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (564, N'Jenni', N'Stiggers', N'jstiggersfn@dmoz.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (565, N'Timi', N'Bordman', N'tbordmanfo@scientificamerican.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (566, N'Sara', N'McVaugh', N'smcvaughfp@about.me', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (567, N'Damien', N'Vanini', N'dvaninifq@yellowbook.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (568, N'Mab', N'Gifford', N'mgiffordfr@nps.gov', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (569, N'Roxanna', N'Rapps', N'rrappsfs@arstechnica.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (570, N'Leena', N'Virgo', N'lvirgoft@seattletimes.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (571, N'Rubi', N'Stephens', N'rstephensfu@freewebs.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (572, N'Jerrie', N'Galgey', N'jgalgeyfv@bbc.co.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (573, N'Salvatore', N'Tyce', N'stycefw@google.es', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (574, N'Kristi', N'Pymm', N'kpymmfx@cafepress.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (575, N'Tobin', N'Nitti', N'tnittify@reference.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (576, N'Jonis', N'Ravenhill', N'jravenhillfz@privacy.gov.au', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (577, N'Ciro', N'Stirland', N'cstirlandg0@wix.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (578, N'Helaina', N'Pickerin', N'hpickering1@adobe.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (580, N'Lothaire', N'Surmeyer', N'lsurmeyerg3@craigslist.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (581, N'Pen', N'Pelerin', N'ppelering4@china.com.cn', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (582, N'Clarita', N'Bellany', N'cbellanyg5@mashable.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (583, N'Augustina', N'Pionter', N'apionterg6@moonfruit.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (584, N'Myron', N'Janca', N'mjancag7@blinklist.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (585, N'Jada', N'Sharratt', N'jsharrattg8@addthis.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (586, N'Wilbert', N'Dobrowlski', N'wdobrowlskig9@jugem.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (587, N'Yehudi', N'Pietersen', N'ypietersenga@ebay.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (588, N'Gay', N'Sired', N'gsiredgb@oracle.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (589, N'Romy', N'Grunwall', N'rgrunwallgc@godaddy.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (590, N'Rikki', N'Knell', N'rknellgd@pagesperso-orange.fr', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (591, N'Freeland', N'Sollon', N'fsollonge@last.fm', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (592, N'Laurella', N'Baumer', N'lbaumergf@nhs.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (593, N'Sabina', N'Rowledge', N'srowledgegg@xrea.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (594, N'Alvera', N'Hellmer', N'ahellmergh@alibaba.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (595, N'Fiona', N'Hooban', N'fhoobangi@barnesandnoble.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (596, N'Cesya', N'Beakes', N'cbeakesgj@taobao.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (597, N'Inglis', N'Dovey', N'idoveygk@who.int', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (598, N'Antony', N'McKoy', N'amckoygl@usda.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (599, N'Tabbie', N'Mulliner', N'tmullinergm@over-blog.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (600, N'Holly', N'Stiven', N'hstivengn@nature.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (601, N'Blinnie', N'Brownsett', N'bbrownsettgo@squidoo.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (602, N'Eduard', N'Rowlings', N'erowlingsgp@umn.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (603, N'Celka', N'Jaxon', N'cjaxongq@mayoclinic.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (604, N'Esra', N'Emmison', N'eemmisongr@google.de', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (605, N'Corie', N'Keemer', N'ckeemergs@cpanel.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (606, N'Darb', N'Curuclis', N'dcuruclisgt@cargocollective.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (607, N'Rollie', N'Tippell', N'rtippellgu@amazonaws.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (608, N'Donetta', N'Stuckley', N'dstuckleygv@examiner.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (609, N'Nollie', N'Boutton', N'nbouttongw@mlb.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (610, N'Faun', N'Blackaller', N'fblackallergx@japanpost.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (611, N'Harcourt', N'Torbard', N'htorbardgy@blogspot.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (612, N'Salem', N'Resun', N'sresungz@canalblog.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (613, N'Missy', N'Cianni', N'mciannih0@newsvine.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (614, N'Dinnie', N'Wrack', N'dwrackh1@jigsy.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (615, N'Othella', N'Rockwill', N'orockwillh2@merriam-webster.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (616, N'Cherie', N'De Bruijne', N'cdebruijneh3@guardian.co.uk', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (617, N'Loni', N'Lavallin', N'llavallinh4@cbsnews.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (618, N'Meagan', N'Franek', N'mfranekh5@surveymonkey.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (619, N'Hermon', N'Lill', N'hlillh6@netlog.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (620, N'Rhys', N'Bang', N'rbangh7@utexas.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (621, N'Klement', N'St Pierre', N'kstpierreh8@nba.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (622, N'Dane', N'Beveridge', N'dbeveridgeh9@wikimedia.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (623, N'Barbra', N'McGookin', N'bmcgookinha@comcast.net', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (624, N'Shandy', N'Sandal', N'ssandalhb@dyndns.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (625, N'Kendall', N'Beggio', N'kbeggiohc@facebook.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (626, N'Hi', N'Alabaster', N'halabasterhd@mtv.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (627, N'Jania', N'Alphege', N'jalphegehe@webnode.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (628, N'Adelina', N'Gamlen', N'agamlenhf@theglobeandmail.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (629, N'Quintana', N'Bradshaw', N'qbradshawhg@posterous.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (630, N'Faulkner', N'MacConnel', N'fmacconnelhh@g.co', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (633, N'Morey', N'Jacklings', N'mjacklingshk@cyberchimps.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (634, N'Fenelia', N'Jellybrand', N'fjellybrandhl@about.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (635, N'Kayley', N'Tanner', N'ktannerhm@qq.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (636, N'Kaye', N'Thurstance', N'kthurstancehn@soundcloud.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (637, N'Colin', N'Larmett', N'clarmettho@dell.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (638, N'Adolf', N'Shortan', N'ashortanhp@ocn.ne.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (640, N'Rochelle', N'Kiely', N'rkielyhr@posterous.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (641, N'Kristan', N'Galle', N'kgallehs@redcross.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (642, N'Marybeth', N'Chang', N'mchanght@bravesites.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (643, N'Floria', N'Gouth', N'fgouthhu@timesonline.co.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (644, N'Rhodia', N'Dutchburn', N'rdutchburnhv@furl.net', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (645, N'Perice', N'Camamile', N'pcamamilehw@businessinsider.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (646, N'Selie', N'Aspell', N'saspellhx@state.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (647, N'Jody', N'Guisby', N'jguisbyhy@boston.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (648, N'Laughton', N'Pockett', N'lpocketthz@furl.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (649, N'Laural', N'Rome', N'lromei0@csmonitor.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (650, N'Tawsha', N'Whithalgh', N'twhithalghi1@ehow.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (651, N'Cleavland', N'Alennikov', N'calennikovi2@opera.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (652, N'Claudius', N'Rapsey', N'crapseyi3@deviantart.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (653, N'Annelise', N'Hartridge', N'ahartridgei4@youku.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (654, N'Alena', N'Node', N'anodei5@marriott.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (655, N'Noel', N'Treadway', N'ntreadwayi6@fda.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (656, N'Marybeth', N'Pomfrett', N'mpomfretti7@ucoz.ru', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (657, N'Ajay', N'Camplejohn', N'acamplejohni8@mac.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (658, N'Loralyn', N'Wiltshear', N'lwiltsheari9@nytimes.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (659, N'Jammal', N'Kalkofer', N'jkalkoferia@aboutads.info', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (660, N'Aguistin', N'Fooks', N'afooksib@360.cn', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (661, N'Richy', N'Barbe', N'rbarbeic@sogou.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (662, N'Marijn', N'Nappin', N'mnappinid@intel.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (663, N'Bax', N'Castellani', N'bcastellaniie@umich.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (664, N'Lemar', N'Blazevic', N'lblazevicif@discovery.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (665, N'Desmund', N'Andryushin', N'dandryushinig@about.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (666, N'Gianni', N'Skoate', N'gskoateih@latimes.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (667, N'Fancy', N'Sneesby', N'fsneesbyii@eepurl.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (668, N'Christophe', N'Salandino', N'csalandinoij@yellowpages.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (669, N'Orlando', N'O''Kerin', N'ookerinik@addtoany.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (670, N'Andriana', N'Tomasz', N'atomaszil@aboutads.info', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (671, N'Car', N'Love', N'cloveim@businessinsider.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (672, N'Tiphanie', N'Pallent', N'tpallentin@cornell.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (673, N'Hewet', N'McKevitt', N'hmckevittio@unicef.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (674, N'Augustine', N'Cromie', N'acromieip@quantcast.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (675, N'Charmian', N'Grundon', N'cgrundoniq@arizona.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (676, N'Cris', N'Morefield', N'cmorefieldir@unc.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (677, N'Jayson', N'Leonarde', N'jleonardeis@elpais.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (678, N'Bonni', N'Crich', N'bcrichit@qq.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (679, N'Killian', N'Jorez', N'kjoreziu@squidoo.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (680, N'Gabie', N'Eric', N'gericiv@google.ca', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (681, N'Loralee', N'Janous', N'ljanousiw@fc2.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (682, N'Adler', N'Ping', N'apingix@tumblr.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (683, N'Lawrence', N'Kibbye', N'lkibbyeiy@skyrock.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (684, N'Brittan', N'Shrimptone', N'bshrimptoneiz@intel.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (685, N'Cleopatra', N'Newell', N'cnewellj0@sphinn.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (686, N'Alethea', N'Astall', N'aastallj1@utexas.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (687, N'Junina', N'Dicey', N'jdiceyj2@va.gov', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (688, N'Tammy', N'Draper', N'tdraperj3@admin.ch', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (689, N'Kimberly', N'Gumley', N'kgumleyj4@ow.ly', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (690, N'Lishe', N'Sorel', N'lsorelj5@google.co.jp', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (691, N'Ferdinande', N'Itzak', N'fitzakj6@addthis.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (692, N'Donny', N'Badrock', N'dbadrockj7@usgs.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (693, N'Robinett', N'Dittson', N'rdittsonj8@stanford.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (694, N'Jaclyn', N'Geockle', N'jgeocklej9@theguardian.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (695, N'Ingemar', N'Leckey', N'ileckeyja@prlog.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (698, N'Alasdair', N'Halliwell', N'ahalliwelljd@soundcloud.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (699, N'Inge', N'Clothier', N'iclothierje@china.com.cn', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (701, N'Dorotea', N'Riche', N'drichejg@hibu.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (702, N'Zach', N'Fike', N'zfikejh@lulu.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (703, N'Garek', N'Skelcher', N'gskelcherji@alexa.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (704, N'Terence', N'O''Flaverty', N'toflavertyjj@baidu.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (705, N'Erastus', N'Streetley', N'estreetleyjk@slashdot.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (706, N'Aymer', N'Caslett', N'acaslettjl@biblegateway.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (707, N'Viole', N'Dalrymple', N'vdalrymplejm@altervista.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (708, N'Graehme', N'Athridge', N'gathridgejn@nsw.gov.au', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (709, N'Cooper', N'Worgan', N'cworganjo@yolasite.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (710, N'Shaun', N'Minter', N'sminterjp@biglobe.ne.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (711, N'Richart', N'Colmore', N'rcolmorejq@amazon.co.jp', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (712, N'Bidget', N'Aizic', N'baizicjr@soundcloud.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (713, N'Maryanna', N'MacMaykin', N'mmacmaykinjs@earthlink.net', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (714, N'Tulley', N'Riglesford', N'triglesfordjt@alibaba.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (715, N'Elisha', N'Burnip', N'eburnipju@ca.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (716, N'Allis', N'Major', N'amajorjv@barnesandnoble.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (717, N'Jefferey', N'Parysiak', N'jparysiakjw@nature.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (718, N'Lenee', N'Okker', N'lokkerjx@aboutads.info', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (719, N'Therese', N'Twiname', N'ttwinamejy@illinois.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (720, N'Waldemar', N'Betho', N'wbethojz@wikia.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (721, N'Reiko', N'Mercy', N'rmercyk0@mashable.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (722, N'Beatrisa', N'Fahy', N'bfahyk1@chronoengine.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (723, N'Abraham', N'Eykel', N'aeykelk2@freewebs.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (724, N'Doria', N'Hailes', N'dhailesk3@skype.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (725, N'Leone', N'Besantie', N'lbesantiek4@marriott.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (726, N'Andrey', N'Kopje', N'akopjek5@mlb.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (727, N'Leticia', N'Northeast', N'lnortheastk6@prlog.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (728, N'Agosto', N'Dahmel', N'adahmelk7@mysql.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (729, N'Reuben', N'McNuff', N'rmcnuffk8@e-recht24.de', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (730, N'Baird', N'Gosby', N'bgosbyk9@amazon.co.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (731, N'Anjanette', N'Binnion', N'abinnionka@reddit.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (732, N'Felipe', N'Lucio', N'fluciokb@merriam-webster.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (733, N'Deck', N'Genner', N'dgennerkc@bigcartel.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (734, N'Aimee', N'Jeckell', N'ajeckellkd@ycombinator.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (735, N'Carolyne', N'Pateman', N'cpatemanke@fastcompany.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (736, N'Putnam', N'Ditchburn', N'pditchburnkf@tiny.cc', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (737, N'Datha', N'Horsefield', N'dhorsefieldkg@imdb.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (738, N'Mignon', N'Ingilson', N'mingilsonkh@t-online.de', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (739, N'Celestyn', N'Chalk', N'cchalkki@gov.uk', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (740, N'Biddy', N'Shearme', N'bshearmekj@gmpg.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (741, N'Lorens', N'Bussetti', N'lbussettikk@google.co.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (742, N'Blinnie', N'Cremer', N'bcremerkl@mapy.cz', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (743, N'Lamont', N'Hairsnape', N'lhairsnapekm@craigslist.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (744, N'Lance', N'Boise', N'lboisekn@mapy.cz', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (745, N'Darline', N'Colmer', N'dcolmerko@nsw.gov.au', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (746, N'Felisha', N'Mongain', N'fmongainkp@ft.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (747, N'Melamie', N'Pales', N'mpaleskq@washingtonpost.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (748, N'Sue', N'Bunstone', N'sbunstonekr@hp.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (750, N'Venus', N'Ellen', N'vellenkt@ucoz.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (751, N'Maryrose', N'Redding', N'mreddingku@slideshare.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (752, N'Liuka', N'Keggins', N'lkegginskv@pcworld.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (753, N'Ricki', N'Follit', N'rfollitkw@tmall.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (754, N'Marcella', N'Champness', N'mchampnesskx@vk.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (755, N'Ikey', N'Sellars', N'isellarsky@apache.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (756, N'Orlando', N'Cadlock', N'ocadlockkz@ning.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (757, N'Natal', N'Pelerin', N'npelerinl0@utexas.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (758, N'Bevon', N'Brient', N'bbrientl1@ow.ly', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (759, N'Lidia', N'Heartfield', N'lheartfieldl2@blogtalkradio.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (760, N'Boris', N'McNutt', N'bmcnuttl3@hao123.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (761, N'Hube', N'Lifsey', N'hlifseyl4@bizjournals.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (762, N'Sholom', N'Povall', N'spovalll5@gnu.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (764, N'Bat', N'Risso', N'brissol7@senate.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (765, N'Enriqueta', N'Reinbech', N'ereinbechl8@mac.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (766, N'Josias', N'McElhinney', N'jmcelhinneyl9@cam.ac.uk', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (767, N'Keslie', N'Winkless', N'kwinklessla@umich.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (768, N'Isidor', N'Ecles', N'iecleslb@craigslist.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (769, N'Sophie', N'Cash', N'scashlc@who.int', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (770, N'Lisetta', N'Wenzel', N'lwenzelld@wired.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (771, N'Gwynne', N'Kiebes', N'gkiebesle@rediff.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (772, N'Ulrike', N'Gabbidon', N'ugabbidonlf@youku.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (773, N'Rollie', N'Exell', N'rexelllg@addtoany.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (774, N'Maribelle', N'Abbs', N'mabbslh@cpanel.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (775, N'Betsy', N'Simonitto', N'bsimonittoli@cnn.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (776, N'Darline', N'Scintsbury', N'dscintsburylj@scribd.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (777, N'Luca', N'Sebastian', N'lsebastianlk@youtu.be', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (778, N'Winifred', N'Cleever', N'wcleeverll@ftc.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (779, N'Amalle', N'Wadman', N'awadmanlm@fema.gov', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (780, N'Brooks', N'Pretsel', N'bpretselln@acquirethisname.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (781, N'Chiarra', N'Shreve', N'cshrevelo@mit.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (782, N'Lindsay', N'Archard', N'larchardlp@dailymail.co.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (783, N'Normy', N'Vasyunkin', N'nvasyunkinlq@163.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (784, N'Gustavo', N'Goede', N'ggoedelr@slashdot.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (785, N'Gloriana', N'Gowling', N'ggowlingls@ihg.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (786, N'Hynda', N'Offell', N'hoffelllt@chron.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (787, N'Olin', N'Hadingham', N'ohadinghamlu@delicious.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (788, N'Miguel', N'Felton', N'mfeltonlv@msn.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (789, N'Kayne', N'Spare', N'ksparelw@feedburner.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (790, N'Nichol', N'Swanne', N'nswannelx@ask.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (791, N'Morgun', N'Nichols', N'mnicholsly@tamu.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (792, N'Tomas', N'Leaney', N'tleaneylz@edublogs.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (793, N'Karola', N'Shovlar', N'kshovlarm0@walmart.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (794, N'Hesther', N'Boobier', N'hboobierm1@github.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (795, N'Mitchel', N'Levins', N'mlevinsm2@scribd.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (796, N'Gianina', N'Moynihan', N'gmoynihanm3@wikimedia.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (797, N'Trish', N'Sahlstrom', N'tsahlstromm4@mit.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (798, N'Cathrine', N'Petrovsky', N'cpetrovskym5@elegantthemes.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (799, N'Janene', N'Jealous', N'jjealousm6@bbc.co.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (800, N'Jeremiah', N'Sedman', N'jsedmanm7@columbia.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (801, N'Donal', N'Finding', N'dfindingm8@github.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (802, N'Ringo', N'Knifton', N'rkniftonm9@cbslocal.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (803, N'Rivalee', N'Suatt', N'rsuattma@chron.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (804, N'Noam', N'Proom', N'nproommb@csmonitor.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (805, N'Abram', N'Burdass', N'aburdassmc@utexas.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (806, N'Stacey', N'Cofax', N'scofaxmd@example.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (807, N'Suzette', N'Pickersail', N'spickersailme@latimes.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (808, N'Jaquelin', N'Forestall', N'jforestallmf@bigcartel.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (809, N'Isaiah', N'Pett', N'ipettmg@google.ru', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (810, N'Domini', N'Kaming', N'dkamingmh@tuttocitta.it', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (811, N'Jessa', N'Boyen', N'jboyenmi@soup.io', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (812, N'Christyna', N'Larchiere', N'clarchieremj@nature.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (813, N'Ava', N'Dales', N'adalesmk@vimeo.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (814, N'Cyndy', N'Eastcott', N'ceastcottml@bbb.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (815, N'Danella', N'Tatnell', N'dtatnellmm@shutterfly.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (816, N'Glen', N'Klosges', N'gklosgesmn@indiatimes.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (817, N'Sawyer', N'Aldren', N'saldrenmo@phoca.cz', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (818, N'Gayel', N'McGlynn', N'gmcglynnmp@myspace.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (819, N'Desiree', N'Esom', N'desommq@bbc.co.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (820, N'Randa', N'Lowis', N'rlowismr@ask.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (821, N'Davin', N'Pim', N'dpimms@mlb.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (822, N'Marylin', N'Grzelewski', N'mgrzelewskimt@pagesperso-orange.fr', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (823, N'Butch', N'Lamprey', N'blampreymu@hatena.ne.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (824, N'Jorey', N'Bollen', N'jbollenmv@techcrunch.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (825, N'Kristoforo', N'Mercik', N'kmercikmw@usda.gov', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (826, N'Erny', N'Turbat', N'eturbatmx@unc.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (827, N'Dun', N'Vinter', N'dvintermy@arizona.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (828, N'Ranice', N'Willans', N'rwillansmz@ca.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (829, N'Marie-ann', N'Stivers', N'mstiversn0@amazon.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (830, N'Demetris', N'Kingzeth', N'dkingzethn1@apple.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (831, N'Hollis', N'Sheard', N'hsheardn2@addthis.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (832, N'Norry', N'Layborn', N'nlaybornn3@nationalgeographic.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (833, N'Valentine', N'Dowse', N'vdowsen4@cdc.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (834, N'Aluin', N'Densun', N'adensunn5@unesco.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (835, N'Hazel', N'Antoons', N'hantoonsn6@salon.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (836, N'Sadie', N'Wackett', N'swackettn7@youtube.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (837, N'Aldo', N'Squibb', N'asquibbn8@naver.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (838, N'Berta', N'Blose', N'bblosen9@indiegogo.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (839, N'Roarke', N'Scurrell', N'rscurrellna@opera.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (840, N'Prent', N'Adamsson', N'padamssonnb@cocolog-nifty.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (841, N'Charlie', N'Barensky', N'cbarenskync@vkontakte.ru', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (842, N'Kathye', N'Neiland', N'kneilandnd@mozilla.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (843, N'Ancell', N'Rasp', N'araspne@rediff.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (844, N'Fifi', N'Rouse', N'frousenf@mail.ru', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (845, N'Geralda', N'Cardenas', N'gcardenasng@naver.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (846, N'Sullivan', N'Childerley', N'schilderleynh@paypal.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (847, N'Carolann', N'Badland', N'cbadlandni@de.vu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (848, N'Monro', N'Coxen', N'mcoxennj@imgur.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (849, N'Damara', N'Pressdee', N'dpressdeenk@google.pl', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (850, N'Reta', N'Berthot', N'rberthotnl@slashdot.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (851, N'Bobbie', N'Valadez', N'bvaladeznm@bravesites.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (852, N'Logan', N'Bollands', N'lbollandsnn@si.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (853, N'Janith', N'Holt', N'jholtno@1688.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (854, N'Rube', N'Delucia', N'rdelucianp@noaa.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (855, N'Jedediah', N'Sanper', N'jsanpernq@lycos.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (856, N'Lorrie', N'Kobu', N'lkobunr@usda.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (857, N'Doll', N'O''Kieran', N'dokieranns@skyrock.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (858, N'Edvard', N'Paddison', N'epaddisonnt@posterous.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (859, N'Sandro', N'Rozanski', N'srozanskinu@studiopress.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (860, N'Ynez', N'Sneesbie', N'ysneesbienv@nhs.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (861, N'Isabella', N'Decort', N'idecortnw@storify.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (862, N'Francklin', N'Pedreschi', N'fpedreschinx@goo.ne.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (863, N'Chloris', N'Gregersen', N'cgregersenny@mapquest.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (864, N'Baird', N'Partkya', N'bpartkyanz@ezinearticles.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (865, N'Cloris', N'Veryard', N'cveryardo0@domainmarket.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (866, N'Danit', N'Danell', N'ddanello1@behance.net', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (867, N'Durward', N'Ninnotti', N'dninnottio2@msn.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (868, N'Hilton', N'Croughan', N'hcroughano3@java.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (869, N'Sammy', N'Slavin', N'sslavino4@facebook.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (870, N'Shir', N'Spendley', N'sspendleyo5@alexa.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (871, N'Eulalie', N'Simcock', N'esimcocko6@cornell.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (872, N'Claude', N'Gossan', N'cgossano7@purevolume.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (873, N'Tonnie', N'Vass', N'tvasso8@yellowpages.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (874, N'Akim', N'Frayne', N'afrayneo9@fotki.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (875, N'Tansy', N'Minihane', N'tminihaneoa@taobao.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (876, N'Shelley', N'Valerio', N'svalerioob@xinhuanet.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (878, N'Vince', N'McKilroe', N'vmckilroeod@people.com.cn', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (879, N'Abbott', N'Tinwell', N'atinwelloe@un.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (880, N'Klemens', N'Skate', N'kskateof@cnbc.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (881, N'Shannah', N'Petracchi', N'spetracchiog@forbes.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (882, N'Lothaire', N'Dermott', N'ldermottoh@shinystat.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (883, N'Inga', N'Bremond', N'ibremondoi@multiply.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (884, N'Irvin', N'Shemilt', N'ishemiltoj@technorati.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (885, N'Aldon', N'Lambden', N'alambdenok@webs.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (886, N'Mike', N'Housley', N'mhousleyol@google.nl', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (887, N'Warren', N'Pobjay', N'wpobjayom@icq.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (888, N'Pavlov', N'Rignall', N'prignallon@cnbc.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (889, N'Carlina', N'Pidgeon', N'cpidgeonoo@gnu.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (890, N'Eleonore', N'Champken', N'echampkenop@newsvine.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (892, N'Bay', N'Mumm', N'bmummor@comcast.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (893, N'Dredi', N'Doneld', N'ddoneldos@infoseek.co.jp', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (894, N'Lindsey', N'Grisley', N'lgrisleyot@mayoclinic.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (895, N'Arnie', N'Luchetti', N'aluchettiou@surveymonkey.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (896, N'Adey', N'Jago', N'ajagoov@yale.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (897, N'Gabe', N'Huton', N'ghutonow@mozilla.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (898, N'Bevvy', N'Oscroft', N'boscroftox@apache.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (899, N'Marla', N'Dampier', N'mdampieroy@delicious.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (900, N'Franky', N'Criag', N'fcriagoz@house.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (901, N'Jose', N'Isacsson', N'jisacssonp0@miibeian.gov.cn', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (902, N'Stella', N'MacAfee', N'smacafeep1@tumblr.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (903, N'Obadias', N'Spellecy', N'ospellecyp2@europa.eu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (904, N'Jeramie', N'Brooks', N'jbrooksp3@dell.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (905, N'Emmott', N'Tym', N'etymp4@epa.gov', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (906, N'Stearne', N'Cowdery', N'scowderyp5@fc2.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (907, N'Ray', N'Cline', N'rclinep6@npr.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (908, N'Michaelina', N'Keddey', N'mkeddeyp7@chicagotribune.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (909, N'Orelia', N'Orrow', N'oorrowp8@taobao.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (910, N'Raffaello', N'Cockrill', N'rcockrillp9@statcounter.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (911, N'Barnard', N'Shevlane', N'bshevlanepa@twitpic.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (912, N'Frank', N'Redmond', N'fredmondpb@posterous.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (913, N'Georgetta', N'Massie', N'gmassiepc@irs.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (914, N'Xavier', N'Yurtsev', N'xyurtsevpd@paginegialle.it', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (915, N'Clarie', N'McPeice', N'cmcpeicepe@vistaprint.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (916, N'Travers', N'Shearme', N'tshearmepf@dyndns.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (917, N'Deedee', N'Claworth', N'dclaworthpg@github.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (918, N'Pamelina', N'Bradfield', N'pbradfieldph@meetup.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (919, N'Florance', N'Krolle', N'fkrollepi@reddit.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (920, N'Larine', N'Machel', N'lmachelpj@cargocollective.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (921, N'Norma', N'Medgewick', N'nmedgewickpk@jiathis.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (922, N'Arielle', N'Lorking', N'alorkingpl@tripod.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (923, N'Axel', N'Bayly', N'abaylypm@imageshack.us', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (924, N'Briny', N'Glavin', N'bglavinpn@fotki.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (925, N'Larisa', N'Torricella', N'ltorricellapo@gmpg.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (926, N'Minne', N'Enterle', N'menterlepp@cbsnews.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (927, N'Dyane', N'Wavish', N'dwavishpq@usnews.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (928, N'Douglas', N'O''Sheerin', N'dosheerinpr@rakuten.co.jp', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (929, N'Hagan', N'Tranmer', N'htranmerps@sfgate.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (930, N'Carmelita', N'Mordey', N'cmordeypt@nhs.uk', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (931, N'Julee', N'Raggles', N'jragglespu@webeden.co.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (932, N'Kit', N'Magill', N'kmagillpv@angelfire.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (933, N'Collen', N'Hunter', N'chunterpw@economist.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (934, N'Olympia', N'Widdowson', N'owiddowsonpx@ask.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (935, N'Salim', N'Battrick', N'sbattrickpy@ehow.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (936, N'Fiann', N'Awdry', N'fawdrypz@tripadvisor.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (937, N'Doria', N'Goodwill', N'dgoodwillq0@facebook.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (938, N'Leonidas', N'Boyn', N'lboynq1@gov.uk', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (939, N'Tomkin', N'Carlino', N'tcarlinoq2@mozilla.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (940, N'Dre', N'Taw', N'dtawq3@springer.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (941, N'Alfy', N'Olivier', N'aolivierq4@senate.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (942, N'Cori', N'Longhorn', N'clonghornq5@scientificamerican.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (943, N'Aguste', N'Barkworth', N'abarkworthq6@blinklist.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (945, N'Natalya', N'Wolton', N'nwoltonq8@reference.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (946, N'Tomlin', N'Lapenna', N'tlapennaq9@cmu.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (947, N'Daven', N'Jakubovits', N'djakubovitsqa@creativecommons.org', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (948, N'Marinna', N'Miner', N'mminerqb@opera.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (950, N'Gussy', N'Billitteri', N'gbillitteriqd@nationalgeographic.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (951, N'Ileane', N'Howler', N'ihowlerqe@friendfeed.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (952, N'Candi', N'Snook', N'csnookqf@multiply.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (953, N'Josselyn', N'Sharvill', N'jsharvillqg@hhs.gov', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (954, N'Berne', N'Kennett', N'bkennettqh@indiegogo.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (955, N'Glenda', N'Duesberry', N'gduesberryqi@uol.com.br', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (956, N'Ewen', N'Callister', N'ecallisterqj@vimeo.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (957, N'Daphne', N'Pantlin', N'dpantlinqk@umn.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (958, N'Gale', N'Ginn', N'gginnql@shutterfly.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (959, N'Kelila', N'Petrakov', N'kpetrakovqm@bigcartel.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (960, N'Kial', N'Hallbird', N'khallbirdqn@booking.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (961, N'Garrard', N'McKibbin', N'gmckibbinqo@indiegogo.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (962, N'Larissa', N'Coston', N'lcostonqp@uol.com.br', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (963, N'Gilburt', N'Jeandel', N'gjeandelqq@sciencedaily.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (965, N'Demetra', N'Klemencic', N'dklemencicqs@psu.edu', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (966, N'Eduardo', N'Harsnep', N'eharsnepqt@soup.io', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (967, N'Witty', N'Alderwick', N'walderwickqu@scribd.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (968, N'Justinian', N'Thirlwell', N'jthirlwellqv@cnn.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (969, N'Anatollo', N'Koene', N'akoeneqw@w3.org', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (970, N'Tallulah', N'Tidball', N'ttidballqx@tripod.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (971, N'Jada', N'Calken', N'jcalkenqy@tripod.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (972, N'Clarinda', N'Chaunce', N'cchaunceqz@jalbum.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (973, N'Savina', N'Pinard', N'spinardr0@google.com.au', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (974, N'Carena', N'Buttfield', N'cbuttfieldr1@bloglines.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (975, N'Minetta', N'Guilford', N'mguilfordr2@bloglovin.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (976, N'Melissa', N'Cahillane', N'mcahillaner3@histats.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (977, N'Anders', N'Helis', N'ahelisr4@discuz.net', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (978, N'Gretchen', N'Kelberer', N'gkelbererr5@newsvine.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (979, N'Mia', N'Ellacott', N'mellacottr6@nydailynews.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (980, N'Avrit', N'Brugsma', N'abrugsmar7@purevolume.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (981, N'Brigham', N'Gatchel', N'bgatchelr8@omniture.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (982, N'Rhea', N'Bayliss', N'rbaylissr9@gizmodo.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (983, N'Elisha', N'Lintot', N'elintotra@sciencedaily.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (984, N'Cassi', N'Audrey', N'caudreyrb@deliciousdays.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (985, N'Prudi', N'Annear', N'pannearrc@reverbnation.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (986, N'Decca', N'Spong', N'dspongrd@unc.edu', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (987, N'Brockie', N'Newlyn', N'bnewlynre@mysql.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (988, N'Sybilla', N'Goodwins', N'sgoodwinsrf@blogger.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (989, N'Lawry', N'Kennard', N'lkennardrg@live.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (990, N'Worthington', N'Ambrogelli', N'wambrogellirh@squidoo.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (991, N'Marissa', N'Bruffell', N'mbruffellri@columbia.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (992, N'Hyman', N'Benger', N'hbengerrj@dropbox.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (993, N'Glynda', N'Feakins', N'gfeakinsrk@ca.gov', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (994, N'Swen', N'Kitchen', N'skitchenrl@wiley.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (995, N'Nichol', N'Mougeot', N'nmougeotrm@ebay.com', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (996, N'Helen-elizabeth', N'Sterrie', N'hsterriern@ibm.com', 1)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (997, N'Alvy', N'Bettenson', N'abettensonro@uiuc.edu', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (998, N'Sigismondo', N'Preator', N'spreatorrp@creativecommons.org', 2)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (999, N'Lannie', N'MacCaughey', N'lmaccaugheyrq@ibm.com', 3)
GO
INSERT [dbo].[cliente] ([id], [nombre], [apellido], [email], [provincia_id]) VALUES (1000, N'Claretta', N'Marcos', N'cmarcosrr@twitter.com', 3)
GO
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[pedido] ON 
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (1, CAST(N'2021-12-10' AS Date), CAST(41 AS Numeric(18, 0)), 40)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (2, CAST(N'2022-05-22' AS Date), CAST(48 AS Numeric(18, 0)), 37)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (3, CAST(N'2021-11-03' AS Date), CAST(20 AS Numeric(18, 0)), 54)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (4, CAST(N'2022-04-15' AS Date), CAST(7 AS Numeric(18, 0)), 21)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (5, CAST(N'2021-10-18' AS Date), CAST(49 AS Numeric(18, 0)), 79)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (7, CAST(N'2021-08-27' AS Date), CAST(35 AS Numeric(18, 0)), 94)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (8, CAST(N'2022-01-21' AS Date), CAST(77 AS Numeric(18, 0)), 61)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (9, CAST(N'2022-04-26' AS Date), CAST(93 AS Numeric(18, 0)), 92)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (10, CAST(N'2022-02-03' AS Date), CAST(90 AS Numeric(18, 0)), 85)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (11, CAST(N'2022-03-30' AS Date), CAST(18 AS Numeric(18, 0)), 41)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (12, CAST(N'2021-11-29' AS Date), CAST(91 AS Numeric(18, 0)), 28)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (13, CAST(N'2022-02-06' AS Date), CAST(90 AS Numeric(18, 0)), 80)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (14, CAST(N'2021-07-09' AS Date), CAST(23 AS Numeric(18, 0)), 27)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (15, CAST(N'2021-11-02' AS Date), CAST(83 AS Numeric(18, 0)), 33)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (16, CAST(N'2021-09-25' AS Date), CAST(92 AS Numeric(18, 0)), 41)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (17, CAST(N'2021-07-04' AS Date), CAST(83 AS Numeric(18, 0)), 52)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (18, CAST(N'2022-04-28' AS Date), CAST(78 AS Numeric(18, 0)), 37)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (19, CAST(N'2022-04-23' AS Date), CAST(83 AS Numeric(18, 0)), 35)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (20, CAST(N'2021-12-27' AS Date), CAST(9 AS Numeric(18, 0)), 12)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (21, CAST(N'2022-06-08' AS Date), CAST(75 AS Numeric(18, 0)), 44)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (22, CAST(N'2022-04-02' AS Date), CAST(7 AS Numeric(18, 0)), 24)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (23, CAST(N'2021-11-26' AS Date), CAST(77 AS Numeric(18, 0)), 72)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (24, CAST(N'2021-11-12' AS Date), CAST(62 AS Numeric(18, 0)), 92)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (25, CAST(N'2021-09-15' AS Date), CAST(64 AS Numeric(18, 0)), 20)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (26, CAST(N'2022-03-25' AS Date), CAST(19 AS Numeric(18, 0)), 86)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (27, CAST(N'2022-02-07' AS Date), CAST(56 AS Numeric(18, 0)), 92)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (28, CAST(N'2022-01-14' AS Date), CAST(80 AS Numeric(18, 0)), 79)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (29, CAST(N'2021-07-13' AS Date), CAST(98 AS Numeric(18, 0)), 56)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (30, CAST(N'2021-12-19' AS Date), CAST(21 AS Numeric(18, 0)), 81)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (31, CAST(N'2022-02-11' AS Date), CAST(14 AS Numeric(18, 0)), 20)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (32, CAST(N'2022-05-20' AS Date), CAST(5 AS Numeric(18, 0)), 95)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (33, CAST(N'2022-06-26' AS Date), CAST(11 AS Numeric(18, 0)), 87)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (34, CAST(N'2022-02-28' AS Date), CAST(82 AS Numeric(18, 0)), 90)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (35, CAST(N'2022-02-02' AS Date), CAST(88 AS Numeric(18, 0)), 89)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (36, CAST(N'2022-05-04' AS Date), CAST(42 AS Numeric(18, 0)), 74)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (37, CAST(N'2021-11-17' AS Date), CAST(67 AS Numeric(18, 0)), 20)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (38, CAST(N'2022-06-14' AS Date), CAST(91 AS Numeric(18, 0)), 85)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (39, CAST(N'2022-06-19' AS Date), CAST(2 AS Numeric(18, 0)), 61)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (40, CAST(N'2022-02-21' AS Date), CAST(89 AS Numeric(18, 0)), 97)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (41, CAST(N'2022-03-08' AS Date), CAST(71 AS Numeric(18, 0)), 40)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (42, CAST(N'2021-10-01' AS Date), CAST(94 AS Numeric(18, 0)), 49)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (43, CAST(N'2021-07-15' AS Date), CAST(65 AS Numeric(18, 0)), 1)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (44, CAST(N'2022-02-21' AS Date), CAST(65 AS Numeric(18, 0)), 58)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (45, CAST(N'2021-07-21' AS Date), CAST(69 AS Numeric(18, 0)), 48)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (46, CAST(N'2022-02-12' AS Date), CAST(11 AS Numeric(18, 0)), 11)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (47, CAST(N'2021-07-26' AS Date), CAST(91 AS Numeric(18, 0)), 45)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (48, CAST(N'2022-01-02' AS Date), CAST(87 AS Numeric(18, 0)), 43)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (49, CAST(N'2021-10-07' AS Date), CAST(22 AS Numeric(18, 0)), 66)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (50, CAST(N'2021-11-22' AS Date), CAST(61 AS Numeric(18, 0)), 29)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (51, CAST(N'2022-06-19' AS Date), CAST(89 AS Numeric(18, 0)), 25)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (52, CAST(N'2021-12-23' AS Date), CAST(38 AS Numeric(18, 0)), 48)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (53, CAST(N'2021-10-18' AS Date), CAST(93 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (54, CAST(N'2022-03-21' AS Date), CAST(69 AS Numeric(18, 0)), 54)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (55, CAST(N'2022-06-04' AS Date), CAST(12 AS Numeric(18, 0)), 10)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (56, CAST(N'2021-10-09' AS Date), CAST(57 AS Numeric(18, 0)), 47)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (57, CAST(N'2021-06-27' AS Date), CAST(92 AS Numeric(18, 0)), 79)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (58, CAST(N'2022-05-15' AS Date), CAST(32 AS Numeric(18, 0)), 59)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (59, CAST(N'2022-02-24' AS Date), CAST(6 AS Numeric(18, 0)), 11)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (60, CAST(N'2021-10-24' AS Date), CAST(13 AS Numeric(18, 0)), 14)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (61, CAST(N'2021-08-13' AS Date), CAST(68 AS Numeric(18, 0)), 52)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (62, CAST(N'2021-09-19' AS Date), CAST(57 AS Numeric(18, 0)), 64)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (63, CAST(N'2021-12-17' AS Date), CAST(71 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (64, CAST(N'2021-10-11' AS Date), CAST(31 AS Numeric(18, 0)), 45)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (65, CAST(N'2022-05-06' AS Date), CAST(92 AS Numeric(18, 0)), 25)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (66, CAST(N'2022-01-06' AS Date), CAST(62 AS Numeric(18, 0)), 60)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (67, CAST(N'2021-10-10' AS Date), CAST(11 AS Numeric(18, 0)), 47)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (68, CAST(N'2022-01-06' AS Date), CAST(87 AS Numeric(18, 0)), 63)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (69, CAST(N'2021-12-12' AS Date), CAST(57 AS Numeric(18, 0)), 59)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (70, CAST(N'2022-04-22' AS Date), CAST(96 AS Numeric(18, 0)), 11)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (71, CAST(N'2022-03-13' AS Date), CAST(19 AS Numeric(18, 0)), 56)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (72, CAST(N'2021-12-08' AS Date), CAST(73 AS Numeric(18, 0)), 55)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (73, CAST(N'2022-01-21' AS Date), CAST(90 AS Numeric(18, 0)), 95)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (75, CAST(N'2022-05-28' AS Date), CAST(95 AS Numeric(18, 0)), 14)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (76, CAST(N'2022-06-06' AS Date), CAST(79 AS Numeric(18, 0)), 52)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (77, CAST(N'2022-01-15' AS Date), CAST(48 AS Numeric(18, 0)), 87)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (78, CAST(N'2021-09-24' AS Date), CAST(26 AS Numeric(18, 0)), 29)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (79, CAST(N'2022-03-23' AS Date), CAST(82 AS Numeric(18, 0)), 24)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (80, CAST(N'2021-12-22' AS Date), CAST(14 AS Numeric(18, 0)), 22)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (81, CAST(N'2021-08-13' AS Date), CAST(89 AS Numeric(18, 0)), 67)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (82, CAST(N'2022-03-10' AS Date), CAST(93 AS Numeric(18, 0)), 46)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (83, CAST(N'2021-09-07' AS Date), CAST(7 AS Numeric(18, 0)), 65)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (84, CAST(N'2021-11-11' AS Date), CAST(80 AS Numeric(18, 0)), 81)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (85, CAST(N'2021-08-22' AS Date), CAST(76 AS Numeric(18, 0)), 37)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (86, CAST(N'2022-06-02' AS Date), CAST(88 AS Numeric(18, 0)), 98)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (87, CAST(N'2021-09-05' AS Date), CAST(70 AS Numeric(18, 0)), 29)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (88, CAST(N'2022-04-13' AS Date), CAST(77 AS Numeric(18, 0)), 66)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (89, CAST(N'2022-04-14' AS Date), CAST(14 AS Numeric(18, 0)), 29)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (90, CAST(N'2022-03-28' AS Date), CAST(81 AS Numeric(18, 0)), 18)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (91, CAST(N'2021-10-22' AS Date), CAST(29 AS Numeric(18, 0)), 49)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (92, CAST(N'2021-09-01' AS Date), CAST(73 AS Numeric(18, 0)), 30)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (93, CAST(N'2021-10-01' AS Date), CAST(47 AS Numeric(18, 0)), 56)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (94, CAST(N'2021-11-14' AS Date), CAST(79 AS Numeric(18, 0)), 37)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (95, CAST(N'2021-09-05' AS Date), CAST(74 AS Numeric(18, 0)), 53)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (96, CAST(N'2022-01-04' AS Date), CAST(45 AS Numeric(18, 0)), 80)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (97, CAST(N'2021-07-18' AS Date), CAST(47 AS Numeric(18, 0)), 88)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (98, CAST(N'2021-12-04' AS Date), CAST(2 AS Numeric(18, 0)), 15)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (99, CAST(N'2021-11-24' AS Date), CAST(86 AS Numeric(18, 0)), 11)
GO
INSERT [dbo].[pedido] ([id], [fecha], [descuento], [cliente_id]) VALUES (100, CAST(N'2021-12-19' AS Date), CAST(91 AS Numeric(18, 0)), 74)
GO
SET IDENTITY_INSERT [dbo].[pedido] OFF
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (1, 14, 6, CAST(19 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (1, 22, 4, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (1, 29, 7, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (1, 67, 2, CAST(58 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (2, 39, 2, CAST(36 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (2, 53, 6, CAST(74 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (2, 63, 5, CAST(46 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (2, 67, 3, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (2, 85, 5, CAST(77 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (2, 93, 2, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (2, 95, 7, CAST(58 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (3, 4, 9, CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (3, 40, 5, CAST(82 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (3, 46, 9, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (3, 49, 3, CAST(3 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (3, 60, 2, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (3, 73, 6, CAST(77 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (3, 74, 1, CAST(61 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (3, 80, 8, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (3, 98, 10, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (4, 12, 8, CAST(30 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (4, 13, 10, CAST(82 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (4, 20, 4, CAST(53 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (4, 52, 8, CAST(64 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (4, 60, 9, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (4, 63, 7, CAST(10 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (4, 82, 10, CAST(41 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (4, 88, 8, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (4, 90, 3, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (4, 98, 8, CAST(46 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (5, 11, 10, CAST(62 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (5, 26, 4, CAST(38 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (5, 31, 8, CAST(94 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (5, 38, 3, CAST(88 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (5, 45, 7, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (5, 49, 5, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (5, 94, 4, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (5, 95, 7, CAST(84 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (5, 96, 8, CAST(53 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (7, 3, 3, CAST(34 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (7, 4, 7, CAST(66 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (7, 7, 5, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (7, 10, 8, CAST(51 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (7, 17, 8, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (7, 25, 9, CAST(84 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (7, 43, 9, CAST(50 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (7, 70, 10, CAST(58 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (7, 79, 8, CAST(28 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (7, 93, 2, CAST(65 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (8, 5, 6, CAST(31 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (8, 57, 9, CAST(74 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (8, 77, 6, CAST(51 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (8, 79, 1, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (8, 85, 10, CAST(94 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (8, 89, 3, CAST(34 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (9, 5, 3, CAST(21 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (9, 19, 10, CAST(66 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (9, 22, 9, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (9, 28, 9, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (9, 29, 6, CAST(44 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (9, 46, 7, CAST(92 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (9, 57, 10, CAST(89 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (9, 73, 7, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (10, 9, 7, CAST(87 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (10, 39, 2, CAST(59 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (10, 59, 2, CAST(98 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (10, 75, 6, CAST(77 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (10, 82, 8, CAST(42 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (10, 91, 1, CAST(90 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (11, 17, 6, CAST(26 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (11, 41, 10, CAST(2 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (11, 45, 6, CAST(28 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (11, 46, 1, CAST(94 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (11, 47, 10, CAST(67 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (11, 60, 4, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (11, 70, 4, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (11, 74, 4, CAST(47 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (11, 79, 3, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (11, 84, 10, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (11, 85, 2, CAST(33 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (12, 8, 8, CAST(15 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (12, 19, 5, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (12, 47, 1, CAST(13 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (12, 50, 5, CAST(28 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (12, 58, 5, CAST(27 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (12, 59, 8, CAST(84 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (12, 78, 5, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (12, 79, 4, CAST(51 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (12, 81, 10, CAST(11 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (12, 92, 4, CAST(64 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (12, 98, 10, CAST(39 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 5, 7, CAST(16 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 22, 1, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 31, 6, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 37, 8, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 41, 2, CAST(37 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 45, 9, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 58, 8, CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 64, 3, CAST(35 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 68, 2, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 76, 6, CAST(62 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 81, 4, CAST(88 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 85, 5, CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (13, 87, 7, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (14, 13, 1, CAST(68 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (14, 27, 8, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (14, 46, 8, CAST(59 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (14, 49, 9, CAST(85 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (14, 53, 4, CAST(74 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (14, 59, 10, CAST(34 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (14, 65, 1, CAST(86 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (14, 75, 9, CAST(99 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (14, 78, 5, CAST(33 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (14, 99, 1, CAST(90 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 3, 2, CAST(99 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 6, 10, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 7, 1, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 16, 7, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 23, 7, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 33, 7, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 38, 9, CAST(34 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 71, 4, CAST(35 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 75, 1, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 77, 3, CAST(41 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 79, 6, CAST(31 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 82, 9, CAST(53 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 90, 3, CAST(93 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 93, 5, CAST(14 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 94, 6, CAST(63 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (15, 99, 1, CAST(76 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (16, 16, 3, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (16, 23, 7, CAST(62 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (16, 50, 7, CAST(35 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (16, 52, 10, CAST(7 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (16, 70, 4, CAST(61 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (17, 11, 2, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (17, 60, 5, CAST(92 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (17, 61, 9, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (17, 64, 8, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (17, 65, 10, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (17, 72, 8, CAST(26 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (17, 73, 1, CAST(11 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (17, 74, 3, CAST(53 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (17, 92, 3, CAST(11 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (17, 97, 7, CAST(59 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (18, 10, 4, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (18, 20, 1, CAST(44 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (18, 24, 3, CAST(2 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (18, 40, 7, CAST(92 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (18, 45, 9, CAST(26 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (18, 46, 4, CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (18, 70, 5, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (18, 73, 10, CAST(41 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (18, 96, 1, CAST(78 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (19, 17, 6, CAST(33 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (19, 22, 7, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (19, 32, 5, CAST(53 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (19, 45, 5, CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (19, 54, 6, CAST(44 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (19, 89, 8, CAST(46 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (19, 90, 9, CAST(7 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 8, 1, CAST(17 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 9, 8, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 15, 8, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 24, 8, CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 40, 10, CAST(97 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 42, 3, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 45, 3, CAST(57 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 52, 6, CAST(34 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 59, 5, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 66, 2, CAST(62 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 69, 2, CAST(40 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 72, 8, CAST(48 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 74, 9, CAST(46 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 76, 7, CAST(16 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (20, 89, 6, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (21, 13, 6, CAST(95 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (21, 14, 4, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (21, 27, 2, CAST(99 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (21, 40, 9, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (21, 70, 4, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (21, 77, 9, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (21, 89, 9, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (22, 4, 9, CAST(61 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (22, 7, 4, CAST(51 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (22, 11, 2, CAST(34 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (22, 12, 6, CAST(76 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (22, 35, 5, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (22, 54, 3, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (22, 58, 3, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (22, 85, 5, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (22, 91, 3, CAST(66 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (22, 94, 10, CAST(41 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (23, 8, 4, CAST(41 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (23, 20, 7, CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (23, 28, 3, CAST(82 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (23, 49, 2, CAST(87 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (23, 62, 2, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (23, 82, 10, CAST(20 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (23, 98, 7, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (24, 2, 10, CAST(86 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (24, 5, 4, CAST(43 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (24, 26, 8, CAST(86 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (24, 83, 1, CAST(80 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (24, 88, 5, CAST(72 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (24, 90, 9, CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (25, 20, 6, CAST(22 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (25, 28, 10, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (25, 42, 9, CAST(2 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (25, 60, 1, CAST(68 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (25, 76, 2, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (25, 83, 10, CAST(90 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (25, 88, 6, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (25, 98, 10, CAST(37 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (26, 30, 1, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (26, 31, 8, CAST(80 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (26, 50, 8, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (26, 71, 10, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (26, 78, 7, CAST(80 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (26, 80, 10, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (26, 85, 5, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (26, 90, 7, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (26, 94, 7, CAST(74 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (26, 99, 7, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (27, 2, 7, CAST(61 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (27, 3, 8, CAST(50 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (27, 10, 9, CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (27, 11, 9, CAST(47 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (27, 69, 4, CAST(26 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (27, 79, 7, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (28, 3, 7, CAST(86 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (28, 38, 10, CAST(84 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (28, 46, 3, CAST(62 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (28, 48, 7, CAST(95 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (28, 52, 3, CAST(7 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (28, 60, 7, CAST(37 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (28, 78, 4, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (28, 80, 3, CAST(41 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (28, 89, 1, CAST(99 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (29, 16, 7, CAST(7 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (29, 31, 5, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (29, 62, 2, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (29, 70, 3, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (29, 81, 9, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (29, 95, 4, CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (29, 99, 1, CAST(94 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (30, 5, 2, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (30, 15, 4, CAST(20 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (30, 66, 10, CAST(20 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (30, 68, 10, CAST(66 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (30, 91, 3, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (31, 44, 10, CAST(50 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (31, 51, 8, CAST(23 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (31, 52, 4, CAST(28 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (31, 56, 10, CAST(23 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (31, 63, 6, CAST(94 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (31, 66, 9, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (31, 71, 4, CAST(95 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (32, 11, 6, CAST(15 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (32, 12, 9, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (32, 41, 9, CAST(22 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (32, 49, 1, CAST(42 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (32, 54, 10, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (32, 77, 4, CAST(65 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 13, 5, CAST(27 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 32, 1, CAST(97 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 34, 1, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 44, 1, CAST(99 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 45, 1, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 48, 7, CAST(3 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 62, 9, CAST(15 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 69, 5, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 72, 3, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 83, 2, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 90, 8, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (33, 91, 8, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (34, 28, 3, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (34, 48, 7, CAST(61 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (34, 58, 8, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (34, 87, 4, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (34, 92, 6, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (35, 39, 8, CAST(90 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (35, 41, 3, CAST(60 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (35, 58, 7, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (35, 82, 3, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (36, 6, 8, CAST(84 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (36, 7, 4, CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (36, 8, 9, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (36, 15, 2, CAST(51 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (36, 39, 1, CAST(42 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (36, 46, 6, CAST(88 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (36, 61, 6, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (36, 64, 3, CAST(30 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (36, 69, 4, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (36, 89, 5, CAST(88 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (37, 18, 7, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (37, 22, 8, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (37, 36, 8, CAST(76 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (37, 39, 1, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (37, 54, 10, CAST(51 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (37, 79, 9, CAST(11 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (37, 93, 5, CAST(26 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (38, 38, 5, CAST(98 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (38, 46, 1, CAST(86 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (38, 60, 10, CAST(31 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (38, 75, 9, CAST(11 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (38, 81, 9, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (38, 83, 6, CAST(88 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (38, 86, 3, CAST(57 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (38, 87, 9, CAST(96 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (39, 13, 2, CAST(21 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (39, 40, 3, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (39, 52, 5, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (39, 53, 8, CAST(42 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (39, 64, 8, CAST(57 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (39, 73, 2, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (39, 74, 9, CAST(27 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 5, 8, CAST(84 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 8, 2, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 10, 4, CAST(43 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 19, 2, CAST(61 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 20, 4, CAST(80 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 22, 3, CAST(86 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 28, 2, CAST(39 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 31, 2, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 42, 10, CAST(51 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 59, 5, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 61, 7, CAST(13 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 72, 5, CAST(59 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 75, 4, CAST(20 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 78, 10, CAST(94 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 80, 6, CAST(11 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 82, 6, CAST(41 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 84, 3, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 88, 2, CAST(98 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (40, 95, 7, CAST(89 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 8, 2, CAST(14 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 15, 7, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 17, 7, CAST(13 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 38, 7, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 41, 2, CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 46, 8, CAST(61 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 48, 9, CAST(87 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 50, 1, CAST(13 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 75, 3, CAST(96 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 78, 6, CAST(47 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 86, 3, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (41, 99, 10, CAST(57 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (42, 1, 2, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (42, 16, 5, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (42, 25, 2, CAST(67 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (42, 43, 2, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (42, 45, 7, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (42, 52, 5, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (42, 59, 1, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (42, 64, 5, CAST(68 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (42, 83, 6, CAST(89 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (42, 97, 7, CAST(17 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 4, 5, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 13, 9, CAST(81 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 23, 10, CAST(60 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 25, 5, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 27, 7, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 44, 2, CAST(50 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 64, 4, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 65, 2, CAST(72 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 86, 10, CAST(38 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 89, 9, CAST(33 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 93, 2, CAST(19 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (43, 94, 8, CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (44, 13, 5, CAST(37 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (44, 15, 3, CAST(22 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (44, 16, 8, CAST(64 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (44, 30, 2, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (44, 32, 6, CAST(97 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (44, 35, 4, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (44, 48, 2, CAST(21 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (44, 68, 9, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (44, 81, 6, CAST(13 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (45, 3, 10, CAST(92 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (45, 13, 8, CAST(3 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (45, 15, 8, CAST(96 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (45, 21, 5, CAST(95 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (45, 24, 2, CAST(84 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (45, 38, 4, CAST(10 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (45, 44, 2, CAST(96 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (45, 49, 1, CAST(2 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (45, 54, 3, CAST(68 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (45, 77, 4, CAST(40 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (45, 99, 2, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (46, 3, 7, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (46, 14, 5, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (46, 31, 1, CAST(78 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (46, 32, 4, CAST(86 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (46, 63, 10, CAST(95 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (46, 85, 3, CAST(46 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (46, 88, 10, CAST(77 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (47, 12, 1, CAST(39 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (47, 16, 7, CAST(35 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (47, 26, 2, CAST(30 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (47, 63, 8, CAST(23 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (47, 83, 2, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (48, 3, 10, CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (48, 41, 10, CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (48, 42, 8, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (48, 48, 8, CAST(93 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (48, 68, 6, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (48, 77, 3, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 4, 9, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 8, 4, CAST(42 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 20, 10, CAST(12 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 24, 5, CAST(66 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 26, 4, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 27, 6, CAST(65 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 29, 9, CAST(15 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 33, 5, CAST(99 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 34, 4, CAST(64 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 39, 1, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 40, 4, CAST(84 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 54, 1, CAST(2 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 56, 1, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 69, 8, CAST(81 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 75, 7, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (49, 89, 7, CAST(15 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (50, 8, 4, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (50, 27, 4, CAST(85 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (50, 30, 4, CAST(94 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (50, 35, 4, CAST(76 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (50, 50, 8, CAST(85 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (50, 55, 2, CAST(76 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (50, 64, 9, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (50, 65, 3, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (51, 4, 7, CAST(67 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (51, 13, 4, CAST(22 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (51, 32, 3, CAST(48 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (51, 34, 5, CAST(50 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (51, 41, 3, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (51, 42, 3, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (51, 50, 8, CAST(16 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (51, 66, 7, CAST(42 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (51, 77, 2, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (51, 88, 3, CAST(72 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 3, 8, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 11, 9, CAST(27 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 22, 10, CAST(14 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 30, 3, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 41, 7, CAST(64 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 43, 10, CAST(20 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 48, 10, CAST(15 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 50, 1, CAST(33 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 51, 7, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 54, 10, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 59, 6, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 64, 8, CAST(65 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 75, 7, CAST(46 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 77, 2, CAST(97 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (52, 83, 4, CAST(74 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (53, 4, 1, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (53, 14, 9, CAST(10 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (53, 25, 9, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (53, 58, 6, CAST(85 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (53, 78, 7, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (54, 4, 3, CAST(66 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (54, 22, 8, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (54, 32, 7, CAST(63 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (54, 48, 1, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (54, 53, 9, CAST(16 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (54, 54, 10, CAST(68 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (54, 69, 1, CAST(42 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (54, 88, 5, CAST(48 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (54, 89, 9, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (54, 97, 2, CAST(95 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (55, 1, 1, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (55, 2, 10, CAST(97 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (55, 4, 4, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (55, 27, 3, CAST(77 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (55, 55, 1, CAST(37 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (55, 59, 4, CAST(11 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (55, 84, 2, CAST(37 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (55, 93, 5, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (56, 7, 4, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (56, 8, 1, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (56, 18, 6, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (56, 22, 6, CAST(44 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (56, 33, 2, CAST(87 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (56, 37, 6, CAST(89 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (56, 55, 1, CAST(85 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (56, 67, 7, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (56, 98, 7, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (56, 99, 6, CAST(94 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 16, 4, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 23, 7, CAST(36 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 24, 4, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 32, 2, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 33, 8, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 41, 1, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 45, 8, CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 46, 6, CAST(94 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 56, 6, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 60, 4, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 66, 4, CAST(10 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 76, 1, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 89, 9, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (57, 95, 3, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (58, 1, 1, CAST(11 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (58, 24, 10, CAST(3 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (58, 52, 2, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (58, 53, 6, CAST(65 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (58, 67, 6, CAST(96 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (58, 72, 9, CAST(97 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (58, 73, 2, CAST(51 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (58, 89, 5, CAST(84 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (58, 92, 9, CAST(35 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (59, 4, 3, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (59, 28, 1, CAST(57 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (59, 32, 2, CAST(96 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (59, 33, 6, CAST(14 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (59, 52, 2, CAST(19 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (59, 64, 9, CAST(44 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (59, 67, 2, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (59, 72, 9, CAST(57 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (59, 80, 6, CAST(82 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (59, 82, 6, CAST(14 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (59, 93, 6, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 4, 2, CAST(38 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 13, 1, CAST(77 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 22, 2, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 30, 5, CAST(89 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 42, 8, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 54, 8, CAST(60 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 57, 1, CAST(86 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 64, 5, CAST(3 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 65, 4, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 68, 4, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 74, 9, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (60, 84, 7, CAST(19 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (61, 5, 10, CAST(60 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (61, 11, 7, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (61, 22, 6, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (61, 39, 4, CAST(12 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (61, 58, 1, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (61, 81, 4, CAST(14 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (61, 82, 2, CAST(33 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (61, 92, 7, CAST(76 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (62, 12, 6, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (62, 26, 1, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (62, 32, 7, CAST(40 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (62, 59, 8, CAST(48 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (62, 65, 1, CAST(47 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (62, 77, 8, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (62, 82, 1, CAST(58 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (62, 96, 6, CAST(44 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (63, 4, 10, CAST(7 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (63, 13, 2, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (63, 18, 3, CAST(19 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (63, 27, 9, CAST(13 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (63, 30, 6, CAST(12 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (63, 31, 2, CAST(36 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (63, 39, 1, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (63, 64, 8, CAST(74 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (63, 75, 8, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (63, 77, 4, CAST(28 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (63, 78, 5, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 7, 7, CAST(48 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 17, 3, CAST(76 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 23, 2, CAST(62 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 29, 7, CAST(2 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 38, 6, CAST(12 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 42, 3, CAST(63 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 43, 2, CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 55, 4, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 57, 3, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 58, 7, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 63, 4, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 77, 4, CAST(74 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (64, 92, 5, CAST(16 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 11, 5, CAST(89 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 34, 3, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 46, 1, CAST(82 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 49, 3, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 53, 7, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 59, 8, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 63, 5, CAST(93 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 77, 5, CAST(82 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 80, 10, CAST(21 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 81, 1, CAST(60 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 88, 5, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (65, 90, 3, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 1, 3, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 6, 4, CAST(47 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 10, 9, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 15, 10, CAST(22 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 35, 7, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 39, 7, CAST(19 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 41, 7, CAST(36 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 48, 10, CAST(93 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 60, 1, CAST(81 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 72, 7, CAST(33 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 73, 6, CAST(87 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 81, 5, CAST(72 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (66, 98, 7, CAST(21 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 14, 5, CAST(90 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 36, 5, CAST(33 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 39, 3, CAST(47 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 49, 6, CAST(92 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 51, 2, CAST(61 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 65, 7, CAST(50 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 66, 9, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 71, 8, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 75, 9, CAST(98 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 76, 6, CAST(33 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 77, 3, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 80, 10, CAST(93 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 83, 3, CAST(38 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 90, 4, CAST(89 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 91, 2, CAST(68 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (67, 96, 8, CAST(65 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (68, 4, 1, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (68, 7, 6, CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (68, 12, 1, CAST(93 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (68, 22, 6, CAST(50 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (68, 39, 6, CAST(98 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (68, 40, 8, CAST(68 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (68, 41, 3, CAST(42 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (68, 59, 3, CAST(53 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (68, 66, 1, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (68, 76, 9, CAST(16 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (68, 90, 2, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (69, 11, 6, CAST(43 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (69, 13, 6, CAST(66 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (69, 21, 3, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (69, 27, 2, CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (69, 32, 4, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (69, 35, 5, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (69, 38, 5, CAST(39 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (69, 57, 7, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (69, 59, 6, CAST(84 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (69, 79, 4, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (70, 22, 8, CAST(34 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (70, 27, 2, CAST(4 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (70, 29, 1, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (70, 37, 1, CAST(89 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (70, 39, 6, CAST(90 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (70, 57, 4, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (70, 58, 6, CAST(66 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (70, 67, 5, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (70, 70, 7, CAST(59 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (70, 81, 7, CAST(34 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (71, 29, 1, CAST(78 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (71, 34, 4, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (71, 36, 4, CAST(87 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (71, 39, 7, CAST(74 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (71, 57, 7, CAST(96 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (71, 61, 1, CAST(40 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (71, 67, 1, CAST(36 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (71, 72, 4, CAST(42 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (71, 80, 6, CAST(50 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (72, 28, 1, CAST(81 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (72, 31, 5, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (72, 32, 5, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (72, 35, 7, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (72, 69, 9, CAST(76 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (72, 90, 6, CAST(63 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (72, 91, 1, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (73, 8, 9, CAST(47 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (73, 15, 9, CAST(14 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (73, 16, 9, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (73, 24, 4, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (73, 27, 9, CAST(43 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (73, 55, 10, CAST(44 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (73, 56, 6, CAST(53 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (73, 90, 7, CAST(80 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (73, 92, 9, CAST(46 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (73, 96, 8, CAST(39 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (75, 6, 5, CAST(67 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (75, 7, 6, CAST(82 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (75, 23, 10, CAST(47 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (75, 29, 9, CAST(64 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (75, 33, 1, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (75, 34, 6, CAST(61 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (75, 63, 3, CAST(7 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (75, 66, 1, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (75, 82, 6, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (75, 89, 3, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (75, 94, 8, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (76, 20, 2, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (76, 33, 7, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (76, 38, 3, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (76, 42, 3, CAST(61 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (76, 67, 4, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (76, 69, 6, CAST(22 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (76, 73, 7, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (76, 88, 8, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (76, 90, 10, CAST(59 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (76, 91, 10, CAST(35 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (77, 32, 2, CAST(35 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (77, 42, 8, CAST(92 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (77, 62, 5, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (77, 65, 4, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (77, 68, 1, CAST(19 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (77, 69, 2, CAST(64 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (77, 80, 9, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (77, 86, 4, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (78, 6, 8, CAST(64 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (78, 21, 10, CAST(19 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (78, 22, 7, CAST(85 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (78, 38, 9, CAST(15 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (78, 39, 8, CAST(80 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (78, 46, 8, CAST(14 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (78, 69, 1, CAST(16 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (78, 80, 6, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (78, 87, 4, CAST(69 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (78, 96, 1, CAST(86 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (78, 99, 2, CAST(66 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (79, 6, 6, CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (79, 18, 10, CAST(48 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (79, 22, 6, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (79, 26, 6, CAST(48 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (79, 33, 3, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (79, 34, 5, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (79, 39, 4, CAST(94 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (79, 79, 8, CAST(89 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (80, 9, 3, CAST(65 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (80, 18, 9, CAST(29 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (80, 29, 1, CAST(68 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (80, 48, 10, CAST(12 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (80, 59, 4, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (80, 66, 4, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (80, 67, 7, CAST(85 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (80, 72, 3, CAST(11 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (80, 85, 10, CAST(35 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (81, 9, 8, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (81, 16, 8, CAST(17 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (81, 39, 8, CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (81, 45, 3, CAST(16 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (81, 56, 8, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (81, 74, 4, CAST(23 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (81, 87, 5, CAST(3 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 11, 2, CAST(30 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 22, 7, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 26, 4, CAST(72 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 35, 7, CAST(38 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 36, 8, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 42, 5, CAST(50 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 50, 10, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 66, 6, CAST(32 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 67, 3, CAST(96 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 75, 2, CAST(61 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 81, 3, CAST(59 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 82, 2, CAST(72 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (82, 83, 6, CAST(25 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (83, 8, 8, CAST(2 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (83, 25, 7, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (83, 32, 4, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (83, 33, 1, CAST(19 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (83, 36, 3, CAST(48 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (83, 52, 6, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (83, 57, 7, CAST(98 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (83, 70, 3, CAST(68 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (83, 85, 7, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (84, 14, 5, CAST(28 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (84, 22, 3, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (84, 26, 6, CAST(64 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (84, 71, 5, CAST(40 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (84, 94, 5, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (84, 98, 9, CAST(23 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (85, 15, 5, CAST(43 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (85, 22, 8, CAST(13 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (85, 32, 1, CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (85, 34, 4, CAST(28 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (85, 44, 9, CAST(22 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (85, 61, 7, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (85, 74, 4, CAST(59 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (85, 80, 10, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (85, 93, 4, CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 3, 7, CAST(21 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 7, 8, CAST(11 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 46, 4, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 52, 5, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 54, 3, CAST(68 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 56, 8, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 57, 7, CAST(63 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 58, 10, CAST(99 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 76, 9, CAST(22 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 77, 7, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 87, 8, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (86, 98, 4, CAST(67 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 1, 8, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 18, 6, CAST(27 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 19, 8, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 20, 8, CAST(15 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 29, 6, CAST(36 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 30, 9, CAST(72 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 31, 6, CAST(17 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 32, 7, CAST(88 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 34, 6, CAST(64 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 45, 4, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 46, 3, CAST(28 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 51, 9, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 64, 4, CAST(89 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 79, 10, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (87, 97, 7, CAST(13 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (88, 13, 10, CAST(95 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (88, 16, 2, CAST(85 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (88, 37, 7, CAST(9 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (88, 73, 8, CAST(20 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (88, 83, 5, CAST(86 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (89, 26, 6, CAST(42 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (89, 42, 2, CAST(15 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (89, 45, 3, CAST(8 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (89, 52, 2, CAST(58 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (89, 56, 2, CAST(42 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (89, 72, 2, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (89, 86, 10, CAST(22 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (89, 89, 7, CAST(36 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 19, 4, CAST(22 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 23, 3, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 32, 7, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 43, 1, CAST(76 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 46, 7, CAST(12 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 52, 1, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 62, 9, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 73, 5, CAST(20 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 77, 2, CAST(57 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 84, 1, CAST(65 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 86, 8, CAST(87 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (90, 89, 2, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (91, 24, 2, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (91, 50, 7, CAST(56 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (91, 59, 8, CAST(41 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (91, 72, 8, CAST(80 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (91, 73, 10, CAST(30 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (91, 84, 8, CAST(97 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (92, 23, 9, CAST(78 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (92, 28, 5, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (92, 33, 8, CAST(96 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (92, 52, 10, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (92, 54, 2, CAST(20 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (92, 61, 7, CAST(40 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 2, 1, CAST(72 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 3, 6, CAST(57 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 4, 5, CAST(34 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 5, 9, CAST(50 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 35, 4, CAST(15 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 54, 5, CAST(37 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 55, 2, CAST(59 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 57, 10, CAST(19 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 58, 8, CAST(82 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 61, 4, CAST(57 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 98, 2, CAST(71 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (93, 99, 4, CAST(17 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (94, 1, 4, CAST(98 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (94, 3, 3, CAST(82 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (94, 19, 3, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (94, 39, 7, CAST(92 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (94, 56, 4, CAST(67 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (94, 61, 2, CAST(75 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (94, 83, 10, CAST(28 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (94, 90, 3, CAST(72 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (94, 93, 2, CAST(35 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (94, 96, 10, CAST(89 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 2, 3, CAST(77 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 7, 1, CAST(51 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 14, 2, CAST(78 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 17, 1, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 22, 4, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 63, 9, CAST(6 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 67, 10, CAST(17 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 94, 2, CAST(82 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 95, 9, CAST(38 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 97, 9, CAST(80 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 98, 3, CAST(62 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (95, 99, 3, CAST(14 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (96, 10, 7, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (96, 11, 5, CAST(17 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (96, 46, 8, CAST(19 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (96, 51, 8, CAST(39 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (96, 63, 4, CAST(12 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (96, 71, 1, CAST(53 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (96, 72, 8, CAST(83 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (96, 77, 3, CAST(91 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (96, 87, 4, CAST(80 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (97, 13, 3, CAST(66 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (97, 19, 4, CAST(5 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (97, 23, 10, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (97, 25, 3, CAST(3 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (97, 35, 8, CAST(90 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (97, 54, 5, CAST(92 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (97, 67, 2, CAST(77 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (97, 69, 6, CAST(46 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (97, 86, 5, CAST(12 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (97, 97, 8, CAST(87 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 3, 7, CAST(95 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 18, 8, CAST(43 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 20, 5, CAST(82 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 24, 1, CAST(45 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 29, 9, CAST(72 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 37, 7, CAST(99 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 54, 9, CAST(37 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 63, 7, CAST(49 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 64, 2, CAST(73 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 77, 4, CAST(52 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 85, 4, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 92, 1, CAST(36 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (98, 96, 8, CAST(54 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (99, 18, 8, CAST(43 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (99, 19, 7, CAST(44 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (99, 21, 4, CAST(81 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (99, 25, 1, CAST(66 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (99, 26, 7, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (99, 41, 7, CAST(95 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (99, 42, 6, CAST(70 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (99, 55, 7, CAST(24 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (99, 68, 7, CAST(18 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (99, 75, 4, CAST(55 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (99, 85, 10, CAST(60 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (100, 12, 2, CAST(14 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (100, 21, 1, CAST(79 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (100, 28, 5, CAST(81 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (100, 36, 8, CAST(1 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (100, 48, 8, CAST(100 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (100, 56, 3, CAST(7 AS Numeric(18, 0)))
GO
INSERT [dbo].[pedido_producto] ([pedido_id], [producto_id], [cantidad], [precio]) VALUES (100, 62, 9, CAST(6 AS Numeric(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[producto] ON 
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (1, N'voluptatem', CAST(3 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (2, N'tenetur', CAST(4 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (3, N'animi', CAST(6 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (4, N'repudiandae', CAST(9 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (5, N'explicabo', CAST(4 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (6, N'aliquid', CAST(5 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (7, N'illum', CAST(3 AS Numeric(18, 0)), 1)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (8, N'cum', CAST(3 AS Numeric(18, 0)), 5)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (9, N'voluptates', CAST(1 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (10, N'omnis', CAST(7 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (11, N'dolorum', CAST(1 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (12, N'fugit', CAST(1 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (13, N'molestiae', CAST(5 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (14, N'rem', CAST(6 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (15, N'ullam', CAST(1 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (16, N'ex', CAST(5 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (17, N'dolorem', CAST(1 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (18, N'illum', CAST(1 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (19, N'fugit', CAST(2 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (20, N'ut', CAST(1 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (21, N'iste', CAST(5 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (22, N'non', CAST(7 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (23, N'eos', CAST(9 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (24, N'nisi', CAST(1 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (25, N'aliquid', CAST(1 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (26, N'rerum', CAST(9 AS Numeric(18, 0)), 1)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (27, N'blanditiis', CAST(8 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (28, N'omnis', CAST(1 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (29, N'architecto', CAST(9 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (30, N'eligendi', CAST(5 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (31, N'enim', CAST(8 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (32, N'nobis', CAST(9 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (33, N'sint', CAST(1 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (34, N'doloremque', CAST(2 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (35, N'quasi', CAST(1 AS Numeric(18, 0)), 1)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (36, N'quos', CAST(5 AS Numeric(18, 0)), 5)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (37, N'eveniet', CAST(5 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (38, N'non', CAST(4 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (39, N'autem', CAST(7 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (40, N'animi', CAST(4 AS Numeric(18, 0)), 1)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (41, N'et', CAST(4 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (42, N'dicta', CAST(8 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (43, N'quam', CAST(1 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (44, N'quia', CAST(4 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (45, N'in', CAST(5 AS Numeric(18, 0)), 5)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (46, N'enim', CAST(3 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (47, N'omnis', CAST(4 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (48, N'aut', CAST(6 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (49, N'voluptate', CAST(4 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (50, N'fuga', CAST(8 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (51, N'odio', CAST(2 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (52, N'aut', CAST(9 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (53, N'cupiditate', CAST(7 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (54, N'laboriosam', CAST(4 AS Numeric(18, 0)), 5)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (55, N'fuga', CAST(5 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (56, N'debitis', CAST(3 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (57, N'iste', CAST(2 AS Numeric(18, 0)), 1)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (58, N'molestiae', CAST(5 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (59, N'provident', CAST(5 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (60, N'hic', CAST(4 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (61, N'qui', CAST(1 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (62, N'nostrum', CAST(8 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (63, N'esse', CAST(9 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (64, N'quos', CAST(3 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (65, N'reprehenderit', CAST(2 AS Numeric(18, 0)), 6)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (66, N'numquam', CAST(3 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (67, N'voluptatibus', CAST(4 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (68, N'consectetur', CAST(7 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (69, N'numquam', CAST(6 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (70, N'expedita', CAST(3 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (71, N'aspernatur', CAST(4 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (72, N'vitae', CAST(4 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (73, N'dolor', CAST(4 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (74, N'eligendi', CAST(5 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (75, N'dolor', CAST(8 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (76, N'assumenda', CAST(2 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (77, N'odio', CAST(3 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (78, N'quae', CAST(7 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (79, N'officiis', CAST(8 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (80, N'distinctio', CAST(4 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (81, N'est', CAST(9 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (82, N'voluptatem', CAST(8 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (83, N'expedita', CAST(6 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (84, N'aliquid', CAST(7 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (85, N'at', CAST(7 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (86, N'quibusdam', CAST(1 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (87, N'inventore', CAST(2 AS Numeric(18, 0)), 5)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (88, N'maxime', CAST(2 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (89, N'aperiam', CAST(7 AS Numeric(18, 0)), 5)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (90, N'quaerat', CAST(8 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (91, N'atque', CAST(3 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (92, N'libero', CAST(5 AS Numeric(18, 0)), 7)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (93, N'quia', CAST(1 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (94, N'sed', CAST(4 AS Numeric(18, 0)), 3)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (95, N'omnis', CAST(2 AS Numeric(18, 0)), 5)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (96, N'necessitatibus', CAST(1 AS Numeric(18, 0)), 2)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (97, N'et', CAST(6 AS Numeric(18, 0)), 8)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (98, N'occaecati', CAST(7 AS Numeric(18, 0)), 4)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (99, N'dolor', CAST(6 AS Numeric(18, 0)), 9)
GO
INSERT [dbo].[producto] ([id], [nombre], [precio], [stock]) VALUES (100, N'voluptatibus', CAST(5 AS Numeric(18, 0)), 9)
GO
SET IDENTITY_INSERT [dbo].[producto] OFF
GO
SET IDENTITY_INSERT [dbo].[provincia] ON 
GO
INSERT [dbo].[provincia] ([id], [nombre], [poblacion]) VALUES (1, N'Buenos Aires', 6000000)
GO
INSERT [dbo].[provincia] ([id], [nombre], [poblacion]) VALUES (2, N'Jujuy', 300000)
GO
INSERT [dbo].[provincia] ([id], [nombre], [poblacion]) VALUES (3, N'Chubut', 100000)
GO
INSERT [dbo].[provincia] ([id], [nombre], [poblacion]) VALUES (4, N'Neuquen', 500000)
GO
INSERT [dbo].[provincia] ([id], [nombre], [poblacion]) VALUES (6, N'Corrientes', 155000)
GO
INSERT [dbo].[provincia] ([id], [nombre], [poblacion]) VALUES (7, N'Tucumán', 333000)
GO
SET IDENTITY_INSERT [dbo].[provincia] OFF
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD FOREIGN KEY([provincia_id])
REFERENCES [dbo].[provincia] ([id])
GO
ALTER TABLE [dbo].[pedido]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[cliente] ([id])
GO
ALTER TABLE [dbo].[pedido_producto]  WITH CHECK ADD FOREIGN KEY([pedido_id])
REFERENCES [dbo].[pedido] ([id])
GO
ALTER TABLE [dbo].[pedido_producto]  WITH CHECK ADD FOREIGN KEY([producto_id])
REFERENCES [dbo].[producto] ([id])
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarProvincia]    Script Date: 6/29/2022 1:02:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertarProvincia] 
	-- Add the parameters for the stored procedure here
	@nombre varchar(50),
	@poblacion int,
	@new_id int OUTPUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO provincia (nombre, poblacion) VALUES
		(@nombre, @poblacion);
	SET @new_id = SCOPE_IDENTITY();
END
GO
USE [master]
GO
ALTER DATABASE [BaseDatosTest] SET  READ_WRITE 
GO
