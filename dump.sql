USE [question_system]
GO
/****** Object:  Table [dbo].[answers]   ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[answers_data] [text] NULL,
	[user_id] [int] NULL,
	[DateCreated] [datetime] NULL,
	[user_name] [varchar](250) NULL,
	[user_email] [varchar](250) NULL,
 CONSTRAINT [PK_answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[questions]     ******/
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
/****** Object:  Table [dbo].[users]   ******/
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
