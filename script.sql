USE [master]
GO
/****** Object:  Database [Database]    Script Date: 7/28/2024 11:08:18 PM ******/
CREATE DATABASE [Database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Database] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Database] SET  MULTI_USER 
GO
ALTER DATABASE [Database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Database] SET QUERY_STORE = ON
GO
ALTER DATABASE [Database] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Database]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/28/2024 11:08:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 7/28/2024 11:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilePath] [nvarchar](500) NOT NULL,
	[ProjectTaskId] [int] NOT NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 7/28/2024 11:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](2000) NOT NULL,
	[ProjectTaskId] [int] NOT NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectTasks]    Script Date: 7/28/2024 11:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTasks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](1000) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[AssignedUserId] [int] NOT NULL,
 CONSTRAINT [PK_ProjectTasks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaskReports]    Script Date: 7/28/2024 11:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaskReports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CompletedTasks] [int] NOT NULL,
	[PendingTasks] [int] NOT NULL,
	[ReportDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_TaskReports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/28/2024 11:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Documents_ProjectTaskId]    Script Date: 7/28/2024 11:08:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Documents_ProjectTaskId] ON [dbo].[Documents]
(
	[ProjectTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notes_ProjectTaskId]    Script Date: 7/28/2024 11:08:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_Notes_ProjectTaskId] ON [dbo].[Notes]
(
	[ProjectTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProjectTasks_AssignedUserId]    Script Date: 7/28/2024 11:08:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProjectTasks_AssignedUserId] ON [dbo].[ProjectTasks]
(
	[AssignedUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_TaskReports_UserId]    Script Date: 7/28/2024 11:08:19 PM ******/
CREATE NONCLUSTERED INDEX [IX_TaskReports_UserId] ON [dbo].[TaskReports]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Name]    Script Date: 7/28/2024 11:08:19 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Name] ON [dbo].[Users]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_ProjectTasks_ProjectTaskId] FOREIGN KEY([ProjectTaskId])
REFERENCES [dbo].[ProjectTasks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_ProjectTasks_ProjectTaskId]
GO
ALTER TABLE [dbo].[Notes]  WITH CHECK ADD  CONSTRAINT [FK_Notes_ProjectTasks_ProjectTaskId] FOREIGN KEY([ProjectTaskId])
REFERENCES [dbo].[ProjectTasks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notes] CHECK CONSTRAINT [FK_Notes_ProjectTasks_ProjectTaskId]
GO
ALTER TABLE [dbo].[ProjectTasks]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTasks_Users_AssignedUserId] FOREIGN KEY([AssignedUserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectTasks] CHECK CONSTRAINT [FK_ProjectTasks_Users_AssignedUserId]
GO
ALTER TABLE [dbo].[TaskReports]  WITH CHECK ADD  CONSTRAINT [FK_TaskReports_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TaskReports] CHECK CONSTRAINT [FK_TaskReports_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [Database] SET  READ_WRITE 
GO
