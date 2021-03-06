/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [kodex]    Script Date: 2017-09-29 5:04:06 PM ******/
CREATE DATABASE [kodex]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'kodex', FILENAME = N'C:\Users\brian.koser\AppData\Local\Microsoft\SQL Server Management Studio\14.0\Databases\kodex.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'kodex_log', FILENAME = N'C:\Users\brian.koser\AppData\Local\Microsoft\SQL Server Management Studio\14.0\Databases\kodex_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [kodex] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [kodex].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [kodex] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [kodex] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [kodex] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [kodex] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [kodex] SET ARITHABORT OFF 
GO
ALTER DATABASE [kodex] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [kodex] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kodex] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kodex] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kodex] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [kodex] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kodex] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kodex] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kodex] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kodex] SET  ENABLE_BROKER 
GO
ALTER DATABASE [kodex] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kodex] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kodex] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [kodex] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kodex] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kodex] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kodex] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [kodex] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [kodex] SET  MULTI_USER 
GO
ALTER DATABASE [kodex] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [kodex] SET DB_CHAINING OFF 
GO
ALTER DATABASE [kodex] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [kodex] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [kodex] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [kodex] SET QUERY_STORE = OFF
GO
USE [kodex]
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
USE [kodex]
GO
/****** Object:  Table [dbo].[post]    Script Date: 2017-09-29 5:04:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[posttypeid] [tinyint] NOT NULL,
	[title] [nvarchar](128) NOT NULL,
	[slug] [varchar](64) NOT NULL,
	[url] [varchar](128) NOT NULL,
	[body] [nvarchar](max) NULL,
	[description] [nvarchar](256) NULL,
	[datepublished] [datetimeoffset](7) NULL,
	[datepublishedid] [tinyint] NULL,
	[datelastupdated] [datetimeoffset](7) NULL,
	[excerpt] [nvarchar](256) NULL,
	[imageurl] [varchar](1024) NULL,
	[ispublic] [bit] NOT NULL, 
	[previousall] [nvarchar](128) NULL,
	[nextall] [nvarchar](128) NULL,
	[previouscategory] [nvarchar](128) NULL,
	[nextcategory] [nvarchar](128) NULL,

	--[rating] [tinyint] NULL,
	--[boardgamegeekgameid] [int] NULL,
	--[boardgameboximageurl] [varchar](1024) NULL,
	--[moviereleaseyear] [tinyint] NULL,
	--[movieposturl] [varchar](1024) NULL,
	--[moviedateviewed] [date] NULL,
	--[themoviedburl] [varchar](1024) NULL,
	--[letterboxdmovieurl] [varchar](1024) NULL,
	--[letterboxdreviewurl] [varchar](1024) NULL,
	--[movieplatformid] [tinyint] NULL,
	--[noteurl] [varchar](1024) NULL,
	--[photoalbumbegindate] [date] NULL,
	--[photoalbumenddate] [date] NULL,
	--[photoalbumcdnfolderurl] [varchar](1024) NULL,
	--[photoalbumcdnzipurl] [varchar](1024) NULL,
	--[recipeyield] [nvarchar](64) NULL,
	--[recipecomments] [nvarchar](max) NULL,
	--[videourl] [varchar](1024) NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[posttype]    Script Date: 2017-09-29 5:04:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[posttype](
	[id] [tinyint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](32) NOT NULL,
	[name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_posttype] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([id], [title], [slug], [body], [description], [datepublished], [datepublishedid], [datelastupdated], [excerpt], [imageurl], [ispublic], [posttypeid], [rating], [boardgamegeekgameid], [boardgameboximageurl], [isaudiobook], [booktitle], [bookauthor], [isbn], [bookdatepublished], [bookcoverurl], [openlibraryurl], [goodreadsbookurl], [goodreadsreviewurl], [moviereleaseyear], [movieposturl], [moviedateviewed], [themoviedburl], [letterboxdmovieurl], [letterboxdreviewurl], [movieplatformid], [noteurl], [photoalbumbegindate], [photoalbumenddate], [photoalbumcdnfolderurl], [photoalbumcdnzipurl], [recipeyield], [recipecomments], [videourl]) VALUES (1, N'test', N'this-is-test', N'hello everyone', N'description', CAST(N'2017-09-26T00:00:00.0000000-05:00' AS DateTimeOffset), 1, CAST(N'2017-09-26T00:00:00.0000000-05:00' AS DateTimeOffset), N'excerpt', NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[post] ([id], [title], [slug], [body], [description], [datepublished], [datepublishedid], [datelastupdated], [excerpt], [imageurl], [ispublic], [posttypeid], [rating], [boardgamegeekgameid], [boardgameboximageurl], [isaudiobook], [booktitle], [bookauthor], [isbn], [bookdatepublished], [bookcoverurl], [openlibraryurl], [goodreadsbookurl], [goodreadsreviewurl], [moviereleaseyear], [movieposturl], [moviedateviewed], [themoviedburl], [letterboxdmovieurl], [letterboxdreviewurl], [movieplatformid], [noteurl], [photoalbumbegindate], [photoalbumenddate], [photoalbumcdnfolderurl], [photoalbumcdnzipurl], [recipeyield], [recipecomments], [videourl]) VALUES (2, N'book review', N'book-review', N'my book review', N'book description', CAST(N'2016-09-25T00:00:00.0000000-05:00' AS DateTimeOffset), 1, CAST(N'2016-09-25T00:00:00.0000000-05:00' AS DateTimeOffset), N'book excerpt', NULL, 1, 4, 4, NULL, NULL, NULL, N'My Book Title', N'Author', N'1234567890123', CAST(N'2014-01-01T00:00:00.0000000-06:00' AS DateTimeOffset), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[post] OFF
SET IDENTITY_INSERT [dbo].[posttype] ON 

INSERT [dbo].[posttype] ([id], [code], [name]) VALUES (1, N'post', N'Post')
INSERT [dbo].[posttype] ([id], [code], [name]) VALUES (2, N'review', N'Review')
INSERT [dbo].[posttype] ([id], [code], [name]) VALUES (3, N'boardgamereview', N'Board Game Review')
INSERT [dbo].[posttype] ([id], [code], [name]) VALUES (4, N'bookreview', N'Book Review')
INSERT [dbo].[posttype] ([id], [code], [name]) VALUES (5, N'moviereview', N'Movie Review')
INSERT [dbo].[posttype] ([id], [code], [name]) VALUES (6, N'note', N'Note')
INSERT [dbo].[posttype] ([id], [code], [name]) VALUES (7, N'photoalbum', N'Photo Album')
INSERT [dbo].[posttype] ([id], [code], [name]) VALUES (8, N'recipe', N'Recipe')
INSERT [dbo].[posttype] ([id], [code], [name]) VALUES (9, N'video', N'Video')
SET IDENTITY_INSERT [dbo].[posttype] OFF
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_posttype] FOREIGN KEY([posttypeid])
REFERENCES [dbo].[posttype] ([id])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_posttype]
GO



CREATE TABLE [dbo].[tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[description] [nvarchar](128) NULL,
 CONSTRAINT [PK_tag] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) ON [PRIMARY]
GO


CREATE TABLE  [dbo].[post_tag](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[postid] [int] NOT NULL,
	[tagid] [int] NOT NULL,
 CONSTRAINT [PK_posttags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[author](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](64) NOT NULL,
	[firstname] [nvarchar](32) NOT NULL,
	[bio] [nvarchar](256) NULL,
 CONSTRAINT [PK_author] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[post_author](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[postid] [int] NOT NULL,
	[authorid] [int] NOT NULL,
 CONSTRAINT [PK_postauthor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[site](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](64) NOT NULL,
	[url] [nvarchar](128) NOT NULL,
	[iconname] [nvarchar](64) NULL,
 CONSTRAINT [PK_site] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[author_site](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[authorid] [int] NOT NULL,
	[siteid] [int] NOT NULL,
 CONSTRAINT [PK_authorsite] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[book](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](256) NULL,
	[authorfirstname] [nvarchar](128) NULL,
	[authorlastname] [nvarchar](128) NULL,
	[isbn] [char](13) NULL,
	[datepublished] [datetimeoffset](7) NULL,
	[coverimageurl] [varchar](1024) NULL,
	[openlibraryurl] [varchar](1024) NULL,
	[goodreadsurl] [varchar](1024) NULL,
 CONSTRAINT [PK_book] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[bookrating](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[postid] [int] NOT NULL,
	[bookid] [int] NOT NULL,
	[rating] [tinyint] NULL,
	[startdate] [datetimeoffset](7) NULL,
	[enddate] [datetimeoffset](7) NULL,
	[goodreadsreviewurl] [varchar](1024) NULL,
CONSTRAINT [PK_bookrating] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[bookshelf](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[slug] [nvarchar](128) NOT NULL,
	[description] [nvarchar](256) NOT NULL,
CONSTRAINT [PK_bookshelf] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[book_bookshelf](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bookid] [int] NOT NULL,
	[bookshelfid] [int] NOT NULL,
CONSTRAINT [PK_book_bookshelf] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)
) ON [PRIMARY]
GO



USE [master]
GO
ALTER DATABASE [kodex] SET  READ_WRITE 
GO
