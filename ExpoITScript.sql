USE [master]
GO
/****** Object:  Database [ExpIT]    Script Date: 9/24/2015 3:53:53 AM ******/
CREATE DATABASE [ExpIT] ON  PRIMARY 
( NAME = N'ExpIT', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ExpIT.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ExpIT_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ExpIT_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExpIT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExpIT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExpIT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExpIT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExpIT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExpIT] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExpIT] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ExpIT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExpIT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExpIT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExpIT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExpIT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExpIT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExpIT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExpIT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExpIT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ExpIT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExpIT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExpIT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExpIT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExpIT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExpIT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExpIT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExpIT] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExpIT] SET  MULTI_USER 
GO
ALTER DATABASE [ExpIT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExpIT] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExpIT', N'ON'
GO
USE [ExpIT]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/24/2015 3:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](300) NOT NULL,
	[rank] [int] NOT NULL,
	[imgUrl] [nvarchar](50) NULL,
	[overview] [text] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Examination]    Script Date: 9/24/2015 3:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examination](
	[StudentID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[PraticalScore] [real] NOT NULL,
	[ThesisScore] [real] NOT NULL,
	[status] [int] NOT NULL,
	[ThesisDoneTime] [nvarchar](50) NOT NULL,
	[PraticalDoneTime] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Examination] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registration]    Script Date: 9/24/2015 3:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/24/2015 3:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subject]    Script Date: 9/24/2015 3:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[information] [text] NOT NULL,
	[PraticalFile] [nvarchar](100) NOT NULL,
	[PraticalText] [nchar](10) NOT NULL,
	[TeacherID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[NumberOfQuestion] [int] NOT NULL,
	[ThesisTime] [int] NOT NULL,
	[imgUrl] [nvarchar](50) NULL,
	[overview] [text] NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectAnswer]    Script Date: 9/24/2015 3:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectAnswer](
	[ID] [int] NOT NULL,
	[answer] [nvarchar](100) NOT NULL,
	[result] [bit] NOT NULL,
	[SubjectQuestionID] [int] NOT NULL,
 CONSTRAINT [PK_SubjectAnswer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectQuestion]    Script Date: 9/24/2015 3:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectQuestion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[question] [text] NOT NULL,
	[SubjectID] [int] NOT NULL,
 CONSTRAINT [PK_SubjectQuestion] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 9/24/2015 3:53:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[email] [nvarchar](200) NOT NULL,
	[rank] [int] NULL,
	[roleId] [int] NULL,
	[company] [nvarchar](50) NULL,
	[information] [text] NULL,
	[imgUrl] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([ID], [name], [rank], [imgUrl], [overview]) VALUES (1, N'Hướng Đối Tượng C# Cơ bản', 1, N'/Content/image/microsoft.png', NULL)
INSERT [dbo].[Course] ([ID], [name], [rank], [imgUrl], [overview]) VALUES (2, N'Hướng Đối Tượng C#', 2, N'/Content/image/microsoft.png', NULL)
INSERT [dbo].[Course] ([ID], [name], [rank], [imgUrl], [overview]) VALUES (3, N'Hướng Đối Tượng C# Nâng Cao', 3, N'/Content/image/microsoft.png', NULL)
INSERT [dbo].[Course] ([ID], [name], [rank], [imgUrl], [overview]) VALUES (4, N'Lập trình ASP.NET', 4, N'/Content/image/microsoft.png', NULL)
SET IDENTITY_INSERT [dbo].[Course] OFF
INSERT [dbo].[Registration] ([StudentID], [CourseID], [status]) VALUES (11, 1, 0)
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [name]) VALUES (1, N'teacher')
INSERT [dbo].[Role] ([Id], [name]) VALUES (2, N'student')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (1, N'Bai 1', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'1', N'1         ', 15, 1, 1, 1, N'/Content/image/visual.png', NULL)
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (3, N'C2', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'1', N'1         ', 15, 2, 1, 1, N'/Content/image/visual.png', NULL)
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (4, N'C3', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'1', N'1         ', 15, 3, 1, 1, N'/Content/image/visual.png', NULL)
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (5, N'Bai 2', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'1', N'1         ', 15, 1, 1, 1, N'/Content/image/visual.png', NULL)
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (6, N'Bai 3', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'1', N'1         ', 15, 1, 1, 1, N'/Content/image/visual.png', NULL)
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (7, N'Bai 4', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'1', N'1         ', 15, 1, 1, 1, N'/Content/image/visual.png', NULL)
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [username], [password], [address], [email], [rank], [roleId], [company], [information], [imgUrl], [name]) VALUES (11, N'hung', N'1', N'', N'', 1, 2, NULL, NULL, NULL, N'viet hung')
INSERT [dbo].[User] ([ID], [username], [password], [address], [email], [rank], [roleId], [company], [information], [imgUrl], [name]) VALUES (15, N'teacher1', N'1', N'', N'', NULL, 1, NULL, N'good', N'/Content/image/user.png', N'teacher1')
INSERT [dbo].[User] ([ID], [username], [password], [address], [email], [rank], [roleId], [company], [information], [imgUrl], [name]) VALUES (16, N'teacher2', N'1', N'', N'', NULL, 1, NULL, N'very good', N'/Content/image/user.png', N'teacher2')
INSERT [dbo].[User] ([ID], [username], [password], [address], [email], [rank], [roleId], [company], [information], [imgUrl], [name]) VALUES (17, N'hung1', N'1', N'', N'', 1, 2, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Examination]  WITH CHECK ADD  CONSTRAINT [FK_Examination_Student1] FOREIGN KEY([StudentID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Examination] CHECK CONSTRAINT [FK_Examination_Student1]
GO
ALTER TABLE [dbo].[Examination]  WITH CHECK ADD  CONSTRAINT [FK_Examination_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Examination] CHECK CONSTRAINT [FK_Examination_Subject]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Course]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[User] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Student]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_Course]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_Subject_User] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_Subject_User]
GO
ALTER TABLE [dbo].[SubjectQuestion]  WITH CHECK ADD  CONSTRAINT [FK_SubjectQuestion_Subject] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[Subject] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubjectQuestion] CHECK CONSTRAINT [FK_SubjectQuestion_Subject]
GO
ALTER TABLE [dbo].[SubjectQuestion]  WITH CHECK ADD  CONSTRAINT [FK_SubjectQuestion_SubjectAnswer] FOREIGN KEY([SubjectID])
REFERENCES [dbo].[SubjectAnswer] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SubjectQuestion] CHECK CONSTRAINT [FK_SubjectQuestion_SubjectAnswer]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [ExpIT] SET  READ_WRITE 
GO
