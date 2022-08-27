USE [master]
GO
/****** Object:  Database [question_system] ******/
CREATE DATABASE [question_system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'question_system', FILENAME = N'G:\Work\sqlserver\MSSQL15.MSSQLSERVER\MSSQL\DATA\question_system.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'question_system_log', FILENAME = N'G:\Work\sqlserver\MSSQL15.MSSQLSERVER\MSSQL\DATA\question_system_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [question_system] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [question_system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [question_system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [question_system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [question_system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [question_system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [question_system] SET ARITHABORT OFF 
GO
ALTER DATABASE [question_system] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [question_system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [question_system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [question_system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [question_system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [question_system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [question_system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [question_system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [question_system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [question_system] SET  DISABLE_BROKER 
GO
ALTER DATABASE [question_system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [question_system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [question_system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [question_system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [question_system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [question_system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [question_system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [question_system] SET RECOVERY FULL 
GO
ALTER DATABASE [question_system] SET  MULTI_USER 
GO
ALTER DATABASE [question_system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [question_system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [question_system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [question_system] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [question_system] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [question_system] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'question_system', N'ON'
GO
ALTER DATABASE [question_system] SET QUERY_STORE = OFF
GO
USE [question_system]
GO
/****** Object:  Table [dbo].[answers]    Script Date: 8/27/2022 10:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[answers_data] [varchar](max) NULL,
	[question_data] [int] NULL,
	[user_id] [int] NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questions]    Script Date: 8/27/2022 10:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](max) NULL,
	[status] [int] NULL,
	[user_id] [int] NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 8/27/2022 10:58:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](max) NULL,
	[email] [varchar](max) NULL,
	[name] [varchar](max) NULL,
	[password] [varchar](max) NULL,
	[status] [int] NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[answers] ADD  CONSTRAINT [DF_answer_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[questions] ADD  CONSTRAINT [DF_question_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_user_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
USE [master]
GO
ALTER DATABASE [question_system] SET  READ_WRITE 
GO
