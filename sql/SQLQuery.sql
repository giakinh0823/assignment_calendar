USE [master]
GO
/****** Object:  Database [clife]    Script Date: 3/15/2022 3:39:21 PM ******/
CREATE DATABASE [clife]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clife', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\clife.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'clife_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\clife_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [clife] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clife].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clife] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clife] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clife] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clife] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clife] SET ARITHABORT OFF 
GO
ALTER DATABASE [clife] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [clife] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clife] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clife] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clife] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clife] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clife] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clife] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clife] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clife] SET  ENABLE_BROKER 
GO
ALTER DATABASE [clife] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clife] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clife] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clife] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clife] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clife] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clife] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clife] SET RECOVERY FULL 
GO
ALTER DATABASE [clife] SET  MULTI_USER 
GO
ALTER DATABASE [clife] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clife] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clife] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clife] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [clife] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [clife] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'clife', N'ON'
GO
ALTER DATABASE [clife] SET QUERY_STORE = OFF
GO
USE [clife]
GO
/****** Object:  Table [dbo].[action]    Script Date: 3/15/2022 3:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[action](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[feature] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[additional_calendar]    Script Date: 3/15/2022 3:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[additional_calendar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NULL,
	[overlap] [bit] NULL,
	[display] [varchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[isAllDay] [bit] NULL,
	[isHasEnd] [bit] NULL,
	[calendarId] [int] NULL,
	[statusId] [int] NULL,
	[categoryId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[calendar]    Script Date: 3/15/2022 3:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calendar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[color] [nvarchar](50) NULL,
	[userId] [int] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category_calendar]    Script Date: 3/15/2022 3:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_calendar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[event]    Script Date: 3/15/2022 3:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[event](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[description] [nvarchar](2000) NULL,
	[location] [nvarchar](1000) NULL,
	[updated_at] [datetime] NULL,
	[created_at] [datetime] NULL,
	[userId] [int] NULL,
	[additionalId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission]    Script Date: 3/15/2022 3:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permission_action]    Script Date: 3/15/2022 3:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permission_action](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[licensed] [bit] NOT NULL,
	[permissionId] [int] NULL,
	[actionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[status_calendar]    Script Date: 3/15/2022 3:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[status_calendar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 3/15/2022 3:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](255) NOT NULL,
	[password] [nvarchar](1000) NULL,
	[first_name] [nvarchar](255) NULL,
	[last_name] [nvarchar](255) NULL,
	[birthday] [date] NULL,
	[email] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](20) NULL,
	[gender] [bit] NULL,
	[is_super] [bit] NULL,
	[is_active] [bit] NULL,
	[permission] [nvarchar](255) NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[avatar] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_permission]    Script Date: 3/15/2022 3:39:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[licensed] [bit] NOT NULL,
	[userId] [int] NULL,
	[permissionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[action] ON 
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (1, N'Read user', N'READ', N'USER')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (2, N'Create user', N'CREATE', N'USER')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (3, N'Edit user', N'EDIT', N'USER')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (4, N'Delete user', N'DELETE', N'USER')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (5, N'Read category', N'READ', N'CATEGORY')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (6, N'Create category', N'CREATE', N'CATEGORY')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (7, N'Edit category', N'EDIT', N'CATEGORY')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (8, N'Delete category', N'DELETE', N'CATEGORY')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (9, N'Read calendar', N'READ', N'CALENDAR')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (10, N'Create calendar', N'CREATE', N'CALENDAR')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (11, N'Edit calendar', N'EDIT', N'CALENDAR')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (12, N'Delete calendar', N'DELETE', N'CALENDAR')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (13, N'Read Event', N'READ', N'EVENT')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (14, N'Create event', N'CREATE', N'EVENT')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (15, N'Edit event', N'EDIT', N'EVENT')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (16, N'Delete event', N'DELETE', N'EVENT')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (17, N'Read status', N'READ', N'STATUS')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (18, N'Create status', N'CREATE', N'STATUS')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (19, N'Edit status', N'EDIT', N'STATUS')
GO
INSERT [dbo].[action] ([id], [title], [code], [feature]) VALUES (20, N'Delete status', N'DELETE', N'STATUS')
GO
SET IDENTITY_INSERT [dbo].[action] OFF
GO
SET IDENTITY_INSERT [dbo].[additional_calendar] ON 
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (253, CAST(N'2022-03-12T03:45:00.000' AS DateTime), CAST(N'2022-03-12T03:50:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T03:39:43.590' AS DateTime), CAST(N'2022-03-12T03:39:43.590' AS DateTime), 0, 1, 40, 3, 1)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (254, CAST(N'2022-03-12T03:45:00.000' AS DateTime), CAST(N'2022-03-12T03:50:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T03:40:18.393' AS DateTime), CAST(N'2022-03-12T03:40:18.393' AS DateTime), 0, 1, 39, 3, 1)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (255, CAST(N'2022-03-12T03:45:00.000' AS DateTime), CAST(N'2022-03-12T03:50:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T03:40:55.327' AS DateTime), CAST(N'2022-03-12T03:40:55.327' AS DateTime), 0, 1, 39, 3, 1)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (256, CAST(N'2022-03-21T07:30:00.000' AS DateTime), CAST(N'2022-03-21T09:30:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:24:34.227' AS DateTime), CAST(N'2022-03-12T23:24:34.227' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (257, CAST(N'2022-03-21T09:10:00.000' AS DateTime), CAST(N'2022-03-21T22:40:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:25:21.380' AS DateTime), CAST(N'2022-03-12T23:25:21.380' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (258, CAST(N'2022-03-21T10:50:00.000' AS DateTime), CAST(N'2022-03-21T00:15:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:26:35.730' AS DateTime), CAST(N'2022-03-12T23:26:35.730' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (259, CAST(N'2022-03-22T07:30:00.000' AS DateTime), CAST(N'2022-03-22T09:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:27:42.117' AS DateTime), CAST(N'2022-03-12T23:27:42.117' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (260, CAST(N'2022-03-22T09:10:00.000' AS DateTime), CAST(N'2022-03-22T10:40:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:29:05.137' AS DateTime), CAST(N'2022-03-12T23:29:05.137' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (261, CAST(N'2022-03-23T07:30:00.000' AS DateTime), CAST(N'2022-03-23T09:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:30:20.947' AS DateTime), CAST(N'2022-03-12T23:30:20.947' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (262, CAST(N'2022-03-23T09:10:00.000' AS DateTime), CAST(N'2022-03-23T10:40:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:30:56.887' AS DateTime), CAST(N'2022-03-12T23:30:56.887' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (263, CAST(N'2022-03-23T09:50:00.000' AS DateTime), CAST(N'2022-03-23T00:15:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:32:07.457' AS DateTime), CAST(N'2022-03-12T23:32:07.457' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (264, CAST(N'2022-03-24T07:30:00.000' AS DateTime), CAST(N'2022-03-24T09:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:32:42.277' AS DateTime), CAST(N'2022-03-12T23:32:42.277' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (265, CAST(N'2022-03-25T07:30:00.000' AS DateTime), CAST(N'2022-03-25T09:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:33:26.437' AS DateTime), CAST(N'2022-03-12T23:33:26.437' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (266, CAST(N'2022-03-25T09:10:00.000' AS DateTime), CAST(N'2022-03-25T10:40:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:34:08.100' AS DateTime), CAST(N'2022-03-13T00:09:20.867' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (267, CAST(N'2022-03-25T10:50:00.000' AS DateTime), CAST(N'2022-03-25T12:15:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:35:07.670' AS DateTime), CAST(N'2022-03-13T00:07:35.247' AS DateTime), 0, 1, 41, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (268, CAST(N'2022-03-14T19:30:00.000' AS DateTime), CAST(N'2022-03-14T14:30:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:54:14.427' AS DateTime), CAST(N'2022-03-12T23:54:14.427' AS DateTime), 0, 1, 41, 1, 5)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (269, CAST(N'2022-03-17T19:30:00.000' AS DateTime), CAST(N'2022-03-18T22:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-12T23:58:47.667' AS DateTime), CAST(N'2022-03-12T23:58:47.667' AS DateTime), 0, 1, 44, 1, 3)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (270, CAST(N'2022-03-10T19:30:00.000' AS DateTime), CAST(N'2022-03-11T22:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-13T00:01:46.157' AS DateTime), CAST(N'2022-03-13T00:01:46.157' AS DateTime), 0, 1, 44, 1, 3)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (271, CAST(N'2022-03-09T19:30:00.000' AS DateTime), CAST(N'2022-03-09T22:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-13T00:06:03.097' AS DateTime), CAST(N'2022-03-13T00:06:03.097' AS DateTime), 0, 1, 41, 1, 5)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (272, CAST(N'2022-03-15T20:00:00.000' AS DateTime), CAST(N'2022-03-16T00:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-13T00:12:44.777' AS DateTime), CAST(N'2022-03-13T00:12:54.720' AS DateTime), 0, 1, 43, 1, 1)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (273, CAST(N'2022-03-16T20:00:00.000' AS DateTime), CAST(N'2022-03-16T23:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-13T00:16:26.987' AS DateTime), CAST(N'2022-03-14T20:15:32.980' AS DateTime), 0, 0, 43, 1, 1)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (274, CAST(N'2022-03-07T20:00:00.000' AS DateTime), CAST(N'2022-03-08T23:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-13T00:22:05.127' AS DateTime), CAST(N'2022-03-13T00:22:05.127' AS DateTime), 0, 1, 34, 1, 5)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (275, CAST(N'2022-02-28T02:30:00.000' AS DateTime), CAST(N'2022-03-04T02:30:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-15T00:06:10.453' AS DateTime), CAST(N'2022-03-15T00:07:35.500' AS DateTime), 0, 0, 41, 1, 3)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (276, CAST(N'2022-03-28T00:00:00.000' AS DateTime), CAST(N'2022-04-02T00:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-15T00:08:10.717' AS DateTime), CAST(N'2022-03-15T00:08:12.713' AS DateTime), 1, 0, 42, 1, 3)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (277, CAST(N'2022-03-20T00:08:00.000' AS DateTime), CAST(N'2022-03-20T17:13:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-15T00:08:51.437' AS DateTime), CAST(N'2022-03-15T00:11:59.903' AS DateTime), 0, 1, 34, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (278, CAST(N'2022-03-06T07:00:00.000' AS DateTime), CAST(N'1970-01-01T07:00:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-15T00:09:17.267' AS DateTime), CAST(N'2022-03-15T00:09:26.690' AS DateTime), 0, 0, 34, 1, 2)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (279, CAST(N'2022-03-13T13:14:00.000' AS DateTime), CAST(N'2022-03-13T20:18:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-15T00:14:01.037' AS DateTime), CAST(N'2022-03-15T00:14:03.327' AS DateTime), 0, 0, 43, 1, 1)
GO
INSERT [dbo].[additional_calendar] ([id], [start_date], [end_date], [overlap], [display], [created_at], [updated_at], [isAllDay], [isHasEnd], [calendarId], [statusId], [categoryId]) VALUES (280, CAST(N'2022-03-27T13:15:00.000' AS DateTime), CAST(N'2022-03-27T17:19:00.000' AS DateTime), 1, N'auto', CAST(N'2022-03-15T00:14:43.540' AS DateTime), CAST(N'2022-03-15T00:14:48.483' AS DateTime), 0, 0, 43, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[additional_calendar] OFF
GO
SET IDENTITY_INSERT [dbo].[calendar] ON 
GO
INSERT [dbo].[calendar] ([id], [name], [color], [userId], [created_at], [updated_at]) VALUES (34, N'Home', N'#E0211F', 1030, CAST(N'2022-03-12T03:33:41.777' AS DateTime), CAST(N'2022-03-12T03:33:41.777' AS DateTime))
GO
INSERT [dbo].[calendar] ([id], [name], [color], [userId], [created_at], [updated_at]) VALUES (38, N'Home', N'#000000', 1, CAST(N'2022-03-12T03:38:41.023' AS DateTime), CAST(N'2022-03-12T03:38:41.023' AS DateTime))
GO
INSERT [dbo].[calendar] ([id], [name], [color], [userId], [created_at], [updated_at]) VALUES (39, N'Coder', N'#0e63ec', 1, CAST(N'2022-03-12T03:38:46.760' AS DateTime), CAST(N'2022-03-12T03:39:11.967' AS DateTime))
GO
INSERT [dbo].[calendar] ([id], [name], [color], [userId], [created_at], [updated_at]) VALUES (40, N'FPT University', N'#e04f00', 1, CAST(N'2022-03-12T03:39:04.433' AS DateTime), CAST(N'2022-03-12T03:39:04.433' AS DateTime))
GO
INSERT [dbo].[calendar] ([id], [name], [color], [userId], [created_at], [updated_at]) VALUES (41, N'FPT University', N'#ff780a', 1030, CAST(N'2022-03-12T23:22:14.143' AS DateTime), CAST(N'2022-03-12T23:22:14.143' AS DateTime))
GO
INSERT [dbo].[calendar] ([id], [name], [color], [userId], [created_at], [updated_at]) VALUES (42, N'Company', N'#1713ec', 1030, CAST(N'2022-03-12T23:22:50.363' AS DateTime), CAST(N'2022-03-12T23:22:50.363' AS DateTime))
GO
INSERT [dbo].[calendar] ([id], [name], [color], [userId], [created_at], [updated_at]) VALUES (43, N'Đi chơi', N'#ec18be', 1030, CAST(N'2022-03-12T23:23:09.273' AS DateTime), CAST(N'2022-03-12T23:23:09.273' AS DateTime))
GO
INSERT [dbo].[calendar] ([id], [name], [color], [userId], [created_at], [updated_at]) VALUES (44, N'Lịch dạy', N'#06cb90', 1030, CAST(N'2022-03-12T23:56:12.893' AS DateTime), CAST(N'2022-03-12T23:56:12.893' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[calendar] OFF
GO
SET IDENTITY_INSERT [dbo].[category_calendar] ON 
GO
INSERT [dbo].[category_calendar] ([id], [name]) VALUES (1, N'Event')
GO
INSERT [dbo].[category_calendar] ([id], [name]) VALUES (2, N'Todo')
GO
INSERT [dbo].[category_calendar] ([id], [name]) VALUES (3, N'Task')
GO
INSERT [dbo].[category_calendar] ([id], [name]) VALUES (5, N'Reminder')
GO
INSERT [dbo].[category_calendar] ([id], [name]) VALUES (12, N'Out of Office')
GO
SET IDENTITY_INSERT [dbo].[category_calendar] OFF
GO
SET IDENTITY_INSERT [dbo].[event] ON 
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (103, N'Học code tại FPT', N'FPT University', N'FPT University', CAST(N'2022-03-12T03:39:43.590' AS DateTime), CAST(N'2022-03-12T03:39:43.590' AS DateTime), 1, 253)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (104, N'Xử lý email cho project', N'FPT University project assignment PRJ', N'FPT University', CAST(N'2022-03-12T03:40:18.393' AS DateTime), CAST(N'2022-03-12T03:40:18.393' AS DateTime), 1, 254)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (105, N'Xử lý websocket cho dự án PRJ', N'FPT University PRJ301 project assignment', N'FPT University', CAST(N'2022-03-12T03:40:55.327' AS DateTime), CAST(N'2022-03-12T03:40:55.327' AS DateTime), 1, 255)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (106, N'Học JPD123', N'FPT University google meet
', N'FPT University google meet', CAST(N'2022-03-12T23:24:34.227' AS DateTime), CAST(N'2022-03-12T23:24:34.227' AS DateTime), 1030, 256)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (107, N'Học IOT102', N'Học trên google meet bài quan trọng không đượ nghỉ
', N'FPT University google meet', CAST(N'2022-03-12T23:25:21.380' AS DateTime), CAST(N'2022-03-12T23:25:21.380' AS DateTime), 1030, 257)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (108, N'Học PRJ301', N'Học trên google meet bài quan trọng không đượ nghỉ', N'FPT University', CAST(N'2022-03-12T23:26:35.730' AS DateTime), CAST(N'2022-03-12T23:26:35.730' AS DateTime), 1030, 258)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (109, N'Học MAS291', N'Học trên google meet bài quan trọng không đượ nghỉ
', N'FPT University google meet', CAST(N'2022-03-12T23:27:42.117' AS DateTime), CAST(N'2022-03-12T23:27:42.117' AS DateTime), 1030, 259)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (110, N'Học MAS292', N'Học trên google meet bài quan trọng không đượ nghỉ
', N'FPT University google meet', CAST(N'2022-03-12T23:29:05.137' AS DateTime), CAST(N'2022-03-12T23:29:05.137' AS DateTime), 1030, 260)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (111, N'Học JPD123', N'Học trên google meet bài quan trọng không được nghỉ
', N'FPT University google meet', CAST(N'2022-03-12T23:30:20.947' AS DateTime), CAST(N'2022-03-12T23:30:20.947' AS DateTime), 1030, 261)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (112, N'Học IOT102', N'Học trên google meet bài quan trọng không được nghỉ
', N'FPT University google meet', CAST(N'2022-03-12T23:30:56.887' AS DateTime), CAST(N'2022-03-12T23:30:56.887' AS DateTime), 1030, 262)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (113, N'Học JPD123', N'Học trên google meet bài quan trọng không được nghỉ', N'FPT University google meet', CAST(N'2022-03-12T23:32:07.457' AS DateTime), CAST(N'2022-03-12T23:32:07.457' AS DateTime), 1030, 263)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (114, N'Học MAS292', N'Học trên google meet bài quan trọng không được nghỉ
', N'FPT University google meet', CAST(N'2022-03-12T23:32:42.277' AS DateTime), CAST(N'2022-03-12T23:32:42.277' AS DateTime), 1030, 264)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (115, N'Học JPD123', N'Học trên google meet bài quan trọng không được nghỉ
', N'FPT University google meet', CAST(N'2022-03-12T23:33:26.437' AS DateTime), CAST(N'2022-03-12T23:33:26.437' AS DateTime), 1030, 265)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (116, N'Học IOT102', N'Học trên google meet bài quan trọng không được nghỉ
', N'FPT University google meet', CAST(N'2022-03-13T00:09:20.867' AS DateTime), CAST(N'2022-03-12T23:34:08.100' AS DateTime), 1030, 266)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (117, N'Học PRJ301', N'Học trên google meet bài quan trọng không được nghỉ
', N'FPT University google meet', CAST(N'2022-03-13T00:07:35.247' AS DateTime), CAST(N'2022-03-12T23:35:07.670' AS DateTime), 1030, 267)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (118, N'Tham gia họp câu lạc bộ js', N'Tham gia họp về cộng tác viên tuyển member
', N'FPT University google meet', CAST(N'2022-03-12T23:54:14.427' AS DateTime), CAST(N'2022-03-12T23:54:14.427' AS DateTime), 1030, 268)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (119, N'Dạy học python cơ bản', N'Dạy các em về python cơ bản và giải thuật
', N'Google meet', CAST(N'2022-03-12T23:58:47.667' AS DateTime), CAST(N'2022-03-12T23:58:47.667' AS DateTime), 1030, 269)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (120, N'Dạy học python cơ bản', N'Dạy các em về python cơ bản và giải thuật
', N'Google meet', CAST(N'2022-03-13T00:01:46.157' AS DateTime), CAST(N'2022-03-13T00:01:46.157' AS DateTime), 1030, 270)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (121, N'Tham gia họp câu lạc bộ js', N'Traning member trong các ctv mà mình mentor
', N'FPT University google meet', CAST(N'2022-03-13T00:06:03.097' AS DateTime), CAST(N'2022-03-13T00:06:03.097' AS DateTime), 1030, 271)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (122, N'Đi ăn lẩu cùng với hội bạn', N'Đi nhậu cùng hội bạn 
', N'Vincom Nguyễn Trãi', CAST(N'2022-03-13T00:12:54.720' AS DateTime), CAST(N'2022-03-13T00:12:44.777' AS DateTime), 1030, 272)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (123, N'Đi xem phim spider men', N'đi xem idol người nhện
', N'Vincom Trần Duy Hưng', CAST(N'2022-03-14T20:15:32.980' AS DateTime), CAST(N'2022-03-13T00:16:26.987' AS DateTime), 1030, 273)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (124, N'Chơi game liên minh huyền thoại', N'Chơi game liên minh huyền thoại cùng bạn trọ
', N'Ở nhà', CAST(N'2022-03-13T00:22:05.127' AS DateTime), CAST(N'2022-03-13T00:22:05.127' AS DateTime), 1030, 274)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (125, N'Làm dự án prj', N'Làm dự án cuối kỳ prj', N'Home', CAST(N'2022-03-15T00:07:35.500' AS DateTime), CAST(N'2022-03-15T00:06:10.453' AS DateTime), 1030, 275)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (126, N'Đi làm tại FPT Software', N'Đi làm tại Hà Nội', N'FPT Software', CAST(N'2022-03-15T00:08:12.713' AS DateTime), CAST(N'2022-03-15T00:08:10.717' AS DateTime), 1030, 276)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (127, N'Đi ngủ', N'Đi ngủ, nghỉ ngơi', N'Home', CAST(N'2022-03-15T00:11:59.903' AS DateTime), CAST(N'2022-03-15T00:08:51.437' AS DateTime), 1030, 277)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (128, N'Đi ngủ', N'Nghỉ ngơi', N'Home', CAST(N'2022-03-15T00:09:26.690' AS DateTime), CAST(N'2022-03-15T00:09:17.267' AS DateTime), 1030, 278)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (129, N'Đi xuống Hà Nội chơi', N'Đi chơi cùng với bạn', N'Phố đi bộ', CAST(N'2022-03-15T00:14:03.327' AS DateTime), CAST(N'2022-03-15T00:14:01.037' AS DateTime), 1030, 279)
GO
INSERT [dbo].[event] ([id], [title], [description], [location], [updated_at], [created_at], [userId], [additionalId]) VALUES (130, N'Đi bắn bia cùng bạn', N'Bắn bia cùng bạn', N'Hòa Lạc', CAST(N'2022-03-15T00:14:48.483' AS DateTime), CAST(N'2022-03-15T00:14:43.540' AS DateTime), 1030, 280)
GO
SET IDENTITY_INSERT [dbo].[event] OFF
GO
SET IDENTITY_INSERT [dbo].[permission] ON 
GO
INSERT [dbo].[permission] ([id], [name]) VALUES (1, N'full')
GO
INSERT [dbo].[permission] ([id], [name]) VALUES (2, N'admin')
GO
INSERT [dbo].[permission] ([id], [name]) VALUES (3, N'user')
GO
SET IDENTITY_INSERT [dbo].[permission] OFF
GO
SET IDENTITY_INSERT [dbo].[permission_action] ON 
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (1, 1, 3, 1)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (2, 1, 3, 3)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (3, 1, 3, 5)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (4, 1, 3, 9)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (5, 1, 3, 10)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (6, 1, 3, 11)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (7, 1, 3, 12)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (8, 1, 3, 13)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (9, 1, 3, 14)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (10, 1, 3, 15)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (11, 1, 3, 16)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (12, 1, 1, 1)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (13, 1, 1, 2)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (14, 1, 1, 3)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (15, 1, 1, 4)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (16, 1, 1, 5)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (17, 1, 1, 6)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (18, 1, 1, 7)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (19, 1, 1, 8)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (20, 1, 1, 9)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (21, 1, 1, 10)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (22, 1, 1, 11)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (23, 1, 1, 12)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (24, 1, 1, 13)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (25, 1, 1, 14)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (26, 1, 1, 15)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (27, 1, 1, 16)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (28, 1, 2, 1)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (29, 1, 2, 2)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (30, 1, 2, 3)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (31, 1, 2, 4)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (32, 1, 2, 5)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (33, 1, 2, 6)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (34, 1, 2, 7)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (35, 1, 2, 8)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (36, 1, 2, 9)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (37, 1, 2, 10)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (38, 1, 2, 11)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (39, 1, 2, 12)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (40, 1, 2, 13)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (41, 1, 2, 14)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (42, 1, 2, 15)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (43, 1, 2, 16)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (44, 1, 1, 17)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (45, 1, 1, 18)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (46, 1, 1, 19)
GO
INSERT [dbo].[permission_action] ([id], [licensed], [permissionId], [actionId]) VALUES (47, 1, 1, 20)
GO
SET IDENTITY_INSERT [dbo].[permission_action] OFF
GO
SET IDENTITY_INSERT [dbo].[status_calendar] ON 
GO
INSERT [dbo].[status_calendar] ([id], [name]) VALUES (1, N'Pending')
GO
INSERT [dbo].[status_calendar] ([id], [name]) VALUES (2, N'In progress')
GO
INSERT [dbo].[status_calendar] ([id], [name]) VALUES (3, N'Done')
GO
INSERT [dbo].[status_calendar] ([id], [name]) VALUES (4, N'Blocked')
GO
SET IDENTITY_INSERT [dbo].[status_calendar] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (1, N'giakinh0823', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'Kính', N'Hà Gia', CAST(N'2001-08-23' AS Date), N'giakinh2000@gmail.com', N'+84972141556', 1, 1, 1, N'admin', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-03-07T20:21:32.507' AS DateTime), N'274520968_5559444394072528_1376914856578898947_n (1).jpg')
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (11, N'test4', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'4', N'Test', CAST(N'2001-08-23' AS Date), N'test4@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-03-15T00:38:35.230' AS DateTime), N'878303746-blogImg.jpg')
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (14, N'test7', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'7', N'Test', CAST(N'2001-08-23' AS Date), N'test7@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (17, N'test10', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'10', N'Test', CAST(N'2001-08-23' AS Date), N'test10@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (18, N'test11', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'11', N'Test', CAST(N'2001-08-23' AS Date), N'test11@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (20, N'test13', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'13', N'Test', CAST(N'2001-08-23' AS Date), N'test13@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (21, N'test14', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'14', N'Test', CAST(N'2001-08-23' AS Date), N'test14@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (23, N'test16', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'16', N'Test', CAST(N'2001-08-23' AS Date), N'test16@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (24, N'test17', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'17', N'Test', CAST(N'2001-08-23' AS Date), N'test17@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (26, N'test19', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'19', N'Test', CAST(N'2001-08-23' AS Date), N'test19@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (28, N'test21', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'21', N'Test', CAST(N'2001-08-23' AS Date), N'test21@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (35, N'test28', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'28', N'Test', CAST(N'2001-08-23' AS Date), N'test28@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (36, N'test29', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'29', N'Test', CAST(N'2001-08-23' AS Date), N'test29@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (37, N'test30', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'30', N'Test', CAST(N'2001-08-23' AS Date), N'test30@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (38, N'test31', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'31', N'Test', CAST(N'2001-08-23' AS Date), N'test31@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (39, N'test32', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'32', N'Test', CAST(N'2001-08-23' AS Date), N'test32@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (41, N'test34', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'34', N'Test', CAST(N'2001-08-23' AS Date), N'test34@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (42, N'test35', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'35', N'Test', CAST(N'2001-08-23' AS Date), N'test35@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (43, N'test36', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'36', N'Test', CAST(N'2001-08-23' AS Date), N'test36@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (44, N'test37', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'37', N'Test', CAST(N'2001-08-23' AS Date), N'test37@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (45, N'test38', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'38', N'Test', CAST(N'2001-08-23' AS Date), N'test38@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (50, N'test43', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'43', N'Test', CAST(N'2001-08-23' AS Date), N'test43@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (51, N'test44', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'44', N'Test', CAST(N'2001-08-23' AS Date), N'test44@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (52, N'test45', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'45', N'Test', CAST(N'2001-08-23' AS Date), N'test45@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (55, N'test48', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'48', N'Test', CAST(N'2001-08-23' AS Date), N'test48@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (57, N'test50', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'50', N'Test', CAST(N'2001-08-23' AS Date), N'test50@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (58, N'test51', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'51', N'Test', CAST(N'2001-08-23' AS Date), N'test51@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (59, N'test52', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'52', N'Test', CAST(N'2001-08-23' AS Date), N'test52@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (60, N'test53', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'53', N'Test', CAST(N'2001-08-23' AS Date), N'test53@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (61, N'test54', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'54', N'Test', CAST(N'2001-08-23' AS Date), N'test54@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (62, N'test55', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'55', N'Test', CAST(N'2001-08-23' AS Date), N'test55@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (63, N'test56', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'56', N'Test', CAST(N'2001-08-23' AS Date), N'test56@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (64, N'test57', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'57', N'Test', CAST(N'2001-08-23' AS Date), N'test57@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (65, N'test58', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'58', N'Test', CAST(N'2001-08-23' AS Date), N'test58@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (66, N'test59', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'59', N'Test', CAST(N'2001-08-23' AS Date), N'test59@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (67, N'test60', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'60', N'Test', CAST(N'2001-08-23' AS Date), N'test60@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (68, N'test61', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'61', N'Test', CAST(N'2001-08-23' AS Date), N'test61@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (69, N'test62', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'62', N'Test', CAST(N'2001-08-23' AS Date), N'test62@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (70, N'test63', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'63', N'Test', CAST(N'2001-08-23' AS Date), N'test63@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (71, N'test64', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'64', N'Test', CAST(N'2001-08-23' AS Date), N'test64@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (72, N'test65', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'65', N'Test', CAST(N'2001-08-23' AS Date), N'test65@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (73, N'test66', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'66', N'Test', CAST(N'2001-08-23' AS Date), N'test66@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (74, N'test67', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'67', N'Test', CAST(N'2001-08-23' AS Date), N'test67@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (75, N'test68', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'68', N'Test', CAST(N'2001-08-23' AS Date), N'test68@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (76, N'test69', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'69', N'Test', CAST(N'2001-08-23' AS Date), N'test69@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (77, N'test70', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'70', N'Test', CAST(N'2001-08-23' AS Date), N'test70@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (82, N'test75', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'75', N'Test', CAST(N'2001-08-23' AS Date), N'test75@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (85, N'test78', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'78', N'Test', CAST(N'2001-08-23' AS Date), N'test78@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (86, N'test79', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'79', N'Test', CAST(N'2001-08-23' AS Date), N'test79@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (88, N'test81', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'81', N'Test', CAST(N'2001-08-23' AS Date), N'test81@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (89, N'test82', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'82', N'Test', CAST(N'2001-08-23' AS Date), N'test82@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (90, N'test83', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'83', N'Test', CAST(N'2001-08-23' AS Date), N'test83@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (91, N'test84', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'84', N'Test', CAST(N'2001-08-23' AS Date), N'test84@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (92, N'test85', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'85', N'Test', CAST(N'2001-08-23' AS Date), N'test85@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (93, N'test86', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'86', N'Test', CAST(N'2001-08-23' AS Date), N'test86@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (94, N'test87', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'87', N'Test', CAST(N'2001-08-23' AS Date), N'test87@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (95, N'test88', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'88', N'Test', CAST(N'2001-08-23' AS Date), N'test88@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (96, N'test89', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'89', N'Test', CAST(N'2001-08-23' AS Date), N'test89@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (97, N'test90', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'90', N'Test', CAST(N'2001-08-23' AS Date), N'test90@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (100, N'test93', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'93', N'Test', CAST(N'2001-08-23' AS Date), N'test93@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (104, N'test97', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'97', N'Test', CAST(N'2001-08-23' AS Date), N'test97@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (105, N'test98', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'98', N'Test', CAST(N'2001-08-23' AS Date), N'test98@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (106, N'test99', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'99', N'Test', CAST(N'2001-08-23' AS Date), N'test99@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (107, N'test100', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'100', N'Test', CAST(N'2001-08-23' AS Date), N'test100@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (108, N'test101', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'101', N'Test', CAST(N'2001-08-23' AS Date), N'test101@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (110, N'test103', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'103', N'Test', CAST(N'2001-08-23' AS Date), N'test103@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (111, N'test104', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'104', N'Test', CAST(N'2001-08-23' AS Date), N'test104@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (112, N'test105', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'105', N'Test', CAST(N'2001-08-23' AS Date), N'test105@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (113, N'test106', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'106', N'Test', CAST(N'2001-08-23' AS Date), N'test106@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (115, N'test108', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'108', N'Test', CAST(N'2001-08-23' AS Date), N'test108@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (116, N'test109', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'109', N'Test', CAST(N'2001-08-23' AS Date), N'test109@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (117, N'test110', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'110', N'Test', CAST(N'2001-08-23' AS Date), N'test110@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (118, N'test111', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'111', N'Test', CAST(N'2001-08-23' AS Date), N'test111@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (119, N'test112', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'112', N'Test', CAST(N'2001-08-23' AS Date), N'test112@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (120, N'test113', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'113', N'Test', CAST(N'2001-08-23' AS Date), N'test113@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (121, N'test114', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'114', N'Test', CAST(N'2001-08-23' AS Date), N'test114@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (122, N'test115', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'115', N'Test', CAST(N'2001-08-23' AS Date), N'test115@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (123, N'test116', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'116', N'Test', CAST(N'2001-08-23' AS Date), N'test116@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (124, N'test117', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'117', N'Test', CAST(N'2001-08-23' AS Date), N'test117@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (125, N'test118', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'118', N'Test', CAST(N'2001-08-23' AS Date), N'test118@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (126, N'test119', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'119', N'Test', CAST(N'2001-08-23' AS Date), N'test119@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (127, N'test120', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'120', N'Test', CAST(N'2001-08-23' AS Date), N'test120@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (128, N'test121', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'121', N'Test', CAST(N'2001-08-23' AS Date), N'test121@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (129, N'test122', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'122', N'Test', CAST(N'2001-08-23' AS Date), N'test122@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (130, N'test123', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'123', N'Test', CAST(N'2001-08-23' AS Date), N'test123@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (131, N'test124', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'124', N'Test', CAST(N'2001-08-23' AS Date), N'test124@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (134, N'test127', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'127', N'Test', CAST(N'2001-08-23' AS Date), N'test127@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (135, N'test128', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'128', N'Test', CAST(N'2001-08-23' AS Date), N'test128@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (136, N'test129', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'129', N'Test', CAST(N'2001-08-23' AS Date), N'test129@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (137, N'test130', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'130', N'Test', CAST(N'2001-08-23' AS Date), N'test130@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (140, N'test133', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'133', N'Test', CAST(N'2001-08-23' AS Date), N'test133@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (141, N'test134', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'134', N'Test', CAST(N'2001-08-23' AS Date), N'test134@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (142, N'test135', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'135', N'Test', CAST(N'2001-08-23' AS Date), N'test135@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (143, N'test136', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'136', N'Test', CAST(N'2001-08-23' AS Date), N'test136@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (144, N'test137', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'137', N'Test', CAST(N'2001-08-23' AS Date), N'test137@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (145, N'test138', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'138', N'Test', CAST(N'2001-08-23' AS Date), N'test138@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (146, N'test139', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'139', N'Test', CAST(N'2001-08-23' AS Date), N'test139@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (147, N'test140', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'140', N'Test', CAST(N'2001-08-23' AS Date), N'test140@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (148, N'test141', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'141', N'Test', CAST(N'2001-08-23' AS Date), N'test141@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (149, N'test142', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'142', N'Test', CAST(N'2001-08-23' AS Date), N'test142@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (150, N'test143', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'143', N'Test', CAST(N'2001-08-23' AS Date), N'test143@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (151, N'test144', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'144', N'Test', CAST(N'2001-08-23' AS Date), N'test144@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (152, N'test145', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'145', N'Test', CAST(N'2001-08-23' AS Date), N'test145@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (153, N'test146', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'146', N'Test', CAST(N'2001-08-23' AS Date), N'test146@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (154, N'test147', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'147', N'Test', CAST(N'2001-08-23' AS Date), N'test147@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (155, N'test148', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'148', N'Test', CAST(N'2001-08-23' AS Date), N'test148@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (156, N'test149', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'149', N'Test', CAST(N'2001-08-23' AS Date), N'test149@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (157, N'test150', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'150', N'Test', CAST(N'2001-08-23' AS Date), N'test150@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (158, N'test151', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'151', N'Test', CAST(N'2001-08-23' AS Date), N'test151@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (159, N'test152', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'152', N'Test', CAST(N'2001-08-23' AS Date), N'test152@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (160, N'test153', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'153', N'Test', CAST(N'2001-08-23' AS Date), N'test153@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (161, N'test154', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'154', N'Test', CAST(N'2001-08-23' AS Date), N'test154@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (162, N'test155', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'155', N'Test', CAST(N'2001-08-23' AS Date), N'test155@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (163, N'test156hihi', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'156', N'Test', CAST(N'2001-08-23' AS Date), N'test156@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-25T07:43:25.847' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (164, N'test157', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'157', N'Test', CAST(N'2001-08-23' AS Date), N'test157@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (165, N'test158', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'158', N'Test', CAST(N'2001-08-23' AS Date), N'test158@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (166, N'test159', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'159', N'Test', CAST(N'2001-08-23' AS Date), N'test159@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (167, N'test160', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'160', N'Test', CAST(N'2001-08-23' AS Date), N'test160@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (168, N'test161', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'161', N'Test', CAST(N'2001-08-23' AS Date), N'test161@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (169, N'test162', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'162', N'Test', CAST(N'2001-08-23' AS Date), N'test162@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (170, N'test163', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'163', N'Test', CAST(N'2001-08-23' AS Date), N'test163@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (171, N'test164', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'164', N'Test', CAST(N'2001-08-23' AS Date), N'test164@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (172, N'test165', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'165', N'Test', CAST(N'2001-08-23' AS Date), N'test165@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (173, N'test166', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'166', N'Test', CAST(N'2001-08-23' AS Date), N'test166@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (174, N'test167', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'167', N'Test', CAST(N'2001-08-23' AS Date), N'test167@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (175, N'test168', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'168', N'Test', CAST(N'2001-08-23' AS Date), N'test168@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (176, N'test169', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'169', N'Test', CAST(N'2001-08-23' AS Date), N'test169@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (177, N'test170', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'170', N'Test', CAST(N'2001-08-23' AS Date), N'test170@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (181, N'test174', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'174', N'Test', CAST(N'2001-08-23' AS Date), N'test174@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (182, N'test175', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'175', N'Test', CAST(N'2001-08-23' AS Date), N'test175@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (183, N'test176', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'176', N'Test', CAST(N'2001-08-23' AS Date), N'test176@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (184, N'test177', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'177', N'Test', CAST(N'2001-08-23' AS Date), N'test177@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (185, N'test178', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'178', N'Test', CAST(N'2001-08-23' AS Date), N'test178@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (186, N'test179', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'179', N'Test', CAST(N'2001-08-23' AS Date), N'test179@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (187, N'test180', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'180', N'Test', CAST(N'2001-08-23' AS Date), N'test180@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (188, N'test181', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'181', N'Test', CAST(N'2001-08-23' AS Date), N'test181@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (189, N'test182', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'182', N'Test', CAST(N'2001-08-23' AS Date), N'test182@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (190, N'test183', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'183', N'Test', CAST(N'2001-08-23' AS Date), N'test183@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (191, N'test184', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'184', N'Test', CAST(N'2001-08-23' AS Date), N'test184@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (192, N'test185', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'185', N'Test', CAST(N'2001-08-23' AS Date), N'test185@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (193, N'test186', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'186', N'Test', CAST(N'2001-08-23' AS Date), N'test186@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (195, N'test188', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'188', N'Test', CAST(N'2001-08-23' AS Date), N'test188@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (196, N'test189', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'189', N'Test', CAST(N'2001-08-23' AS Date), N'test189@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (197, N'test190', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'190', N'Test', CAST(N'2001-08-23' AS Date), N'test190@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (198, N'test191', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'191', N'Test', CAST(N'2001-08-23' AS Date), N'test191@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (199, N'test192', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'192', N'Test', CAST(N'2001-08-23' AS Date), N'test192@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (200, N'test193', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'193', N'Test', CAST(N'2001-08-23' AS Date), N'test193@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (201, N'test194', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'194', N'Test', CAST(N'2001-08-23' AS Date), N'test194@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (202, N'test195', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'195', N'Test', CAST(N'2001-08-23' AS Date), N'test195@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (203, N'test196', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'196', N'Test', CAST(N'2001-08-23' AS Date), N'test196@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (204, N'test197', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'197', N'Test', CAST(N'2001-08-23' AS Date), N'test197@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (205, N'test198', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'198', N'Test', CAST(N'2001-08-23' AS Date), N'test198@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (206, N'test199', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'199', N'Test', CAST(N'2001-08-23' AS Date), N'test199@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (207, N'test200', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'200', N'Test', CAST(N'2001-08-23' AS Date), N'test200@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (208, N'test201', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'201', N'Test', CAST(N'2001-08-23' AS Date), N'test201@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (209, N'test202', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'202', N'Test', CAST(N'2001-08-23' AS Date), N'test202@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (210, N'test203', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'203', N'Test', CAST(N'2001-08-23' AS Date), N'test203@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (211, N'test204', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'204', N'Test', CAST(N'2001-08-23' AS Date), N'test204@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (212, N'test205', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'205', N'Test', CAST(N'2001-08-23' AS Date), N'test205@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (213, N'test206', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'206', N'Test', CAST(N'2001-08-23' AS Date), N'test206@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (214, N'test207', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'207', N'Test', CAST(N'2001-08-23' AS Date), N'test207@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (215, N'test208', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'208', N'Test', CAST(N'2001-08-23' AS Date), N'test208@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (216, N'test209', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'209', N'Test', CAST(N'2001-08-23' AS Date), N'test209@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (217, N'test210', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'210', N'Test', CAST(N'2001-08-23' AS Date), N'test210@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (218, N'test211', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'211', N'Test', CAST(N'2001-08-23' AS Date), N'test211@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (219, N'test212', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'212', N'Test', CAST(N'2001-08-23' AS Date), N'test212@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (220, N'test213', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'213', N'Test', CAST(N'2001-08-23' AS Date), N'test213@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (221, N'test214', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'214', N'Test', CAST(N'2001-08-23' AS Date), N'test214@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (222, N'test215', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'215', N'Test', CAST(N'2001-08-23' AS Date), N'test215@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (223, N'test216', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'216', N'Test', CAST(N'2001-08-23' AS Date), N'test216@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (224, N'test217', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'217', N'Test', CAST(N'2001-08-23' AS Date), N'test217@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (225, N'test218', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'218', N'Test', CAST(N'2001-08-23' AS Date), N'test218@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (226, N'test219', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'219', N'Test', CAST(N'2001-08-23' AS Date), N'test219@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (227, N'test220', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'220', N'Test', CAST(N'2001-08-23' AS Date), N'test220@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (228, N'test221', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'221', N'Test', CAST(N'2001-08-23' AS Date), N'test221@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (229, N'test222', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'222', N'Test', CAST(N'2001-08-23' AS Date), N'test222@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (230, N'test223', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'223', N'Test', CAST(N'2001-08-23' AS Date), N'test223@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (231, N'test224', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'224', N'Test', CAST(N'2001-08-23' AS Date), N'test224@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (232, N'test225', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'225', N'Test', CAST(N'2001-08-23' AS Date), N'test225@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (233, N'test226', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'226', N'Test', CAST(N'2001-08-23' AS Date), N'test226@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (234, N'test227', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'227', N'Test', CAST(N'2001-08-23' AS Date), N'test227@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (235, N'test228', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'228', N'Test', CAST(N'2001-08-23' AS Date), N'test228@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (236, N'test229', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'229', N'Test', CAST(N'2001-08-23' AS Date), N'test229@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (237, N'test230', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'230', N'Test', CAST(N'2001-08-23' AS Date), N'test230@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (238, N'test231', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'231', N'Test', CAST(N'2001-08-23' AS Date), N'test231@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (239, N'test232', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'232', N'Test', CAST(N'2001-08-23' AS Date), N'test232@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (240, N'test233', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'233', N'Test', CAST(N'2001-08-23' AS Date), N'test233@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (241, N'test234', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'234', N'Test', CAST(N'2001-08-23' AS Date), N'test234@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (242, N'test235', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'235', N'Test', CAST(N'2001-08-23' AS Date), N'test235@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (243, N'test236', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'236', N'Test', CAST(N'2001-08-23' AS Date), N'test236@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (244, N'test237', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'237', N'Test', CAST(N'2001-08-23' AS Date), N'test237@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (245, N'test238', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'238', N'Test', CAST(N'2001-08-23' AS Date), N'test238@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (246, N'test239', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'239', N'Test', CAST(N'2001-08-23' AS Date), N'test239@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (247, N'test240', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'240', N'Test', CAST(N'2001-08-23' AS Date), N'test240@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (248, N'test241', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'241', N'Test', CAST(N'2001-08-23' AS Date), N'test241@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (249, N'test242', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'242', N'Test', CAST(N'2001-08-23' AS Date), N'test242@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (250, N'test243', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'243', N'Test', CAST(N'2001-08-23' AS Date), N'test243@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (251, N'test244', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'244', N'Test', CAST(N'2001-08-23' AS Date), N'test244@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (252, N'test245', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'245', N'Test', CAST(N'2001-08-23' AS Date), N'test245@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (253, N'test246', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'246', N'Test', CAST(N'2001-08-23' AS Date), N'test246@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (254, N'test247', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'247', N'Test', CAST(N'2001-08-23' AS Date), N'test247@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (255, N'test248', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'248', N'Test', CAST(N'2001-08-23' AS Date), N'test248@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (256, N'test249', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'249', N'Test', CAST(N'2001-08-23' AS Date), N'test249@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (257, N'test250', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'250', N'Test', CAST(N'2001-08-23' AS Date), N'test250@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (258, N'test251', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'251', N'Test', CAST(N'2001-08-23' AS Date), N'test251@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (259, N'test252', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'252', N'Test', CAST(N'2001-08-23' AS Date), N'test252@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (260, N'test253', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'253', N'Test', CAST(N'2001-08-23' AS Date), N'test253@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (261, N'test254', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'254', N'Test', CAST(N'2001-08-23' AS Date), N'test254@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (262, N'test255', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'255', N'Test', CAST(N'2001-08-23' AS Date), N'test255@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (263, N'test256', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'256', N'Test', CAST(N'2001-08-23' AS Date), N'test256@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (264, N'test257', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'257', N'Test', CAST(N'2001-08-23' AS Date), N'test257@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (265, N'test258', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'258', N'Test', CAST(N'2001-08-23' AS Date), N'test258@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (266, N'test259', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'259', N'Test', CAST(N'2001-08-23' AS Date), N'test259@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (267, N'test260', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'260', N'Test', CAST(N'2001-08-23' AS Date), N'test260@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (268, N'test261', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'261', N'Test', CAST(N'2001-08-23' AS Date), N'test261@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (269, N'test262', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'262', N'Test', CAST(N'2001-08-23' AS Date), N'test262@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (270, N'test263', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'263', N'Test', CAST(N'2001-08-23' AS Date), N'test263@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (271, N'test264', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'264', N'Test', CAST(N'2001-08-23' AS Date), N'test264@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (272, N'test265', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'265', N'Test', CAST(N'2001-08-23' AS Date), N'test265@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (273, N'test266', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'266', N'Test', CAST(N'2001-08-23' AS Date), N'test266@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (274, N'test267', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'267', N'Test', CAST(N'2001-08-23' AS Date), N'test267@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (275, N'test268', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'268', N'Test', CAST(N'2001-08-23' AS Date), N'test268@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (276, N'test269', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'269', N'Test', CAST(N'2001-08-23' AS Date), N'test269@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (277, N'test270', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'270', N'Test', CAST(N'2001-08-23' AS Date), N'test270@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (278, N'test271', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'271', N'Test', CAST(N'2001-08-23' AS Date), N'test271@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (279, N'test272', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'272', N'Test', CAST(N'2001-08-23' AS Date), N'test272@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (280, N'test273', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'273', N'Test', CAST(N'2001-08-23' AS Date), N'test273@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (281, N'test274', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'274', N'Test', CAST(N'2001-08-23' AS Date), N'test274@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (282, N'test275', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'275', N'Test', CAST(N'2001-08-23' AS Date), N'test275@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (283, N'test276', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'276', N'Test', CAST(N'2001-08-23' AS Date), N'test276@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (284, N'test277', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'277', N'Test', CAST(N'2001-08-23' AS Date), N'test277@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (285, N'test278', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'278', N'Test', CAST(N'2001-08-23' AS Date), N'test278@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (286, N'test279', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'279', N'Test', CAST(N'2001-08-23' AS Date), N'test279@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (287, N'test280', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'280', N'Test', CAST(N'2001-08-23' AS Date), N'test280@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (288, N'test281', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'281', N'Test', CAST(N'2001-08-23' AS Date), N'test281@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (289, N'test282', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'282', N'Test', CAST(N'2001-08-23' AS Date), N'test282@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (290, N'test283', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'283', N'Test', CAST(N'2001-08-23' AS Date), N'test283@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (291, N'test284', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'284', N'Test', CAST(N'2001-08-23' AS Date), N'test284@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (292, N'test285', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'285', N'Test', CAST(N'2001-08-23' AS Date), N'test285@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (293, N'test286', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'286', N'Test', CAST(N'2001-08-23' AS Date), N'test286@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (294, N'test287', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'287', N'Test', CAST(N'2001-08-23' AS Date), N'test287@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (295, N'test288', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'288', N'Test', CAST(N'2001-08-23' AS Date), N'test288@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (296, N'test289', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'289', N'Test', CAST(N'2001-08-23' AS Date), N'test289@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (297, N'test290', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'290', N'Test', CAST(N'2001-08-23' AS Date), N'test290@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (298, N'test291', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'291', N'Test', CAST(N'2001-08-23' AS Date), N'test291@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (299, N'test292', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'292', N'Test', CAST(N'2001-08-23' AS Date), N'test292@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (300, N'test293', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'293', N'Test', CAST(N'2001-08-23' AS Date), N'test293@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (301, N'test294', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'294', N'Test', CAST(N'2001-08-23' AS Date), N'test294@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (302, N'test295', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'295', N'Test', CAST(N'2001-08-23' AS Date), N'test295@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (303, N'test296', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'296', N'Test', CAST(N'2001-08-23' AS Date), N'test296@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (304, N'test297', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'297', N'Test', CAST(N'2001-08-23' AS Date), N'test297@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (305, N'test298', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'298', N'Test', CAST(N'2001-08-23' AS Date), N'test298@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (306, N'test299', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'299', N'Test', CAST(N'2001-08-23' AS Date), N'test299@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (307, N'test300', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'300', N'Test', CAST(N'2001-08-23' AS Date), N'test300@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (308, N'test301', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'301', N'Test', CAST(N'2001-08-23' AS Date), N'test301@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (309, N'test302', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'302', N'Test', CAST(N'2001-08-23' AS Date), N'test302@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (310, N'test303', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'303', N'Test', CAST(N'2001-08-23' AS Date), N'test303@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (311, N'test304', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'304', N'Test', CAST(N'2001-08-23' AS Date), N'test304@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (312, N'test305', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'305', N'Test', CAST(N'2001-08-23' AS Date), N'test305@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (313, N'test306', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'306', N'Test', CAST(N'2001-08-23' AS Date), N'test306@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (314, N'test307', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'307', N'Test', CAST(N'2001-08-23' AS Date), N'test307@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (315, N'test308', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'308', N'Test', CAST(N'2001-08-23' AS Date), N'test308@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (316, N'test309', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'309', N'Test', CAST(N'2001-08-23' AS Date), N'test309@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (317, N'test310', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'310', N'Test', CAST(N'2001-08-23' AS Date), N'test310@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (318, N'test311', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'311', N'Test', CAST(N'2001-08-23' AS Date), N'test311@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (319, N'test312', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'312', N'Test', CAST(N'2001-08-23' AS Date), N'test312@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (320, N'test313', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'313', N'Test', CAST(N'2001-08-23' AS Date), N'test313@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (321, N'test314', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'314', N'Test', CAST(N'2001-08-23' AS Date), N'test314@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (322, N'test315', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'315', N'Test', CAST(N'2001-08-23' AS Date), N'test315@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (323, N'test316', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'316', N'Test', CAST(N'2001-08-23' AS Date), N'test316@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (324, N'test317', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'317', N'Test', CAST(N'2001-08-23' AS Date), N'test317@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (325, N'test318', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'318', N'Test', CAST(N'2001-08-23' AS Date), N'test318@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (326, N'test319', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'319', N'Test', CAST(N'2001-08-23' AS Date), N'test319@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (327, N'test320', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'320', N'Test', CAST(N'2001-08-23' AS Date), N'test320@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (328, N'test321', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'321', N'Test', CAST(N'2001-08-23' AS Date), N'test321@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (329, N'test322', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'322', N'Test', CAST(N'2001-08-23' AS Date), N'test322@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (330, N'test323', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'323', N'Test', CAST(N'2001-08-23' AS Date), N'test323@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (331, N'test324', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'324', N'Test', CAST(N'2001-08-23' AS Date), N'test324@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (332, N'test325', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'325', N'Test', CAST(N'2001-08-23' AS Date), N'test325@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (333, N'test326', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'326', N'Test', CAST(N'2001-08-23' AS Date), N'test326@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (334, N'test327', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'327', N'Test', CAST(N'2001-08-23' AS Date), N'test327@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (335, N'test328', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'328', N'Test', CAST(N'2001-08-23' AS Date), N'test328@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (336, N'test329', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'329', N'Test', CAST(N'2001-08-23' AS Date), N'test329@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (337, N'test330', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'330', N'Test', CAST(N'2001-08-23' AS Date), N'test330@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (338, N'test331', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'331', N'Test', CAST(N'2001-08-23' AS Date), N'test331@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (339, N'test332', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'332', N'Test', CAST(N'2001-08-23' AS Date), N'test332@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (340, N'test333', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'333', N'Test', CAST(N'2001-08-23' AS Date), N'test333@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (341, N'test334', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'334', N'Test', CAST(N'2001-08-23' AS Date), N'test334@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (342, N'test335', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'335', N'Test', CAST(N'2001-08-23' AS Date), N'test335@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (343, N'test336', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'336', N'Test', CAST(N'2001-08-23' AS Date), N'test336@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (344, N'test337', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'337', N'Test', CAST(N'2001-08-23' AS Date), N'test337@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (345, N'test338', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'338', N'Test', CAST(N'2001-08-23' AS Date), N'test338@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (346, N'test339', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'339', N'Test', CAST(N'2001-08-23' AS Date), N'test339@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (347, N'test340', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'340', N'Test', CAST(N'2001-08-23' AS Date), N'test340@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (348, N'test341', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'341', N'Test', CAST(N'2001-08-23' AS Date), N'test341@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (349, N'test342', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'342', N'Test', CAST(N'2001-08-23' AS Date), N'test342@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (350, N'test343', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'343', N'Test', CAST(N'2001-08-23' AS Date), N'test343@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (351, N'test344', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'344', N'Test', CAST(N'2001-08-23' AS Date), N'test344@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (352, N'test345', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'345', N'Test', CAST(N'2001-08-23' AS Date), N'test345@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (353, N'test346', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'346', N'Test', CAST(N'2001-08-23' AS Date), N'test346@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (354, N'test347', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'347', N'Test', CAST(N'2001-08-23' AS Date), N'test347@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (355, N'test348', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'348', N'Test', CAST(N'2001-08-23' AS Date), N'test348@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (356, N'test349', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'349', N'Test', CAST(N'2001-08-23' AS Date), N'test349@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (357, N'test350', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'350', N'Test', CAST(N'2001-08-23' AS Date), N'test350@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (358, N'test351', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'351', N'Test', CAST(N'2001-08-23' AS Date), N'test351@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (359, N'test352', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'352', N'Test', CAST(N'2001-08-23' AS Date), N'test352@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (360, N'test353', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'353', N'Test', CAST(N'2001-08-23' AS Date), N'test353@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (361, N'test354', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'354', N'Test', CAST(N'2001-08-23' AS Date), N'test354@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (362, N'test355', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'355', N'Test', CAST(N'2001-08-23' AS Date), N'test355@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (363, N'test356', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'356', N'Test', CAST(N'2001-08-23' AS Date), N'test356@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (364, N'test357', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'357', N'Test', CAST(N'2001-08-23' AS Date), N'test357@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (365, N'test358', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'358', N'Test', CAST(N'2001-08-23' AS Date), N'test358@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (366, N'test359', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'359', N'Test', CAST(N'2001-08-23' AS Date), N'test359@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (367, N'test360', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'360', N'Test', CAST(N'2001-08-23' AS Date), N'test360@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (368, N'test361', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'361', N'Test', CAST(N'2001-08-23' AS Date), N'test361@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (369, N'test362', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'362', N'Test', CAST(N'2001-08-23' AS Date), N'test362@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (370, N'test363', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'363', N'Test', CAST(N'2001-08-23' AS Date), N'test363@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (371, N'test364', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'364', N'Test', CAST(N'2001-08-23' AS Date), N'test364@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (372, N'test365', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'365', N'Test', CAST(N'2001-08-23' AS Date), N'test365@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (373, N'test366', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'366', N'Test', CAST(N'2001-08-23' AS Date), N'test366@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (374, N'test367', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'367', N'Test', CAST(N'2001-08-23' AS Date), N'test367@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (375, N'test368', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'368', N'Test', CAST(N'2001-08-23' AS Date), N'test368@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (376, N'test369', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'369', N'Test', CAST(N'2001-08-23' AS Date), N'test369@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (377, N'test370', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'370', N'Test', CAST(N'2001-08-23' AS Date), N'test370@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (378, N'test371', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'371', N'Test', CAST(N'2001-08-23' AS Date), N'test371@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (379, N'test372', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'372', N'Test', CAST(N'2001-08-23' AS Date), N'test372@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (380, N'test373', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'373', N'Test', CAST(N'2001-08-23' AS Date), N'test373@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (381, N'test374', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'374', N'Test', CAST(N'2001-08-23' AS Date), N'test374@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (382, N'test375', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'375', N'Test', CAST(N'2001-08-23' AS Date), N'test375@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (383, N'test376', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'376', N'Test', CAST(N'2001-08-23' AS Date), N'test376@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (384, N'test377', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'377', N'Test', CAST(N'2001-08-23' AS Date), N'test377@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (385, N'test378', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'378', N'Test', CAST(N'2001-08-23' AS Date), N'test378@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (386, N'test379', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'379', N'Test', CAST(N'2001-08-23' AS Date), N'test379@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (387, N'test380', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'380', N'Test', CAST(N'2001-08-23' AS Date), N'test380@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (388, N'test381', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'381', N'Test', CAST(N'2001-08-23' AS Date), N'test381@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (389, N'test382', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'382', N'Test', CAST(N'2001-08-23' AS Date), N'test382@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (390, N'test383', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'383', N'Test', CAST(N'2001-08-23' AS Date), N'test383@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (391, N'test384', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'384', N'Test', CAST(N'2001-08-23' AS Date), N'test384@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (392, N'test385', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'385', N'Test', CAST(N'2001-08-23' AS Date), N'test385@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (393, N'test386', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'386', N'Test', CAST(N'2001-08-23' AS Date), N'test386@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (394, N'test387', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'387', N'Test', CAST(N'2001-08-23' AS Date), N'test387@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (395, N'test388', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'388', N'Test', CAST(N'2001-08-23' AS Date), N'test388@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (396, N'test389', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'389', N'Test', CAST(N'2001-08-23' AS Date), N'test389@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (397, N'test390', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'390', N'Test', CAST(N'2001-08-23' AS Date), N'test390@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (398, N'test391', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'391', N'Test', CAST(N'2001-08-23' AS Date), N'test391@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (399, N'test392', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'392', N'Test', CAST(N'2001-08-23' AS Date), N'test392@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (400, N'test393', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'393', N'Test', CAST(N'2001-08-23' AS Date), N'test393@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (401, N'test394', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'394', N'Test', CAST(N'2001-08-23' AS Date), N'test394@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (402, N'test395', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'395', N'Test', CAST(N'2001-08-23' AS Date), N'test395@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (403, N'test396', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'396', N'Test', CAST(N'2001-08-23' AS Date), N'test396@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (404, N'test397', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'397', N'Test', CAST(N'2001-08-23' AS Date), N'test397@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (405, N'test398', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'398', N'Test', CAST(N'2001-08-23' AS Date), N'test398@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (406, N'test399', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'399', N'Test', CAST(N'2001-08-23' AS Date), N'test399@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (407, N'test400', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'400', N'Test', CAST(N'2001-08-23' AS Date), N'test400@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (408, N'test401', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'401', N'Test', CAST(N'2001-08-23' AS Date), N'test401@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (409, N'test402', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'402', N'Test', CAST(N'2001-08-23' AS Date), N'test402@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (410, N'test403', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'403', N'Test', CAST(N'2001-08-23' AS Date), N'test403@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (411, N'test404', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'404', N'Test', CAST(N'2001-08-23' AS Date), N'test404@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (412, N'test405', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'405', N'Test', CAST(N'2001-08-23' AS Date), N'test405@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (413, N'test406', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'406', N'Test', CAST(N'2001-08-23' AS Date), N'test406@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (414, N'test407', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'407', N'Test', CAST(N'2001-08-23' AS Date), N'test407@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (415, N'test408', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'408', N'Test', CAST(N'2001-08-23' AS Date), N'test408@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (416, N'test409', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'409', N'Test', CAST(N'2001-08-23' AS Date), N'test409@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (417, N'test410', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'410', N'Test', CAST(N'2001-08-23' AS Date), N'test410@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (418, N'test411', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'411', N'Test', CAST(N'2001-08-23' AS Date), N'test411@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (419, N'test412', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'412', N'Test', CAST(N'2001-08-23' AS Date), N'test412@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (420, N'test413', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'413', N'Test', CAST(N'2001-08-23' AS Date), N'test413@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (421, N'test414', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'414', N'Test', CAST(N'2001-08-23' AS Date), N'test414@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (422, N'test415', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'415', N'Test', CAST(N'2001-08-23' AS Date), N'test415@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (423, N'test416', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'416', N'Test', CAST(N'2001-08-23' AS Date), N'test416@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (424, N'test417', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'417', N'Test', CAST(N'2001-08-23' AS Date), N'test417@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (425, N'test418', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'418', N'Test', CAST(N'2001-08-23' AS Date), N'test418@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (426, N'test419', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'419', N'Test', CAST(N'2001-08-23' AS Date), N'test419@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (427, N'test420', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'420', N'Test', CAST(N'2001-08-23' AS Date), N'test420@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (428, N'test421', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'421', N'Test', CAST(N'2001-08-23' AS Date), N'test421@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (429, N'test422', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'422', N'Test', CAST(N'2001-08-23' AS Date), N'test422@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (430, N'test423', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'423', N'Test', CAST(N'2001-08-23' AS Date), N'test423@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (431, N'test424', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'424', N'Test', CAST(N'2001-08-23' AS Date), N'test424@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (432, N'test425', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'425', N'Test', CAST(N'2001-08-23' AS Date), N'test425@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (433, N'test426', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'426', N'Test', CAST(N'2001-08-23' AS Date), N'test426@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (434, N'test427', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'427', N'Test', CAST(N'2001-08-23' AS Date), N'test427@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (435, N'test428', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'428', N'Test', CAST(N'2001-08-23' AS Date), N'test428@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (436, N'test429', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'429', N'Test', CAST(N'2001-08-23' AS Date), N'test429@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (437, N'test430', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'430', N'Test', CAST(N'2001-08-23' AS Date), N'test430@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (438, N'test431', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'431', N'Test', CAST(N'2001-08-23' AS Date), N'test431@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (439, N'test432', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'432', N'Test', CAST(N'2001-08-23' AS Date), N'test432@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (440, N'test433', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'433', N'Test', CAST(N'2001-08-23' AS Date), N'test433@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (441, N'test434', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'434', N'Test', CAST(N'2001-08-23' AS Date), N'test434@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (442, N'test435', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'435', N'Test', CAST(N'2001-08-23' AS Date), N'test435@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (443, N'test436', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'436', N'Test', CAST(N'2001-08-23' AS Date), N'test436@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (444, N'test437', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'437', N'Test', CAST(N'2001-08-23' AS Date), N'test437@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (445, N'test438', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'438', N'Test', CAST(N'2001-08-23' AS Date), N'test438@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (446, N'test439', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'439', N'Test', CAST(N'2001-08-23' AS Date), N'test439@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (447, N'test440', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'440', N'Test', CAST(N'2001-08-23' AS Date), N'test440@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (448, N'test441', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'441', N'Test', CAST(N'2001-08-23' AS Date), N'test441@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (449, N'test442', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'442', N'Test', CAST(N'2001-08-23' AS Date), N'test442@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (450, N'test443', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'443', N'Test', CAST(N'2001-08-23' AS Date), N'test443@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (451, N'test444', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'444', N'Test', CAST(N'2001-08-23' AS Date), N'test444@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (452, N'test445', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'445', N'Test', CAST(N'2001-08-23' AS Date), N'test445@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (453, N'test446', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'446', N'Test', CAST(N'2001-08-23' AS Date), N'test446@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (454, N'test447', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'447', N'Test', CAST(N'2001-08-23' AS Date), N'test447@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (455, N'test448', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'448', N'Test', CAST(N'2001-08-23' AS Date), N'test448@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (456, N'test449', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'449', N'Test', CAST(N'2001-08-23' AS Date), N'test449@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (457, N'test450', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'450', N'Test', CAST(N'2001-08-23' AS Date), N'test450@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (458, N'test451', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'451', N'Test', CAST(N'2001-08-23' AS Date), N'test451@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (459, N'test452', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'452', N'Test', CAST(N'2001-08-23' AS Date), N'test452@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (460, N'test453', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'453', N'Test', CAST(N'2001-08-23' AS Date), N'test453@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (461, N'test454', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'454', N'Test', CAST(N'2001-08-23' AS Date), N'test454@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (462, N'test455', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'455', N'Test', CAST(N'2001-08-23' AS Date), N'test455@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (463, N'test456', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'456', N'Test', CAST(N'2001-08-23' AS Date), N'test456@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (464, N'test457', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'457', N'Test', CAST(N'2001-08-23' AS Date), N'test457@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (465, N'test458', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'458', N'Test', CAST(N'2001-08-23' AS Date), N'test458@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (466, N'test459', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'459', N'Test', CAST(N'2001-08-23' AS Date), N'test459@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (467, N'test460', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'460', N'Test', CAST(N'2001-08-23' AS Date), N'test460@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (468, N'test461', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'461', N'Test', CAST(N'2001-08-23' AS Date), N'test461@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (469, N'test462', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'462', N'Test', CAST(N'2001-08-23' AS Date), N'test462@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (470, N'test463', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'463', N'Test', CAST(N'2001-08-23' AS Date), N'test463@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (471, N'test464', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'464', N'Test', CAST(N'2001-08-23' AS Date), N'test464@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (472, N'test465', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'465', N'Test', CAST(N'2001-08-23' AS Date), N'test465@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (473, N'test466', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'466', N'Test', CAST(N'2001-08-23' AS Date), N'test466@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (474, N'test467', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'467', N'Test', CAST(N'2001-08-23' AS Date), N'test467@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (475, N'test468', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'468', N'Test', CAST(N'2001-08-23' AS Date), N'test468@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (476, N'test469', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'469', N'Test', CAST(N'2001-08-23' AS Date), N'test469@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (477, N'test470', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'470', N'Test', CAST(N'2001-08-23' AS Date), N'test470@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (478, N'test471', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'471', N'Test', CAST(N'2001-08-23' AS Date), N'test471@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (479, N'test472', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'472', N'Test', CAST(N'2001-08-23' AS Date), N'test472@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (480, N'test473', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'473', N'Test', CAST(N'2001-08-23' AS Date), N'test473@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (481, N'test474', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'474', N'Test', CAST(N'2001-08-23' AS Date), N'test474@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (482, N'test475', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'475', N'Test', CAST(N'2001-08-23' AS Date), N'test475@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (483, N'test476', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'476', N'Test', CAST(N'2001-08-23' AS Date), N'test476@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (484, N'test477', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'477', N'Test', CAST(N'2001-08-23' AS Date), N'test477@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (485, N'test478', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'478', N'Test', CAST(N'2001-08-23' AS Date), N'test478@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (486, N'test479', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'479', N'Test', CAST(N'2001-08-23' AS Date), N'test479@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (487, N'test480', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'480', N'Test', CAST(N'2001-08-23' AS Date), N'test480@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (488, N'test481', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'481', N'Test', CAST(N'2001-08-23' AS Date), N'test481@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (489, N'test482', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'482', N'Test', CAST(N'2001-08-23' AS Date), N'test482@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (490, N'test483', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'483', N'Test', CAST(N'2001-08-23' AS Date), N'test483@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (491, N'test484', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'484', N'Test', CAST(N'2001-08-23' AS Date), N'test484@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (492, N'test485', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'485', N'Test', CAST(N'2001-08-23' AS Date), N'test485@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (493, N'test486', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'486', N'Test', CAST(N'2001-08-23' AS Date), N'test486@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (494, N'test487', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'487', N'Test', CAST(N'2001-08-23' AS Date), N'test487@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (495, N'test488', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'488', N'Test', CAST(N'2001-08-23' AS Date), N'test488@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (496, N'test489', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'489', N'Test', CAST(N'2001-08-23' AS Date), N'test489@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (497, N'test490', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'490', N'Test', CAST(N'2001-08-23' AS Date), N'test490@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (498, N'test491', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'491', N'Test', CAST(N'2001-08-23' AS Date), N'test491@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (499, N'test492', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'492', N'Test', CAST(N'2001-08-23' AS Date), N'test492@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (500, N'test493', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'493', N'Test', CAST(N'2001-08-23' AS Date), N'test493@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (501, N'test494', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'494', N'Test', CAST(N'2001-08-23' AS Date), N'test494@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (502, N'test495', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'495', N'Test', CAST(N'2001-08-23' AS Date), N'test495@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (503, N'test496', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'496', N'Test', CAST(N'2001-08-23' AS Date), N'test496@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (504, N'test497', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'497', N'Test', CAST(N'2001-08-23' AS Date), N'test497@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (505, N'test498', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'498', N'Test', CAST(N'2001-08-23' AS Date), N'test498@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (506, N'test499', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'499', N'Test', CAST(N'2001-08-23' AS Date), N'test499@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (507, N'test500', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'500', N'Test', CAST(N'2001-08-23' AS Date), N'test500@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (508, N'test501', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'501', N'Test', CAST(N'2001-08-23' AS Date), N'test501@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (509, N'test502', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'502', N'Test', CAST(N'2001-08-23' AS Date), N'test502@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (510, N'test503', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'503', N'Test', CAST(N'2001-08-23' AS Date), N'test503@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (511, N'test504', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'504', N'Test', CAST(N'2001-08-23' AS Date), N'test504@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (512, N'test505', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'505', N'Test', CAST(N'2001-08-23' AS Date), N'test505@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (513, N'test506', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'506', N'Test', CAST(N'2001-08-23' AS Date), N'test506@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (514, N'test507', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'507', N'Test', CAST(N'2001-08-23' AS Date), N'test507@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (515, N'test508', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'508', N'Test', CAST(N'2001-08-23' AS Date), N'test508@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (516, N'test509', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'509', N'Test', CAST(N'2001-08-23' AS Date), N'test509@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (517, N'test510', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'510', N'Test', CAST(N'2001-08-23' AS Date), N'test510@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (518, N'test511', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'511', N'Test', CAST(N'2001-08-23' AS Date), N'test511@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (519, N'test512', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'512', N'Test', CAST(N'2001-08-23' AS Date), N'test512@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (520, N'test513', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'513', N'Test', CAST(N'2001-08-23' AS Date), N'test513@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (521, N'test514', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'514', N'Test', CAST(N'2001-08-23' AS Date), N'test514@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (522, N'test515', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'515', N'Test', CAST(N'2001-08-23' AS Date), N'test515@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (523, N'test516', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'516', N'Test', CAST(N'2001-08-23' AS Date), N'test516@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (524, N'test517', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'517', N'Test', CAST(N'2001-08-23' AS Date), N'test517@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (525, N'test518', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'518', N'Test', CAST(N'2001-08-23' AS Date), N'test518@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (526, N'test519', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'519', N'Test', CAST(N'2001-08-23' AS Date), N'test519@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (527, N'test520', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'520', N'Test', CAST(N'2001-08-23' AS Date), N'test520@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (528, N'test521', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'521', N'Test', CAST(N'2001-08-23' AS Date), N'test521@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (529, N'test522', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'522', N'Test', CAST(N'2001-08-23' AS Date), N'test522@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (530, N'test523', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'523', N'Test', CAST(N'2001-08-23' AS Date), N'test523@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (531, N'test524', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'524', N'Test', CAST(N'2001-08-23' AS Date), N'test524@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (532, N'test525', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'525', N'Test', CAST(N'2001-08-23' AS Date), N'test525@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (533, N'test526', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'526', N'Test', CAST(N'2001-08-23' AS Date), N'test526@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (534, N'test527', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'527', N'Test', CAST(N'2001-08-23' AS Date), N'test527@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (535, N'test528', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'528', N'Test', CAST(N'2001-08-23' AS Date), N'test528@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (536, N'test529', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'529', N'Test', CAST(N'2001-08-23' AS Date), N'test529@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (537, N'test530', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'530', N'Test', CAST(N'2001-08-23' AS Date), N'test530@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (538, N'test531', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'531', N'Test', CAST(N'2001-08-23' AS Date), N'test531@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (539, N'test532', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'532', N'Test', CAST(N'2001-08-23' AS Date), N'test532@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (540, N'test533', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'533', N'Test', CAST(N'2001-08-23' AS Date), N'test533@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (541, N'test534', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'534', N'Test', CAST(N'2001-08-23' AS Date), N'test534@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (542, N'test535', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'535', N'Test', CAST(N'2001-08-23' AS Date), N'test535@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (543, N'test536', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'536', N'Test', CAST(N'2001-08-23' AS Date), N'test536@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (544, N'test537', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'537', N'Test', CAST(N'2001-08-23' AS Date), N'test537@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (545, N'test538', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'538', N'Test', CAST(N'2001-08-23' AS Date), N'test538@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (546, N'test539', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'539', N'Test', CAST(N'2001-08-23' AS Date), N'test539@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (547, N'test540', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'540', N'Test', CAST(N'2001-08-23' AS Date), N'test540@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (548, N'test541', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'541', N'Test', CAST(N'2001-08-23' AS Date), N'test541@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (549, N'test542', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'542', N'Test', CAST(N'2001-08-23' AS Date), N'test542@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (550, N'test543', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'543', N'Test', CAST(N'2001-08-23' AS Date), N'test543@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (551, N'test544', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'544', N'Test', CAST(N'2001-08-23' AS Date), N'test544@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (552, N'test545', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'545', N'Test', CAST(N'2001-08-23' AS Date), N'test545@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (553, N'test546', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'546', N'Test', CAST(N'2001-08-23' AS Date), N'test546@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (554, N'test547', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'547', N'Test', CAST(N'2001-08-23' AS Date), N'test547@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (555, N'test548', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'548', N'Test', CAST(N'2001-08-23' AS Date), N'test548@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (556, N'test549', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'549', N'Test', CAST(N'2001-08-23' AS Date), N'test549@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (557, N'test550', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'550', N'Test', CAST(N'2001-08-23' AS Date), N'test550@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (558, N'test551', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'551', N'Test', CAST(N'2001-08-23' AS Date), N'test551@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (559, N'test552', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'552', N'Test', CAST(N'2001-08-23' AS Date), N'test552@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (560, N'test553', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'553', N'Test', CAST(N'2001-08-23' AS Date), N'test553@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (561, N'test554', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'554', N'Test', CAST(N'2001-08-23' AS Date), N'test554@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (562, N'test555', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'555', N'Test', CAST(N'2001-08-23' AS Date), N'test555@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (563, N'test556', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'556', N'Test', CAST(N'2001-08-23' AS Date), N'test556@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (564, N'test557', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'557', N'Test', CAST(N'2001-08-23' AS Date), N'test557@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (565, N'test558', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'558', N'Test', CAST(N'2001-08-23' AS Date), N'test558@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (566, N'test559', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'559', N'Test', CAST(N'2001-08-23' AS Date), N'test559@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (567, N'test560', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'560', N'Test', CAST(N'2001-08-23' AS Date), N'test560@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (568, N'test561', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'561', N'Test', CAST(N'2001-08-23' AS Date), N'test561@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (569, N'test562', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'562', N'Test', CAST(N'2001-08-23' AS Date), N'test562@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (570, N'test563', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'563', N'Test', CAST(N'2001-08-23' AS Date), N'test563@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (571, N'test564', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'564', N'Test', CAST(N'2001-08-23' AS Date), N'test564@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (572, N'test565', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'565', N'Test', CAST(N'2001-08-23' AS Date), N'test565@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (573, N'test566', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'566', N'Test', CAST(N'2001-08-23' AS Date), N'test566@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (574, N'test567', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'567', N'Test', CAST(N'2001-08-23' AS Date), N'test567@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (575, N'test568', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'568', N'Test', CAST(N'2001-08-23' AS Date), N'test568@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (576, N'test569', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'569', N'Test', CAST(N'2001-08-23' AS Date), N'test569@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (577, N'test570', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'570', N'Test', CAST(N'2001-08-23' AS Date), N'test570@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (578, N'test571', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'571', N'Test', CAST(N'2001-08-23' AS Date), N'test571@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (579, N'test572', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'572', N'Test', CAST(N'2001-08-23' AS Date), N'test572@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (580, N'test573', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'573', N'Test', CAST(N'2001-08-23' AS Date), N'test573@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (581, N'test574', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'574', N'Test', CAST(N'2001-08-23' AS Date), N'test574@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (582, N'test575', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'575', N'Test', CAST(N'2001-08-23' AS Date), N'test575@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (583, N'test576', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'576', N'Test', CAST(N'2001-08-23' AS Date), N'test576@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (584, N'test577', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'577', N'Test', CAST(N'2001-08-23' AS Date), N'test577@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (585, N'test578', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'578', N'Test', CAST(N'2001-08-23' AS Date), N'test578@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (586, N'test579', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'579', N'Test', CAST(N'2001-08-23' AS Date), N'test579@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (587, N'test580', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'580', N'Test', CAST(N'2001-08-23' AS Date), N'test580@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (588, N'test581', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'581', N'Test', CAST(N'2001-08-23' AS Date), N'test581@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (589, N'test582', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'582', N'Test', CAST(N'2001-08-23' AS Date), N'test582@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (590, N'test583', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'583', N'Test', CAST(N'2001-08-23' AS Date), N'test583@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (591, N'test584', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'584', N'Test', CAST(N'2001-08-23' AS Date), N'test584@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (592, N'test585', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'585', N'Test', CAST(N'2001-08-23' AS Date), N'test585@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (593, N'test586', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'586', N'Test', CAST(N'2001-08-23' AS Date), N'test586@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (594, N'test587', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'587', N'Test', CAST(N'2001-08-23' AS Date), N'test587@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (595, N'test588', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'588', N'Test', CAST(N'2001-08-23' AS Date), N'test588@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (596, N'test589', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'589', N'Test', CAST(N'2001-08-23' AS Date), N'test589@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (597, N'test590', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'590', N'Test', CAST(N'2001-08-23' AS Date), N'test590@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (598, N'test591', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'591', N'Test', CAST(N'2001-08-23' AS Date), N'test591@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (599, N'test592', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'592', N'Test', CAST(N'2001-08-23' AS Date), N'test592@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (600, N'test593', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'593', N'Test', CAST(N'2001-08-23' AS Date), N'test593@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (601, N'test594', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'594', N'Test', CAST(N'2001-08-23' AS Date), N'test594@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (602, N'test595', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'595', N'Test', CAST(N'2001-08-23' AS Date), N'test595@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (603, N'test596', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'596', N'Test', CAST(N'2001-08-23' AS Date), N'test596@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (604, N'test597', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'597', N'Test', CAST(N'2001-08-23' AS Date), N'test597@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (605, N'test598', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'598', N'Test', CAST(N'2001-08-23' AS Date), N'test598@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (606, N'test599', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'599', N'Test', CAST(N'2001-08-23' AS Date), N'test599@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (607, N'test600', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'600', N'Test', CAST(N'2001-08-23' AS Date), N'test600@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (608, N'test601', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'601', N'Test', CAST(N'2001-08-23' AS Date), N'test601@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (609, N'test602', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'602', N'Test', CAST(N'2001-08-23' AS Date), N'test602@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (610, N'test603', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'603', N'Test', CAST(N'2001-08-23' AS Date), N'test603@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (611, N'test604', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'604', N'Test', CAST(N'2001-08-23' AS Date), N'test604@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (612, N'test605', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'605', N'Test', CAST(N'2001-08-23' AS Date), N'test605@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (613, N'test606', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'606', N'Test', CAST(N'2001-08-23' AS Date), N'test606@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (614, N'test607', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'607', N'Test', CAST(N'2001-08-23' AS Date), N'test607@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (615, N'test608', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'608', N'Test', CAST(N'2001-08-23' AS Date), N'test608@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (616, N'test609', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'609', N'Test', CAST(N'2001-08-23' AS Date), N'test609@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (617, N'test610', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'610', N'Test', CAST(N'2001-08-23' AS Date), N'test610@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (618, N'test611', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'611', N'Test', CAST(N'2001-08-23' AS Date), N'test611@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (619, N'test612', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'612', N'Test', CAST(N'2001-08-23' AS Date), N'test612@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (620, N'test613', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'613', N'Test', CAST(N'2001-08-23' AS Date), N'test613@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (621, N'test614', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'614', N'Test', CAST(N'2001-08-23' AS Date), N'test614@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (622, N'test615', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'615', N'Test', CAST(N'2001-08-23' AS Date), N'test615@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (623, N'test616', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'616', N'Test', CAST(N'2001-08-23' AS Date), N'test616@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (624, N'test617', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'617', N'Test', CAST(N'2001-08-23' AS Date), N'test617@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (625, N'test618', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'618', N'Test', CAST(N'2001-08-23' AS Date), N'test618@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (626, N'test619', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'619', N'Test', CAST(N'2001-08-23' AS Date), N'test619@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (627, N'test620', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'620', N'Test', CAST(N'2001-08-23' AS Date), N'test620@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (628, N'test621', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'621', N'Test', CAST(N'2001-08-23' AS Date), N'test621@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (629, N'test622', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'622', N'Test', CAST(N'2001-08-23' AS Date), N'test622@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (630, N'test623', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'623', N'Test', CAST(N'2001-08-23' AS Date), N'test623@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (631, N'test624', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'624', N'Test', CAST(N'2001-08-23' AS Date), N'test624@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (632, N'test625', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'625', N'Test', CAST(N'2001-08-23' AS Date), N'test625@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (633, N'test626', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'626', N'Test', CAST(N'2001-08-23' AS Date), N'test626@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (634, N'test627', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'627', N'Test', CAST(N'2001-08-23' AS Date), N'test627@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (635, N'test628', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'628', N'Test', CAST(N'2001-08-23' AS Date), N'test628@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (636, N'test629', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'629', N'Test', CAST(N'2001-08-23' AS Date), N'test629@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (637, N'test630', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'630', N'Test', CAST(N'2001-08-23' AS Date), N'test630@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (638, N'test631', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'631', N'Test', CAST(N'2001-08-23' AS Date), N'test631@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (639, N'test632', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'632', N'Test', CAST(N'2001-08-23' AS Date), N'test632@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (640, N'test633', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'633', N'Test', CAST(N'2001-08-23' AS Date), N'test633@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (641, N'test634', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'634', N'Test', CAST(N'2001-08-23' AS Date), N'test634@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (642, N'test635', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'635', N'Test', CAST(N'2001-08-23' AS Date), N'test635@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (643, N'test636', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'636', N'Test', CAST(N'2001-08-23' AS Date), N'test636@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (644, N'test637', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'637', N'Test', CAST(N'2001-08-23' AS Date), N'test637@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (645, N'test638', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'638', N'Test', CAST(N'2001-08-23' AS Date), N'test638@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (646, N'test639', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'639', N'Test', CAST(N'2001-08-23' AS Date), N'test639@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (647, N'test640', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'640', N'Test', CAST(N'2001-08-23' AS Date), N'test640@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (648, N'test641', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'641', N'Test', CAST(N'2001-08-23' AS Date), N'test641@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (649, N'test642', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'642', N'Test', CAST(N'2001-08-23' AS Date), N'test642@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (650, N'test643', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'643', N'Test', CAST(N'2001-08-23' AS Date), N'test643@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (651, N'test644', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'644', N'Test', CAST(N'2001-08-23' AS Date), N'test644@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (652, N'test645', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'645', N'Test', CAST(N'2001-08-23' AS Date), N'test645@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (653, N'test646', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'646', N'Test', CAST(N'2001-08-23' AS Date), N'test646@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (654, N'test647', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'647', N'Test', CAST(N'2001-08-23' AS Date), N'test647@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (655, N'test648', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'648', N'Test', CAST(N'2001-08-23' AS Date), N'test648@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (656, N'test649', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'649', N'Test', CAST(N'2001-08-23' AS Date), N'test649@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (657, N'test650', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'650', N'Test', CAST(N'2001-08-23' AS Date), N'test650@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (658, N'test651', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'651', N'Test', CAST(N'2001-08-23' AS Date), N'test651@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (659, N'test652', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'652', N'Test', CAST(N'2001-08-23' AS Date), N'test652@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (660, N'test653', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'653', N'Test', CAST(N'2001-08-23' AS Date), N'test653@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (661, N'test654', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'654', N'Test', CAST(N'2001-08-23' AS Date), N'test654@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (662, N'test655', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'655', N'Test', CAST(N'2001-08-23' AS Date), N'test655@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (663, N'test656', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'656', N'Test', CAST(N'2001-08-23' AS Date), N'test656@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (664, N'test657', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'657', N'Test', CAST(N'2001-08-23' AS Date), N'test657@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (665, N'test658', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'658', N'Test', CAST(N'2001-08-23' AS Date), N'test658@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (666, N'test659', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'659', N'Test', CAST(N'2001-08-23' AS Date), N'test659@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (667, N'test660', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'660', N'Test', CAST(N'2001-08-23' AS Date), N'test660@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (668, N'test661', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'661', N'Test', CAST(N'2001-08-23' AS Date), N'test661@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (669, N'test662', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'662', N'Test', CAST(N'2001-08-23' AS Date), N'test662@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (670, N'test663', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'663', N'Test', CAST(N'2001-08-23' AS Date), N'test663@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (671, N'test664', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'664', N'Test', CAST(N'2001-08-23' AS Date), N'test664@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (672, N'test665', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'665', N'Test', CAST(N'2001-08-23' AS Date), N'test665@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (673, N'test666', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'666', N'Test', CAST(N'2001-08-23' AS Date), N'test666@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (674, N'test667', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'667', N'Test', CAST(N'2001-08-23' AS Date), N'test667@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (675, N'test668', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'668', N'Test', CAST(N'2001-08-23' AS Date), N'test668@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (676, N'test669', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'669', N'Test', CAST(N'2001-08-23' AS Date), N'test669@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (677, N'test670', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'670', N'Test', CAST(N'2001-08-23' AS Date), N'test670@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (678, N'test671', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'671', N'Test', CAST(N'2001-08-23' AS Date), N'test671@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (679, N'test672', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'672', N'Test', CAST(N'2001-08-23' AS Date), N'test672@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (680, N'test673', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'673', N'Test', CAST(N'2001-08-23' AS Date), N'test673@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (681, N'test674', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'674', N'Test', CAST(N'2001-08-23' AS Date), N'test674@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (682, N'test675', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'675', N'Test', CAST(N'2001-08-23' AS Date), N'test675@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (683, N'test676', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'676', N'Test', CAST(N'2001-08-23' AS Date), N'test676@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (684, N'test677', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'677', N'Test', CAST(N'2001-08-23' AS Date), N'test677@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (685, N'test678', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'678', N'Test', CAST(N'2001-08-23' AS Date), N'test678@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (686, N'test679', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'679', N'Test', CAST(N'2001-08-23' AS Date), N'test679@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (687, N'test680', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'680', N'Test', CAST(N'2001-08-23' AS Date), N'test680@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (688, N'test681', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'681', N'Test', CAST(N'2001-08-23' AS Date), N'test681@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (689, N'test682', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'682', N'Test', CAST(N'2001-08-23' AS Date), N'test682@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (690, N'test683', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'683', N'Test', CAST(N'2001-08-23' AS Date), N'test683@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (691, N'test684', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'684', N'Test', CAST(N'2001-08-23' AS Date), N'test684@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (692, N'test685', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'685', N'Test', CAST(N'2001-08-23' AS Date), N'test685@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (693, N'test686', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'686', N'Test', CAST(N'2001-08-23' AS Date), N'test686@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (694, N'test687', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'687', N'Test', CAST(N'2001-08-23' AS Date), N'test687@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (695, N'test688', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'688', N'Test', CAST(N'2001-08-23' AS Date), N'test688@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (696, N'test689', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'689', N'Test', CAST(N'2001-08-23' AS Date), N'test689@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (697, N'test690', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'690', N'Test', CAST(N'2001-08-23' AS Date), N'test690@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (698, N'test691', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'691', N'Test', CAST(N'2001-08-23' AS Date), N'test691@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (699, N'test692', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'692', N'Test', CAST(N'2001-08-23' AS Date), N'test692@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (700, N'test693', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'693', N'Test', CAST(N'2001-08-23' AS Date), N'test693@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (701, N'test694', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'694', N'Test', CAST(N'2001-08-23' AS Date), N'test694@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (702, N'test695', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'695', N'Test', CAST(N'2001-08-23' AS Date), N'test695@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (703, N'test696', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'696', N'Test', CAST(N'2001-08-23' AS Date), N'test696@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (704, N'test697', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'697', N'Test', CAST(N'2001-08-23' AS Date), N'test697@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (705, N'test698', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'698', N'Test', CAST(N'2001-08-23' AS Date), N'test698@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (706, N'test699', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'699', N'Test', CAST(N'2001-08-23' AS Date), N'test699@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (707, N'test700', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'700', N'Test', CAST(N'2001-08-23' AS Date), N'test700@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (708, N'test701', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'701', N'Test', CAST(N'2001-08-23' AS Date), N'test701@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (709, N'test702', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'702', N'Test', CAST(N'2001-08-23' AS Date), N'test702@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (710, N'test703', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'703', N'Test', CAST(N'2001-08-23' AS Date), N'test703@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (711, N'test704', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'704', N'Test', CAST(N'2001-08-23' AS Date), N'test704@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (712, N'test705', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'705', N'Test', CAST(N'2001-08-23' AS Date), N'test705@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (713, N'test706', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'706', N'Test', CAST(N'2001-08-23' AS Date), N'test706@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (714, N'test707', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'707', N'Test', CAST(N'2001-08-23' AS Date), N'test707@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (715, N'test708', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'708', N'Test', CAST(N'2001-08-23' AS Date), N'test708@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (716, N'test709', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'709', N'Test', CAST(N'2001-08-23' AS Date), N'test709@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (717, N'test710', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'710', N'Test', CAST(N'2001-08-23' AS Date), N'test710@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (718, N'test711', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'711', N'Test', CAST(N'2001-08-23' AS Date), N'test711@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (719, N'test712', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'712', N'Test', CAST(N'2001-08-23' AS Date), N'test712@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (720, N'test713', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'713', N'Test', CAST(N'2001-08-23' AS Date), N'test713@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (721, N'test714', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'714', N'Test', CAST(N'2001-08-23' AS Date), N'test714@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (722, N'test715', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'715', N'Test', CAST(N'2001-08-23' AS Date), N'test715@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (723, N'test716', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'716', N'Test', CAST(N'2001-08-23' AS Date), N'test716@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (724, N'test717', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'717', N'Test', CAST(N'2001-08-23' AS Date), N'test717@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (725, N'test718', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'718', N'Test', CAST(N'2001-08-23' AS Date), N'test718@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (726, N'test719', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'719', N'Test', CAST(N'2001-08-23' AS Date), N'test719@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (727, N'test720', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'720', N'Test', CAST(N'2001-08-23' AS Date), N'test720@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (728, N'test721', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'721', N'Test', CAST(N'2001-08-23' AS Date), N'test721@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (729, N'test722', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'722', N'Test', CAST(N'2001-08-23' AS Date), N'test722@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (730, N'test723', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'723', N'Test', CAST(N'2001-08-23' AS Date), N'test723@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (731, N'test724', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'724', N'Test', CAST(N'2001-08-23' AS Date), N'test724@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (732, N'test725', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'725', N'Test', CAST(N'2001-08-23' AS Date), N'test725@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (733, N'test726', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'726', N'Test', CAST(N'2001-08-23' AS Date), N'test726@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (734, N'test727', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'727', N'Test', CAST(N'2001-08-23' AS Date), N'test727@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (735, N'test728', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'728', N'Test', CAST(N'2001-08-23' AS Date), N'test728@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (736, N'test729', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'729', N'Test', CAST(N'2001-08-23' AS Date), N'test729@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (737, N'test730', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'730', N'Test', CAST(N'2001-08-23' AS Date), N'test730@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (738, N'test731', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'731', N'Test', CAST(N'2001-08-23' AS Date), N'test731@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (739, N'test732', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'732', N'Test', CAST(N'2001-08-23' AS Date), N'test732@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (740, N'test733', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'733', N'Test', CAST(N'2001-08-23' AS Date), N'test733@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (741, N'test734', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'734', N'Test', CAST(N'2001-08-23' AS Date), N'test734@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (742, N'test735', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'735', N'Test', CAST(N'2001-08-23' AS Date), N'test735@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (743, N'test736', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'736', N'Test', CAST(N'2001-08-23' AS Date), N'test736@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (744, N'test737', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'737', N'Test', CAST(N'2001-08-23' AS Date), N'test737@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (745, N'test738', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'738', N'Test', CAST(N'2001-08-23' AS Date), N'test738@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (746, N'test739', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'739', N'Test', CAST(N'2001-08-23' AS Date), N'test739@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (747, N'test740', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'740', N'Test', CAST(N'2001-08-23' AS Date), N'test740@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (748, N'test741', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'741', N'Test', CAST(N'2001-08-23' AS Date), N'test741@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (749, N'test742', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'742', N'Test', CAST(N'2001-08-23' AS Date), N'test742@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (750, N'test743', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'743', N'Test', CAST(N'2001-08-23' AS Date), N'test743@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (751, N'test744', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'744', N'Test', CAST(N'2001-08-23' AS Date), N'test744@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (752, N'test745', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'745', N'Test', CAST(N'2001-08-23' AS Date), N'test745@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (753, N'test746', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'746', N'Test', CAST(N'2001-08-23' AS Date), N'test746@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (754, N'test747', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'747', N'Test', CAST(N'2001-08-23' AS Date), N'test747@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (755, N'test748', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'748', N'Test', CAST(N'2001-08-23' AS Date), N'test748@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (756, N'test749', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'749', N'Test', CAST(N'2001-08-23' AS Date), N'test749@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (757, N'test750', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'750', N'Test', CAST(N'2001-08-23' AS Date), N'test750@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (758, N'test751', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'751', N'Test', CAST(N'2001-08-23' AS Date), N'test751@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (759, N'test752', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'752', N'Test', CAST(N'2001-08-23' AS Date), N'test752@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (760, N'test753', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'753', N'Test', CAST(N'2001-08-23' AS Date), N'test753@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (761, N'test754', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'754', N'Test', CAST(N'2001-08-23' AS Date), N'test754@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (762, N'test755', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'755', N'Test', CAST(N'2001-08-23' AS Date), N'test755@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (763, N'test756', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'756', N'Test', CAST(N'2001-08-23' AS Date), N'test756@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (764, N'test757', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'757', N'Test', CAST(N'2001-08-23' AS Date), N'test757@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (765, N'test758', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'758', N'Test', CAST(N'2001-08-23' AS Date), N'test758@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (766, N'test759', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'759', N'Test', CAST(N'2001-08-23' AS Date), N'test759@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (767, N'test760', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'760', N'Test', CAST(N'2001-08-23' AS Date), N'test760@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (768, N'test761', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'761', N'Test', CAST(N'2001-08-23' AS Date), N'test761@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (769, N'test762', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'762', N'Test', CAST(N'2001-08-23' AS Date), N'test762@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (770, N'test763', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'763', N'Test', CAST(N'2001-08-23' AS Date), N'test763@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (771, N'test764', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'764', N'Test', CAST(N'2001-08-23' AS Date), N'test764@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (772, N'test765', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'765', N'Test', CAST(N'2001-08-23' AS Date), N'test765@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (773, N'test766', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'766', N'Test', CAST(N'2001-08-23' AS Date), N'test766@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (774, N'test767', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'767', N'Test', CAST(N'2001-08-23' AS Date), N'test767@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (775, N'test768', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'768', N'Test', CAST(N'2001-08-23' AS Date), N'test768@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (776, N'test769', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'769', N'Test', CAST(N'2001-08-23' AS Date), N'test769@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (777, N'test770', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'770', N'Test', CAST(N'2001-08-23' AS Date), N'test770@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (778, N'test771', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'771', N'Test', CAST(N'2001-08-23' AS Date), N'test771@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (779, N'test772', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'772', N'Test', CAST(N'2001-08-23' AS Date), N'test772@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (780, N'test773', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'773', N'Test', CAST(N'2001-08-23' AS Date), N'test773@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (781, N'test774', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'774', N'Test', CAST(N'2001-08-23' AS Date), N'test774@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (782, N'test775', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'775', N'Test', CAST(N'2001-08-23' AS Date), N'test775@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (783, N'test776', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'776', N'Test', CAST(N'2001-08-23' AS Date), N'test776@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (784, N'test777', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'777', N'Test', CAST(N'2001-08-23' AS Date), N'test777@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (785, N'test778', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'778', N'Test', CAST(N'2001-08-23' AS Date), N'test778@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (786, N'test779', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'779', N'Test', CAST(N'2001-08-23' AS Date), N'test779@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (787, N'test780', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'780', N'Test', CAST(N'2001-08-23' AS Date), N'test780@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (788, N'test781', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'781', N'Test', CAST(N'2001-08-23' AS Date), N'test781@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (789, N'test782', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'782', N'Test', CAST(N'2001-08-23' AS Date), N'test782@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (790, N'test783', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'783', N'Test', CAST(N'2001-08-23' AS Date), N'test783@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (791, N'test784', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'784', N'Test', CAST(N'2001-08-23' AS Date), N'test784@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (792, N'test785', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'785', N'Test', CAST(N'2001-08-23' AS Date), N'test785@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (793, N'test786', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'786', N'Test', CAST(N'2001-08-23' AS Date), N'test786@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (794, N'test787', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'787', N'Test', CAST(N'2001-08-23' AS Date), N'test787@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (795, N'test788', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'788', N'Test', CAST(N'2001-08-23' AS Date), N'test788@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (796, N'test789', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'789', N'Test', CAST(N'2001-08-23' AS Date), N'test789@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (797, N'test790', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'790', N'Test', CAST(N'2001-08-23' AS Date), N'test790@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (798, N'test791', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'791', N'Test', CAST(N'2001-08-23' AS Date), N'test791@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (799, N'test792', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'792', N'Test', CAST(N'2001-08-23' AS Date), N'test792@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (800, N'test793', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'793', N'Test', CAST(N'2001-08-23' AS Date), N'test793@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (801, N'test794', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'794', N'Test', CAST(N'2001-08-23' AS Date), N'test794@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (802, N'test795', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'795', N'Test', CAST(N'2001-08-23' AS Date), N'test795@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (803, N'test796', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'796', N'Test', CAST(N'2001-08-23' AS Date), N'test796@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (804, N'test797', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'797', N'Test', CAST(N'2001-08-23' AS Date), N'test797@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (805, N'test798', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'798', N'Test', CAST(N'2001-08-23' AS Date), N'test798@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (806, N'test799', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'799', N'Test', CAST(N'2001-08-23' AS Date), N'test799@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (807, N'test800', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'800', N'Test', CAST(N'2001-08-23' AS Date), N'test800@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (808, N'test801', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'801', N'Test', CAST(N'2001-08-23' AS Date), N'test801@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (809, N'test802', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'802', N'Test', CAST(N'2001-08-23' AS Date), N'test802@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (810, N'test803', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'803', N'Test', CAST(N'2001-08-23' AS Date), N'test803@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (811, N'test804', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'804', N'Test', CAST(N'2001-08-23' AS Date), N'test804@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (812, N'test805', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'805', N'Test', CAST(N'2001-08-23' AS Date), N'test805@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (813, N'test806', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'806', N'Test', CAST(N'2001-08-23' AS Date), N'test806@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (814, N'test807', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'807', N'Test', CAST(N'2001-08-23' AS Date), N'test807@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (815, N'test808', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'808', N'Test', CAST(N'2001-08-23' AS Date), N'test808@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (816, N'test809', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'809', N'Test', CAST(N'2001-08-23' AS Date), N'test809@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (817, N'test810', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'810', N'Test', CAST(N'2001-08-23' AS Date), N'test810@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (818, N'test811', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'811', N'Test', CAST(N'2001-08-23' AS Date), N'test811@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (819, N'test812', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'812', N'Test', CAST(N'2001-08-23' AS Date), N'test812@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (820, N'test813', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'813', N'Test', CAST(N'2001-08-23' AS Date), N'test813@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (821, N'test814', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'814', N'Test', CAST(N'2001-08-23' AS Date), N'test814@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (822, N'test815', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'815', N'Test', CAST(N'2001-08-23' AS Date), N'test815@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (823, N'test816', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'816', N'Test', CAST(N'2001-08-23' AS Date), N'test816@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (824, N'test817', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'817', N'Test', CAST(N'2001-08-23' AS Date), N'test817@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (825, N'test818', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'818', N'Test', CAST(N'2001-08-23' AS Date), N'test818@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (826, N'test819', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'819', N'Test', CAST(N'2001-08-23' AS Date), N'test819@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (827, N'test820', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'820', N'Test', CAST(N'2001-08-23' AS Date), N'test820@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (828, N'test821', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'821', N'Test', CAST(N'2001-08-23' AS Date), N'test821@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (829, N'test822', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'822', N'Test', CAST(N'2001-08-23' AS Date), N'test822@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (830, N'test823', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'823', N'Test', CAST(N'2001-08-23' AS Date), N'test823@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (831, N'test824', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'824', N'Test', CAST(N'2001-08-23' AS Date), N'test824@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (832, N'test825', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'825', N'Test', CAST(N'2001-08-23' AS Date), N'test825@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (833, N'test826', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'826', N'Test', CAST(N'2001-08-23' AS Date), N'test826@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (834, N'test827', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'827', N'Test', CAST(N'2001-08-23' AS Date), N'test827@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (835, N'test828', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'828', N'Test', CAST(N'2001-08-23' AS Date), N'test828@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (836, N'test829', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'829', N'Test', CAST(N'2001-08-23' AS Date), N'test829@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (837, N'test830', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'830', N'Test', CAST(N'2001-08-23' AS Date), N'test830@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (838, N'test831', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'831', N'Test', CAST(N'2001-08-23' AS Date), N'test831@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (839, N'test832', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'832', N'Test', CAST(N'2001-08-23' AS Date), N'test832@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (840, N'test833', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'833', N'Test', CAST(N'2001-08-23' AS Date), N'test833@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (841, N'test834', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'834', N'Test', CAST(N'2001-08-23' AS Date), N'test834@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (842, N'test835', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'835', N'Test', CAST(N'2001-08-23' AS Date), N'test835@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (843, N'test836', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'836', N'Test', CAST(N'2001-08-23' AS Date), N'test836@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (844, N'test837', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'837', N'Test', CAST(N'2001-08-23' AS Date), N'test837@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (845, N'test838', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'838', N'Test', CAST(N'2001-08-23' AS Date), N'test838@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (846, N'test839', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'839', N'Test', CAST(N'2001-08-23' AS Date), N'test839@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (847, N'test840', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'840', N'Test', CAST(N'2001-08-23' AS Date), N'test840@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (848, N'test841', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'841', N'Test', CAST(N'2001-08-23' AS Date), N'test841@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (849, N'test842', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'842', N'Test', CAST(N'2001-08-23' AS Date), N'test842@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (850, N'test843', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'843', N'Test', CAST(N'2001-08-23' AS Date), N'test843@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (851, N'test844', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'844', N'Test', CAST(N'2001-08-23' AS Date), N'test844@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (852, N'test845', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'845', N'Test', CAST(N'2001-08-23' AS Date), N'test845@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (853, N'test846', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'846', N'Test', CAST(N'2001-08-23' AS Date), N'test846@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (854, N'test847', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'847', N'Test', CAST(N'2001-08-23' AS Date), N'test847@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (855, N'test848', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'848', N'Test', CAST(N'2001-08-23' AS Date), N'test848@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (856, N'test849', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'849', N'Test', CAST(N'2001-08-23' AS Date), N'test849@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (857, N'test850', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'850', N'Test', CAST(N'2001-08-23' AS Date), N'test850@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (858, N'test851', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'851', N'Test', CAST(N'2001-08-23' AS Date), N'test851@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (859, N'test852', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'852', N'Test', CAST(N'2001-08-23' AS Date), N'test852@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (860, N'test853', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'853', N'Test', CAST(N'2001-08-23' AS Date), N'test853@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (861, N'test854', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'854', N'Test', CAST(N'2001-08-23' AS Date), N'test854@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (862, N'test855', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'855', N'Test', CAST(N'2001-08-23' AS Date), N'test855@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (863, N'test856', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'856', N'Test', CAST(N'2001-08-23' AS Date), N'test856@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (864, N'test857', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'857', N'Test', CAST(N'2001-08-23' AS Date), N'test857@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (865, N'test858', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'858', N'Test', CAST(N'2001-08-23' AS Date), N'test858@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (866, N'test859', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'859', N'Test', CAST(N'2001-08-23' AS Date), N'test859@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (867, N'test860', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'860', N'Test', CAST(N'2001-08-23' AS Date), N'test860@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (868, N'test861', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'861', N'Test', CAST(N'2001-08-23' AS Date), N'test861@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (869, N'test862', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'862', N'Test', CAST(N'2001-08-23' AS Date), N'test862@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (870, N'test863', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'863', N'Test', CAST(N'2001-08-23' AS Date), N'test863@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (871, N'test864', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'864', N'Test', CAST(N'2001-08-23' AS Date), N'test864@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (872, N'test865', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'865', N'Test', CAST(N'2001-08-23' AS Date), N'test865@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (873, N'test866', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'866', N'Test', CAST(N'2001-08-23' AS Date), N'test866@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (874, N'test867', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'867', N'Test', CAST(N'2001-08-23' AS Date), N'test867@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (875, N'test868', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'868', N'Test', CAST(N'2001-08-23' AS Date), N'test868@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (876, N'test869', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'869', N'Test', CAST(N'2001-08-23' AS Date), N'test869@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (877, N'test870', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'870', N'Test', CAST(N'2001-08-23' AS Date), N'test870@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (878, N'test871', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'871', N'Test', CAST(N'2001-08-23' AS Date), N'test871@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (879, N'test872', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'872', N'Test', CAST(N'2001-08-23' AS Date), N'test872@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (880, N'test873', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'873', N'Test', CAST(N'2001-08-23' AS Date), N'test873@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (881, N'test874', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'874', N'Test', CAST(N'2001-08-23' AS Date), N'test874@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (882, N'test875', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'875', N'Test', CAST(N'2001-08-23' AS Date), N'test875@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (883, N'test876', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'876', N'Test', CAST(N'2001-08-23' AS Date), N'test876@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (884, N'test877', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'877', N'Test', CAST(N'2001-08-23' AS Date), N'test877@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (885, N'test878', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'878', N'Test', CAST(N'2001-08-23' AS Date), N'test878@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (886, N'test879', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'879', N'Test', CAST(N'2001-08-23' AS Date), N'test879@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (887, N'test880', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'880', N'Test', CAST(N'2001-08-23' AS Date), N'test880@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (888, N'test881', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'881', N'Test', CAST(N'2001-08-23' AS Date), N'test881@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (889, N'test882', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'882', N'Test', CAST(N'2001-08-23' AS Date), N'test882@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (890, N'test883', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'883', N'Test', CAST(N'2001-08-23' AS Date), N'test883@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (891, N'test884', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'884', N'Test', CAST(N'2001-08-23' AS Date), N'test884@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (892, N'test885', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'885', N'Test', CAST(N'2001-08-23' AS Date), N'test885@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (893, N'test886', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'886', N'Test', CAST(N'2001-08-23' AS Date), N'test886@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (894, N'test887', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'887', N'Test', CAST(N'2001-08-23' AS Date), N'test887@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (895, N'test888', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'888', N'Test', CAST(N'2001-08-23' AS Date), N'test888@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (896, N'test889', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'889', N'Test', CAST(N'2001-08-23' AS Date), N'test889@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (897, N'test890', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'890', N'Test', CAST(N'2001-08-23' AS Date), N'test890@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (898, N'test891', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'891', N'Test', CAST(N'2001-08-23' AS Date), N'test891@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (899, N'test892', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'892', N'Test', CAST(N'2001-08-23' AS Date), N'test892@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (900, N'test893', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'893', N'Test', CAST(N'2001-08-23' AS Date), N'test893@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (901, N'test894', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'894', N'Test', CAST(N'2001-08-23' AS Date), N'test894@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (902, N'test895', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'895', N'Test', CAST(N'2001-08-23' AS Date), N'test895@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (903, N'test896', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'896', N'Test', CAST(N'2001-08-23' AS Date), N'test896@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (904, N'test897', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'897', N'Test', CAST(N'2001-08-23' AS Date), N'test897@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (905, N'test898', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'898', N'Test', CAST(N'2001-08-23' AS Date), N'test898@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (906, N'test899', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'899', N'Test', CAST(N'2001-08-23' AS Date), N'test899@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (907, N'test900', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'900', N'Test', CAST(N'2001-08-23' AS Date), N'test900@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (908, N'test901', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'901', N'Test', CAST(N'2001-08-23' AS Date), N'test901@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (909, N'test902', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'902', N'Test', CAST(N'2001-08-23' AS Date), N'test902@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (910, N'test903', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'903', N'Test', CAST(N'2001-08-23' AS Date), N'test903@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (911, N'test904', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'904', N'Test', CAST(N'2001-08-23' AS Date), N'test904@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (912, N'test905', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'905', N'Test', CAST(N'2001-08-23' AS Date), N'test905@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (913, N'test906', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'906', N'Test', CAST(N'2001-08-23' AS Date), N'test906@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (914, N'test907', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'907', N'Test', CAST(N'2001-08-23' AS Date), N'test907@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (915, N'test908', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'908', N'Test', CAST(N'2001-08-23' AS Date), N'test908@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (916, N'test909', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'909', N'Test', CAST(N'2001-08-23' AS Date), N'test909@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (917, N'test910', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'910', N'Test', CAST(N'2001-08-23' AS Date), N'test910@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (918, N'test911', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'911', N'Test', CAST(N'2001-08-23' AS Date), N'test911@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (919, N'test912', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'912', N'Test', CAST(N'2001-08-23' AS Date), N'test912@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (920, N'test913', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'913', N'Test', CAST(N'2001-08-23' AS Date), N'test913@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (921, N'test914', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'914', N'Test', CAST(N'2001-08-23' AS Date), N'test914@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (922, N'test915', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'915', N'Test', CAST(N'2001-08-23' AS Date), N'test915@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (923, N'test916', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'916', N'Test', CAST(N'2001-08-23' AS Date), N'test916@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (924, N'test917', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'917', N'Test', CAST(N'2001-08-23' AS Date), N'test917@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (925, N'test918', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'918', N'Test', CAST(N'2001-08-23' AS Date), N'test918@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (926, N'test919', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'919', N'Test', CAST(N'2001-08-23' AS Date), N'test919@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (927, N'test920', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'920', N'Test', CAST(N'2001-08-23' AS Date), N'test920@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (928, N'test921', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'921', N'Test', CAST(N'2001-08-23' AS Date), N'test921@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (929, N'test922', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'922', N'Test', CAST(N'2001-08-23' AS Date), N'test922@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (930, N'test923', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'923', N'Test', CAST(N'2001-08-23' AS Date), N'test923@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (931, N'test924', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'924', N'Test', CAST(N'2001-08-23' AS Date), N'test924@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (932, N'test925', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'925', N'Test', CAST(N'2001-08-23' AS Date), N'test925@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (933, N'test926', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'926', N'Test', CAST(N'2001-08-23' AS Date), N'test926@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (934, N'test927', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'927', N'Test', CAST(N'2001-08-23' AS Date), N'test927@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (935, N'test928', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'928', N'Test', CAST(N'2001-08-23' AS Date), N'test928@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (936, N'test929', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'929', N'Test', CAST(N'2001-08-23' AS Date), N'test929@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (937, N'test930', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'930', N'Test', CAST(N'2001-08-23' AS Date), N'test930@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (938, N'test931', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'931', N'Test', CAST(N'2001-08-23' AS Date), N'test931@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (939, N'test932', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'932', N'Test', CAST(N'2001-08-23' AS Date), N'test932@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (940, N'test933', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'933', N'Test', CAST(N'2001-08-23' AS Date), N'test933@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (941, N'test934', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'934', N'Test', CAST(N'2001-08-23' AS Date), N'test934@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (942, N'test935', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'935', N'Test', CAST(N'2001-08-23' AS Date), N'test935@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (943, N'test936', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'936', N'Test', CAST(N'2001-08-23' AS Date), N'test936@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (944, N'test937', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'937', N'Test', CAST(N'2001-08-23' AS Date), N'test937@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (945, N'test938', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'938', N'Test', CAST(N'2001-08-23' AS Date), N'test938@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (946, N'test939', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'939', N'Test', CAST(N'2001-08-23' AS Date), N'test939@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (947, N'test940', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'940', N'Test', CAST(N'2001-08-23' AS Date), N'test940@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (948, N'test941', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'941', N'Test', CAST(N'2001-08-23' AS Date), N'test941@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (949, N'test942', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'942', N'Test', CAST(N'2001-08-23' AS Date), N'test942@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (950, N'test943', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'943', N'Test', CAST(N'2001-08-23' AS Date), N'test943@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (951, N'test944', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'944', N'Test', CAST(N'2001-08-23' AS Date), N'test944@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (952, N'test945', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'945', N'Test', CAST(N'2001-08-23' AS Date), N'test945@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (953, N'test946', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'946', N'Test', CAST(N'2001-08-23' AS Date), N'test946@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (954, N'test947', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'947', N'Test', CAST(N'2001-08-23' AS Date), N'test947@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (955, N'test948', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'948', N'Test', CAST(N'2001-08-23' AS Date), N'test948@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (956, N'test949', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'949', N'Test', CAST(N'2001-08-23' AS Date), N'test949@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (957, N'test950', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'950', N'Test', CAST(N'2001-08-23' AS Date), N'test950@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (958, N'test951', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'951', N'Test', CAST(N'2001-08-23' AS Date), N'test951@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (959, N'test952', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'952', N'Test', CAST(N'2001-08-23' AS Date), N'test952@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (960, N'test953', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'953', N'Test', CAST(N'2001-08-23' AS Date), N'test953@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (961, N'test954', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'954', N'Test', CAST(N'2001-08-23' AS Date), N'test954@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (962, N'test955', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'955', N'Test', CAST(N'2001-08-23' AS Date), N'test955@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (963, N'test956', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'956', N'Test', CAST(N'2001-08-23' AS Date), N'test956@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (964, N'test957', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'957', N'Test', CAST(N'2001-08-23' AS Date), N'test957@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (965, N'test958', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'958', N'Test', CAST(N'2001-08-23' AS Date), N'test958@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (966, N'test959', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'959', N'Test', CAST(N'2001-08-23' AS Date), N'test959@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (967, N'test960', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'960', N'Test', CAST(N'2001-08-23' AS Date), N'test960@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (968, N'test961', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'961', N'Test', CAST(N'2001-08-23' AS Date), N'test961@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (969, N'test962', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'962', N'Test', CAST(N'2001-08-23' AS Date), N'test962@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (970, N'test963', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'963', N'Test', CAST(N'2001-08-23' AS Date), N'test963@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (971, N'test964', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'964', N'Test', CAST(N'2001-08-23' AS Date), N'test964@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (972, N'test965', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'965', N'Test', CAST(N'2001-08-23' AS Date), N'test965@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (973, N'test966', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'966', N'Test', CAST(N'2001-08-23' AS Date), N'test966@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (974, N'test967', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'967', N'Test', CAST(N'2001-08-23' AS Date), N'test967@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (975, N'test968', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'968', N'Test', CAST(N'2001-08-23' AS Date), N'test968@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (976, N'test969', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'969', N'Test', CAST(N'2001-08-23' AS Date), N'test969@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (977, N'test970', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'970', N'Test', CAST(N'2001-08-23' AS Date), N'test970@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (978, N'test971', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'971', N'Test', CAST(N'2001-08-23' AS Date), N'test971@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (979, N'test972', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'972', N'Test', CAST(N'2001-08-23' AS Date), N'test972@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (980, N'test973', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'973', N'Test', CAST(N'2001-08-23' AS Date), N'test973@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (981, N'test974', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'974', N'Test', CAST(N'2001-08-23' AS Date), N'test974@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (982, N'test975', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'975', N'Test', CAST(N'2001-08-23' AS Date), N'test975@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (983, N'test976', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'976', N'Test', CAST(N'2001-08-23' AS Date), N'test976@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (984, N'test977', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'977', N'Test', CAST(N'2001-08-23' AS Date), N'test977@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (985, N'test978', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'978', N'Test', CAST(N'2001-08-23' AS Date), N'test978@gmail.com', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-02-12T22:43:59.877' AS DateTime), CAST(N'2022-02-23T23:37:59.753' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (1016, N'giakinh08232001', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'Kính', N'Hà Gia', CAST(N'2022-02-10' AS Date), N'giakinh2001@gmail.com', N'+84972141556', 1, 0, 1, N'user', CAST(N'2022-02-26T13:22:01.323' AS DateTime), CAST(N'2022-02-26T13:22:01.323' AS DateTime), NULL)
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (1021, N'giakinhfullstack', N'8C29CADC8781CE45B26752B996F12B5901E2E9521EF8FCC48BBF01E17D7955F8', N'Kính', N'Hà Gia', CAST(N'2001-03-07' AS Date), N'giakinhfullstack@gmail.com', N'+84972141556', 1, 0, 1, N'user', CAST(N'2022-03-09T23:41:02.977' AS DateTime), CAST(N'2022-03-09T23:41:29.733' AS DateTime), N'943965645-274520968_5559444394072528_1376914856578898947_n-(1).jpg')
GO
INSERT [dbo].[user] ([id], [username], [password], [first_name], [last_name], [birthday], [email], [phone], [gender], [is_super], [is_active], [permission], [created_at], [updated_at], [avatar]) VALUES (1030, N'lanh0308', N'5CA91616403770D06B3144EFFDE425B30BD2A749BB9178C8090B0DFF1292E593', N'Kính', N'Hà Gia', CAST(N'2001-08-23' AS Date), N'kinhhghe153111@fpt.edu.vn', N'0972141556', 1, 0, 1, N'user', CAST(N'2022-03-12T03:33:41.777' AS DateTime), CAST(N'2022-03-13T00:26:49.930' AS DateTime), N'blogImg.jpg')
GO
SET IDENTITY_INSERT [dbo].[user] OFF
GO
SET IDENTITY_INSERT [dbo].[user_permission] ON 
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (10, 1, 11, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (13, 1, 14, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (16, 1, 17, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (17, 1, 18, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (19, 1, 20, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (20, 1, 21, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (22, 1, 23, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (23, 1, 24, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (25, 1, 26, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (27, 1, 28, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (34, 1, 35, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (35, 1, 36, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (36, 1, 37, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (37, 1, 38, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (38, 1, 39, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (40, 1, 41, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (41, 1, 42, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (42, 1, 43, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (43, 1, 44, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (44, 1, 45, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (49, 1, 50, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (50, 1, 51, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (51, 1, 52, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (54, 1, 55, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (56, 1, 57, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (57, 1, 58, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (58, 1, 59, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (59, 1, 60, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (60, 1, 61, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (61, 1, 62, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (62, 1, 63, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (63, 1, 64, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (64, 1, 65, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (65, 1, 66, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (66, 1, 67, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (67, 1, 68, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (68, 1, 69, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (69, 1, 70, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (70, 1, 71, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (71, 1, 72, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (72, 1, 73, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (73, 1, 74, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (74, 1, 75, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (75, 1, 76, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (76, 1, 77, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (81, 1, 82, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (84, 1, 85, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (85, 1, 86, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (87, 1, 88, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (88, 1, 89, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (89, 1, 90, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (90, 1, 91, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (91, 1, 92, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (92, 1, 93, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (93, 1, 94, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (94, 1, 95, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (95, 1, 96, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (96, 1, 97, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (99, 1, 100, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (103, 1, 104, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (104, 1, 105, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (105, 1, 106, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (106, 1, 107, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (107, 1, 108, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (109, 1, 110, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (110, 1, 111, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (111, 1, 112, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (112, 1, 113, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (114, 1, 115, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (115, 1, 116, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (116, 1, 117, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (117, 1, 118, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (118, 1, 119, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (119, 1, 120, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (120, 1, 121, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (121, 1, 122, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (122, 1, 123, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (123, 1, 124, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (124, 1, 125, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (125, 1, 126, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (126, 1, 127, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (127, 1, 128, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (128, 1, 129, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (129, 1, 130, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (130, 1, 131, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (133, 1, 134, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (134, 1, 135, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (135, 1, 136, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (136, 1, 137, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (139, 1, 140, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (140, 1, 141, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (141, 1, 142, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (142, 1, 143, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (143, 1, 144, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (144, 1, 145, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (145, 1, 146, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (146, 1, 147, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (147, 1, 148, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (148, 1, 149, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (149, 1, 150, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (150, 1, 151, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (151, 1, 152, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (152, 1, 153, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (153, 1, 154, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (154, 1, 155, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (155, 1, 156, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (156, 1, 157, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (157, 1, 158, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (158, 1, 159, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (159, 1, 160, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (160, 1, 161, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (161, 1, 162, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (162, 1, 163, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (163, 1, 164, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (164, 1, 165, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (165, 1, 166, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (166, 1, 167, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (167, 1, 168, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (168, 1, 169, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (169, 1, 170, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (170, 1, 171, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (171, 1, 172, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (172, 1, 173, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (173, 1, 174, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (174, 1, 175, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (175, 1, 176, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (176, 1, 177, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (180, 1, 181, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (181, 1, 182, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (182, 1, 183, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (183, 1, 184, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (184, 1, 185, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (185, 1, 186, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (186, 1, 187, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (187, 1, 188, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (188, 1, 189, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (189, 1, 190, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (190, 1, 191, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (191, 1, 192, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (192, 1, 193, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (194, 1, 195, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (195, 1, 196, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (196, 1, 197, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (197, 1, 198, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (198, 1, 199, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (199, 1, 200, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (200, 1, 201, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (201, 1, 202, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (202, 1, 203, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (203, 1, 204, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (204, 1, 205, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (205, 1, 206, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (206, 1, 207, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (207, 1, 208, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (208, 1, 209, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (209, 1, 210, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (210, 1, 211, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (211, 1, 212, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (212, 1, 213, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (213, 1, 214, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (214, 1, 215, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (215, 1, 216, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (216, 1, 217, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (217, 1, 218, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (218, 1, 219, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (219, 1, 220, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (220, 1, 221, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (221, 1, 222, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (222, 1, 223, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (223, 1, 224, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (224, 1, 225, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (225, 1, 226, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (226, 1, 227, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (227, 1, 228, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (228, 1, 229, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (229, 1, 230, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (230, 1, 231, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (231, 1, 232, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (232, 1, 233, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (233, 1, 234, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (234, 1, 235, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (235, 1, 236, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (236, 1, 237, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (237, 1, 238, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (238, 1, 239, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (239, 1, 240, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (240, 1, 241, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (241, 1, 242, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (242, 1, 243, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (243, 1, 244, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (244, 1, 245, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (245, 1, 246, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (246, 1, 247, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (247, 1, 248, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (248, 1, 249, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (249, 1, 250, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (250, 1, 251, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (251, 1, 252, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (252, 1, 253, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (253, 1, 254, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (254, 1, 255, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (255, 1, 256, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (256, 1, 257, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (257, 1, 258, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (258, 1, 259, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (259, 1, 260, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (260, 1, 261, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (261, 1, 262, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (262, 1, 263, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (263, 1, 264, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (264, 1, 265, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (265, 1, 266, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (266, 1, 267, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (267, 1, 268, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (268, 1, 269, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (269, 1, 270, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (270, 1, 271, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (271, 1, 272, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (272, 1, 273, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (273, 1, 274, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (274, 1, 275, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (275, 1, 276, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (276, 1, 277, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (277, 1, 278, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (278, 1, 279, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (279, 1, 280, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (280, 1, 281, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (281, 1, 282, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (282, 1, 283, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (283, 1, 284, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (284, 1, 285, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (285, 1, 286, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (286, 1, 287, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (287, 1, 288, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (288, 1, 289, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (289, 1, 290, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (290, 1, 291, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (291, 1, 292, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (292, 1, 293, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (293, 1, 294, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (294, 1, 295, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (295, 1, 296, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (296, 1, 297, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (297, 1, 298, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (298, 1, 299, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (299, 1, 300, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (300, 1, 301, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (301, 1, 302, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (302, 1, 303, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (303, 1, 304, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (304, 1, 305, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (305, 1, 306, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (306, 1, 307, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (307, 1, 308, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (308, 1, 309, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (309, 1, 310, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (310, 1, 311, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (311, 1, 312, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (312, 1, 313, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (313, 1, 314, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (314, 1, 315, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (315, 1, 316, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (316, 1, 317, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (317, 1, 318, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (318, 1, 319, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (319, 1, 320, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (320, 1, 321, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (321, 1, 322, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (322, 1, 323, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (323, 1, 324, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (324, 1, 325, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (325, 1, 326, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (326, 1, 327, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (327, 1, 328, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (328, 1, 329, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (329, 1, 330, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (330, 1, 331, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (331, 1, 332, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (332, 1, 333, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (333, 1, 334, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (334, 1, 335, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (335, 1, 336, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (336, 1, 337, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (337, 1, 338, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (338, 1, 339, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (339, 1, 340, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (340, 1, 341, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (341, 1, 342, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (342, 1, 343, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (343, 1, 344, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (344, 1, 345, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (345, 1, 346, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (346, 1, 347, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (347, 1, 348, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (348, 1, 349, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (349, 1, 350, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (350, 1, 351, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (351, 1, 352, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (352, 1, 353, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (353, 1, 354, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (354, 1, 355, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (355, 1, 356, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (356, 1, 357, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (357, 1, 358, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (358, 1, 359, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (359, 1, 360, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (360, 1, 361, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (361, 1, 362, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (362, 1, 363, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (363, 1, 364, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (364, 1, 365, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (365, 1, 366, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (366, 1, 367, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (367, 1, 368, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (368, 1, 369, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (369, 1, 370, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (370, 1, 371, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (371, 1, 372, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (372, 1, 373, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (373, 1, 374, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (374, 1, 375, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (375, 1, 376, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (376, 1, 377, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (377, 1, 378, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (378, 1, 379, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (379, 1, 380, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (380, 1, 381, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (381, 1, 382, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (382, 1, 383, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (383, 1, 384, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (384, 1, 385, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (385, 1, 386, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (386, 1, 387, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (387, 1, 388, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (388, 1, 389, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (389, 1, 390, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (390, 1, 391, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (391, 1, 392, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (392, 1, 393, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (393, 1, 394, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (394, 1, 395, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (395, 1, 396, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (396, 1, 397, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (397, 1, 398, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (398, 1, 399, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (399, 1, 400, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (400, 1, 401, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (401, 1, 402, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (402, 1, 403, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (403, 1, 404, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (404, 1, 405, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (405, 1, 406, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (406, 1, 407, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (407, 1, 408, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (408, 1, 409, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (409, 1, 410, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (410, 1, 411, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (411, 1, 412, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (412, 1, 413, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (413, 1, 414, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (414, 1, 415, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (415, 1, 416, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (416, 1, 417, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (417, 1, 418, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (418, 1, 419, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (419, 1, 420, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (420, 1, 421, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (421, 1, 422, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (422, 1, 423, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (423, 1, 424, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (424, 1, 425, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (425, 1, 426, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (426, 1, 427, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (427, 1, 428, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (428, 1, 429, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (429, 1, 430, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (430, 1, 431, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (431, 1, 432, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (432, 1, 433, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (433, 1, 434, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (434, 1, 435, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (435, 1, 436, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (436, 1, 437, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (437, 1, 438, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (438, 1, 439, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (439, 1, 440, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (440, 1, 441, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (441, 1, 442, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (442, 1, 443, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (443, 1, 444, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (444, 1, 445, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (445, 1, 446, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (446, 1, 447, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (447, 1, 448, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (448, 1, 449, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (449, 1, 450, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (450, 1, 451, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (451, 1, 452, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (452, 1, 453, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (453, 1, 454, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (454, 1, 455, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (455, 1, 456, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (456, 1, 457, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (457, 1, 458, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (458, 1, 459, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (459, 1, 460, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (460, 1, 461, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (461, 1, 462, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (462, 1, 463, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (463, 1, 464, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (464, 1, 465, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (465, 1, 466, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (466, 1, 467, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (467, 1, 468, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (468, 1, 469, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (469, 1, 470, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (470, 1, 471, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (471, 1, 472, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (472, 1, 473, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (473, 1, 474, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (474, 1, 475, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (475, 1, 476, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (476, 1, 477, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (477, 1, 478, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (478, 1, 479, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (479, 1, 480, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (480, 1, 481, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (481, 1, 482, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (482, 1, 483, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (483, 1, 484, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (484, 1, 485, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (485, 1, 486, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (486, 1, 487, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (487, 1, 488, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (488, 1, 489, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (489, 1, 490, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (490, 1, 491, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (491, 1, 492, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (492, 1, 493, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (493, 1, 494, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (494, 1, 495, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (495, 1, 496, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (496, 1, 497, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (497, 1, 498, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (498, 1, 499, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (499, 1, 500, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (500, 1, 501, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (501, 1, 502, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (502, 1, 503, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (503, 1, 504, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (504, 1, 505, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (505, 1, 506, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (506, 1, 507, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (507, 1, 508, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (508, 1, 509, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (509, 1, 510, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (510, 1, 511, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (511, 1, 512, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (512, 1, 513, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (513, 1, 514, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (514, 1, 515, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (515, 1, 516, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (516, 1, 517, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (517, 1, 518, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (518, 1, 519, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (519, 1, 520, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (520, 1, 521, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (521, 1, 522, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (522, 1, 523, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (523, 1, 524, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (524, 1, 525, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (525, 1, 526, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (526, 1, 527, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (527, 1, 528, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (528, 1, 529, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (529, 1, 530, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (530, 1, 531, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (531, 1, 532, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (532, 1, 533, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (533, 1, 534, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (534, 1, 535, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (535, 1, 536, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (536, 1, 537, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (537, 1, 538, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (538, 1, 539, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (539, 1, 540, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (540, 1, 541, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (541, 1, 542, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (542, 1, 543, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (543, 1, 544, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (544, 1, 545, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (545, 1, 546, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (546, 1, 547, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (547, 1, 548, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (548, 1, 549, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (549, 1, 550, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (550, 1, 551, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (551, 1, 552, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (552, 1, 553, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (553, 1, 554, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (554, 1, 555, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (555, 1, 556, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (556, 1, 557, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (557, 1, 558, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (558, 1, 559, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (559, 1, 560, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (560, 1, 561, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (561, 1, 562, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (562, 1, 563, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (563, 1, 564, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (564, 1, 565, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (565, 1, 566, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (566, 1, 567, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (567, 1, 568, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (568, 1, 569, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (569, 1, 570, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (570, 1, 571, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (571, 1, 572, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (572, 1, 573, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (573, 1, 574, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (574, 1, 575, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (575, 1, 576, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (576, 1, 577, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (577, 1, 578, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (578, 1, 579, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (579, 1, 580, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (580, 1, 581, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (581, 1, 582, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (582, 1, 583, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (583, 1, 584, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (584, 1, 585, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (585, 1, 586, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (586, 1, 587, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (587, 1, 588, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (588, 1, 589, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (589, 1, 590, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (590, 1, 591, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (591, 1, 592, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (592, 1, 593, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (593, 1, 594, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (594, 1, 595, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (595, 1, 596, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (596, 1, 597, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (597, 1, 598, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (598, 1, 599, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (599, 1, 600, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (600, 1, 601, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (601, 1, 602, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (602, 1, 603, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (603, 1, 604, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (604, 1, 605, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (605, 1, 606, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (606, 1, 607, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (607, 1, 608, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (608, 1, 609, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (609, 1, 610, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (610, 1, 611, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (611, 1, 612, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (612, 1, 613, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (613, 1, 614, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (614, 1, 615, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (615, 1, 616, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (616, 1, 617, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (617, 1, 618, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (618, 1, 619, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (619, 1, 620, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (620, 1, 621, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (621, 1, 622, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (622, 1, 623, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (623, 1, 624, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (624, 1, 625, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (625, 1, 626, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (626, 1, 627, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (627, 1, 628, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (628, 1, 629, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (629, 1, 630, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (630, 1, 631, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (631, 1, 632, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (632, 1, 633, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (633, 1, 634, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (634, 1, 635, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (635, 1, 636, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (636, 1, 637, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (637, 1, 638, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (638, 1, 639, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (639, 1, 640, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (640, 1, 641, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (641, 1, 642, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (642, 1, 643, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (643, 1, 644, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (644, 1, 645, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (645, 1, 646, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (646, 1, 647, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (647, 1, 648, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (648, 1, 649, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (649, 1, 650, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (650, 1, 651, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (651, 1, 652, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (652, 1, 653, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (653, 1, 654, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (654, 1, 655, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (655, 1, 656, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (656, 1, 657, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (657, 1, 658, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (658, 1, 659, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (659, 1, 660, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (660, 1, 661, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (661, 1, 662, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (662, 1, 663, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (663, 1, 664, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (664, 1, 665, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (665, 1, 666, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (666, 1, 667, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (667, 1, 668, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (668, 1, 669, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (669, 1, 670, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (670, 1, 671, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (671, 1, 672, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (672, 1, 673, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (673, 1, 674, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (674, 1, 675, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (675, 1, 676, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (676, 1, 677, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (677, 1, 678, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (678, 1, 679, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (679, 1, 680, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (680, 1, 681, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (681, 1, 682, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (682, 1, 683, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (683, 1, 684, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (684, 1, 685, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (685, 1, 686, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (686, 1, 687, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (687, 1, 688, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (688, 1, 689, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (689, 1, 690, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (690, 1, 691, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (691, 1, 692, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (692, 1, 693, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (693, 1, 694, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (694, 1, 695, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (695, 1, 696, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (696, 1, 697, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (697, 1, 698, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (698, 1, 699, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (699, 1, 700, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (700, 1, 701, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (701, 1, 702, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (702, 1, 703, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (703, 1, 704, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (704, 1, 705, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (705, 1, 706, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (706, 1, 707, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (707, 1, 708, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (708, 1, 709, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (709, 1, 710, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (710, 1, 711, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (711, 1, 712, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (712, 1, 713, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (713, 1, 714, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (714, 1, 715, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (715, 1, 716, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (716, 1, 717, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (717, 1, 718, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (718, 1, 719, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (719, 1, 720, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (720, 1, 721, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (721, 1, 722, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (722, 1, 723, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (723, 1, 724, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (724, 1, 725, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (725, 1, 726, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (726, 1, 727, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (727, 1, 728, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (728, 1, 729, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (729, 1, 730, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (730, 1, 731, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (731, 1, 732, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (732, 1, 733, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (733, 1, 734, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (734, 1, 735, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (735, 1, 736, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (736, 1, 737, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (737, 1, 738, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (738, 1, 739, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (739, 1, 740, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (740, 1, 741, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (741, 1, 742, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (742, 1, 743, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (743, 1, 744, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (744, 1, 745, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (745, 1, 746, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (746, 1, 747, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (747, 1, 748, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (748, 1, 749, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (749, 1, 750, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (750, 1, 751, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (751, 1, 752, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (752, 1, 753, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (753, 1, 754, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (754, 1, 755, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (755, 1, 756, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (756, 1, 757, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (757, 1, 758, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (758, 1, 759, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (759, 1, 760, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (760, 1, 761, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (761, 1, 762, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (762, 1, 763, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (763, 1, 764, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (764, 1, 765, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (765, 1, 766, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (766, 1, 767, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (767, 1, 768, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (768, 1, 769, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (769, 1, 770, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (770, 1, 771, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (771, 1, 772, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (772, 1, 773, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (773, 1, 774, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (774, 1, 775, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (775, 1, 776, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (776, 1, 777, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (777, 1, 778, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (778, 1, 779, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (779, 1, 780, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (780, 1, 781, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (781, 1, 782, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (782, 1, 783, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (783, 1, 784, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (784, 1, 785, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (785, 1, 786, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (786, 1, 787, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (787, 1, 788, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (788, 1, 789, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (789, 1, 790, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (790, 1, 791, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (791, 1, 792, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (792, 1, 793, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (793, 1, 794, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (794, 1, 795, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (795, 1, 796, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (796, 1, 797, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (797, 1, 798, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (798, 1, 799, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (799, 1, 800, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (800, 1, 801, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (801, 1, 802, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (802, 1, 803, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (803, 1, 804, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (804, 1, 805, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (805, 1, 806, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (806, 1, 807, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (807, 1, 808, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (808, 1, 809, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (809, 1, 810, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (810, 1, 811, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (811, 1, 812, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (812, 1, 813, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (813, 1, 814, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (814, 1, 815, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (815, 1, 816, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (816, 1, 817, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (817, 1, 818, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (818, 1, 819, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (819, 1, 820, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (820, 1, 821, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (821, 1, 822, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (822, 1, 823, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (823, 1, 824, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (824, 1, 825, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (825, 1, 826, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (826, 1, 827, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (827, 1, 828, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (828, 1, 829, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (829, 1, 830, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (830, 1, 831, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (831, 1, 832, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (832, 1, 833, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (833, 1, 834, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (834, 1, 835, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (835, 1, 836, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (836, 1, 837, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (837, 1, 838, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (838, 1, 839, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (839, 1, 840, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (840, 1, 841, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (841, 1, 842, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (842, 1, 843, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (843, 1, 844, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (844, 1, 845, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (845, 1, 846, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (846, 1, 847, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (847, 1, 848, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (848, 1, 849, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (849, 1, 850, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (850, 1, 851, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (851, 1, 852, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (852, 1, 853, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (853, 1, 854, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (854, 1, 855, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (855, 1, 856, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (856, 1, 857, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (857, 1, 858, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (858, 1, 859, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (859, 1, 860, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (860, 1, 861, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (861, 1, 862, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (862, 1, 863, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (863, 1, 864, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (864, 1, 865, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (865, 1, 866, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (866, 1, 867, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (867, 1, 868, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (868, 1, 869, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (869, 1, 870, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (870, 1, 871, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (871, 1, 872, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (872, 1, 873, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (873, 1, 874, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (874, 1, 875, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (875, 1, 876, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (876, 1, 877, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (877, 1, 878, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (878, 1, 879, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (879, 1, 880, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (880, 1, 881, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (881, 1, 882, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (882, 1, 883, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (883, 1, 884, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (884, 1, 885, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (885, 1, 886, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (886, 1, 887, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (887, 1, 888, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (888, 1, 889, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (889, 1, 890, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (890, 1, 891, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (891, 1, 892, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (892, 1, 893, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (893, 1, 894, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (894, 1, 895, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (895, 1, 896, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (896, 1, 897, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (897, 1, 898, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (898, 1, 899, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (899, 1, 900, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (900, 1, 901, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (901, 1, 902, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (902, 1, 903, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (903, 1, 904, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (904, 1, 905, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (905, 1, 906, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (906, 1, 907, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (907, 1, 908, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (908, 1, 909, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (909, 1, 910, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (910, 1, 911, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (911, 1, 912, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (912, 1, 913, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (913, 1, 914, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (914, 1, 915, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (915, 1, 916, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (916, 1, 917, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (917, 1, 918, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (918, 1, 919, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (919, 1, 920, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (920, 1, 921, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (921, 1, 922, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (922, 1, 923, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (923, 1, 924, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (924, 1, 925, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (925, 1, 926, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (926, 1, 927, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (927, 1, 928, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (928, 1, 929, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (929, 1, 930, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (930, 1, 931, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (931, 1, 932, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (932, 1, 933, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (933, 1, 934, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (934, 1, 935, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (935, 1, 936, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (936, 1, 937, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (937, 1, 938, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (938, 1, 939, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (939, 1, 940, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (940, 1, 941, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (941, 1, 942, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (942, 1, 943, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (943, 1, 944, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (944, 1, 945, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (945, 1, 946, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (946, 1, 947, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (947, 1, 948, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (948, 1, 949, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (949, 1, 950, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (950, 1, 951, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (951, 1, 952, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (952, 1, 953, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (953, 1, 954, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (954, 1, 955, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (955, 1, 956, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (956, 1, 957, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (957, 1, 958, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (958, 1, 959, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (959, 1, 960, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (960, 1, 961, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (961, 1, 962, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (962, 1, 963, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (963, 1, 964, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (964, 1, 965, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (965, 1, 966, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (966, 1, 967, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (967, 1, 968, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (968, 1, 969, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (969, 1, 970, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (970, 1, 971, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (971, 1, 972, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (972, 1, 973, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (973, 1, 974, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (974, 1, 975, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (975, 1, 976, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (976, 1, 977, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (977, 1, 978, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (978, 1, 979, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (979, 1, 980, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (980, 1, 981, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (981, 1, 982, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (982, 1, 983, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (983, 1, 984, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (984, 1, 985, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (1002, 1, 1016, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (1003, 1, 1021, 3)
GO
INSERT [dbo].[user_permission] ([id], [licensed], [userId], [permissionId]) VALUES (1013, 1, 1030, 3)
GO
SET IDENTITY_INSERT [dbo].[user_permission] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__user__AB6E616407FC8304]    Script Date: 3/15/2022 3:39:21 PM ******/
ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[additional_calendar] ADD  DEFAULT ('default') FOR [display]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((0)) FOR [is_super]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[user] ADD  DEFAULT ('user') FOR [permission]
GO
ALTER TABLE [dbo].[additional_calendar]  WITH CHECK ADD FOREIGN KEY([calendarId])
REFERENCES [dbo].[calendar] ([id])
GO
ALTER TABLE [dbo].[additional_calendar]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[category_calendar] ([id])
GO
ALTER TABLE [dbo].[additional_calendar]  WITH CHECK ADD FOREIGN KEY([statusId])
REFERENCES [dbo].[status_calendar] ([id])
GO
ALTER TABLE [dbo].[calendar]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[event]  WITH CHECK ADD FOREIGN KEY([additionalId])
REFERENCES [dbo].[additional_calendar] ([id])
GO
ALTER TABLE [dbo].[event]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[permission_action]  WITH CHECK ADD FOREIGN KEY([actionId])
REFERENCES [dbo].[action] ([id])
GO
ALTER TABLE [dbo].[permission_action]  WITH CHECK ADD FOREIGN KEY([permissionId])
REFERENCES [dbo].[permission] ([id])
GO
ALTER TABLE [dbo].[user_permission]  WITH CHECK ADD FOREIGN KEY([permissionId])
REFERENCES [dbo].[permission] ([id])
GO
ALTER TABLE [dbo].[user_permission]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([id])
GO
USE [master]
GO
ALTER DATABASE [clife] SET  READ_WRITE 
GO
