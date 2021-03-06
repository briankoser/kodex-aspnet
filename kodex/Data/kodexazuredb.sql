/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2014 (12.0.4237)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Database Engine Edition : Microsoft Azure SQL Database Edition
    Target Database Engine Type : Microsoft Azure SQL Database
*/
/****** Object:  Database [kodex]    Script Date: 2017-09-26 11:37:44 am ******/
CREATE DATABASE [kodex]  ;
GO
ALTER DATABASE [kodex] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [kodex] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [kodex] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [kodex] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [kodex] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [kodex] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [kodex] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [kodex] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [kodex] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [kodex] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [kodex] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [kodex] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [kodex] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [kodex] SET  MULTI_USER 
GO
/****** Object:  Table [dbo].[post]    Script Date: 2017-09-26 11:37:44 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](128) NOT NULL,
	[slug] [varchar](128) NOT NULL,
	[body] [nvarchar](max) NULL,
	[description] [nvarchar](256) NULL,
	[datepublished] [datetimeoffset](7) NULL,
	[datepublishedid] [tinyint] NULL,
	[datelastupdated] [datetimeoffset](7) NULL,
	[excerpt] [nvarchar](256) NULL,
	[imageurl] [varchar](1024) NULL,
	[ispublic] [bit] NOT NULL,
	[posttypeid] [tinyint] NOT NULL,
	[rating] [tinyint] NULL,
	[boardgamegeekgameid] [int] NULL,
	[boardgameboximageurl] [varchar](1024) NULL,
	[isaudiobook] [bit] NULL,
	[booktitle] [nvarchar](256) NULL,
	[bookauthor] [nvarchar](256) NULL,
	[isbn] [char](13) NULL,
	[bookdatepublished] [datetimeoffset](7) NULL,
	[bookcoverurl] [varchar](1024) NULL,
	[openlibraryurl] [varchar](1024) NULL,
	[goodreadsbookurl] [varchar](1024) NULL,
	[goodreadsreviewurl] [varchar](1024) NULL,
	[moviereleaseyear] [tinyint] NULL,
	[movieposturl] [varchar](1024) NULL,
	[moviedateviewed] [date] NULL,
	[themoviedburl] [varchar](1024) NULL,
	[letterboxdmovieurl] [varchar](1024) NULL,
	[letterboxdreviewurl] [varchar](1024) NULL,
	[movieplatformid] [tinyint] NULL,
	[noteurl] [varchar](1024) NULL,
	[photoalbumbegindate] [date] NULL,
	[photoalbumenddate] [date] NULL,
	[photoalbumcdnfolderurl] [varchar](1024) NULL,
	[photoalbumcdnzipurl] [varchar](1024) NULL,
	[recipeyield] [nvarchar](64) NULL,
	[recipecomments] [nvarchar](max) NULL,
	[videourl] [varchar](1024) NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Table [dbo].[posttype]    Script Date: 2017-09-26 11:37:44 am ******/
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
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)
GO
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
ALTER DATABASE [kodex] SET  READ_WRITE 
GO
