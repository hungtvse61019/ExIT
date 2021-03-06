USE [master]
GO
/****** Object:  Database [ExpIT]    Script Date: 9/30/2015 11:54:27 PM ******/
CREATE DATABASE [ExpIT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExpIT', FILENAME = N'W:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ExpIT.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ExpIT_log', FILENAME = N'W:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ExpIT_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ExpIT] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [ExpIT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExpIT] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ExpIT] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ExpIT]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 9/30/2015 11:54:27 PM ******/
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
/****** Object:  Table [dbo].[Examination]    Script Date: 9/30/2015 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examination](
	[StudentID] [int] NOT NULL,
	[SubjectID] [int] NOT NULL,
	[PraticalScore] [real] NULL,
	[ThesisScore] [real] NULL,
	[status] [int] NULL,
	[ThesisDoneTime] [nvarchar](50) NULL,
	[PraticalDoneTime] [nvarchar](50) NULL,
	[PracticalFile] [nvarchar](50) NULL,
 CONSTRAINT [PK_Examination] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[SubjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registration]    Script Date: 9/30/2015 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[StudentID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/30/2015 11:54:27 PM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 9/30/2015 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[information] [text] NOT NULL,
	[PraticalFile] [nvarchar](100) NOT NULL,
	[PraticalText] [nvarchar](100) NOT NULL,
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
/****** Object:  Table [dbo].[SubjectAnswer]    Script Date: 9/30/2015 11:54:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubjectAnswer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[answer] [text] NOT NULL,
	[result] [bit] NOT NULL,
	[SubjectQuestionID] [int] NOT NULL,
 CONSTRAINT [PK_SubjectAnswer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubjectQuestion]    Script Date: 9/30/2015 11:54:27 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 9/30/2015 11:54:27 PM ******/
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
	[age] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([ID], [name], [rank], [imgUrl], [overview]) VALUES (1, N'Hướng Đối Tượng C# Cơ bản', 1, N'/Content/image/microsoft.png', N'fasdfads')
INSERT [dbo].[Course] ([ID], [name], [rank], [imgUrl], [overview]) VALUES (2, N'Hướng Đối Tượng C#', 2, N'/Content/image/microsoft.png', N'fdsafasd')
INSERT [dbo].[Course] ([ID], [name], [rank], [imgUrl], [overview]) VALUES (3, N'Hướng Đối Tượng C# Nâng Cao', 3, N'/Content/image/microsoft.png', N'fsadfad')
INSERT [dbo].[Course] ([ID], [name], [rank], [imgUrl], [overview]) VALUES (4, N'Lập trình ASP.NET', 4, N'/Content/image/microsoft.png', N'sfasfdsafsdaf')
INSERT [dbo].[Course] ([ID], [name], [rank], [imgUrl], [overview]) VALUES (5, N'Lập trình ASP', 1, N'/Content/image/microsoft.png', N'fsadfadsf')
INSERT [dbo].[Course] ([ID], [name], [rank], [imgUrl], [overview]) VALUES (6, N'Lập trình ASP', 1, N'/Content/image/microsoft.png', N'fdsfsdfsf')
INSERT [dbo].[Course] ([ID], [name], [rank], [imgUrl], [overview]) VALUES (7, N'Lập trình ASP', 2, N'/Content/image/microsoft.png', N'fdsgsdgsdgsg')
SET IDENTITY_INSERT [dbo].[Course] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [name]) VALUES (1, N'teacher')
INSERT [dbo].[Role] ([Id], [name]) VALUES (2, N'student')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (1, N'Bai 1', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'/Content/Practical/tuesday''speaking.docx', N'/Content/Practical/tuesday''speaking.docx', 15, 1, 4, 1, N'/Content/image/visual.png', N'haha')
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (3, N'C2', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'/Content/Practical/tuesday''speaking.docx', N'/Content/Practical/tuesday''speaking.docx', 15, 2, 4, 1, N'/Content/image/visual.png', N'hihi')
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (4, N'C3', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'/Content/Practical/tuesday''speaking.docx', N'/Content/Practical/tuesday''speaking.docx', 15, 3, 4, 1, N'/Content/image/visual.png', N'hehe')
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (5, N'Bai 2', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'/Content/Practical/tuesday''speaking.docx', N'/Content/Practical/tuesday''speaking.docx', 15, 1, 4, 1, N'/Content/image/visual.png', N'hehe')
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (6, N'Bai 3', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'/Content/Practical/tuesday''speaking.docx', N'/Content/Practical/tuesday''speaking.docx', 15, 1, 4, 1, N'/Content/image/visual.png', N'hehe')
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (7, N'Bai 4', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'/Content/Practical/tuesday''speaking.docx', N'/Content/Practical/tuesday''speaking.docx', 15, 1, 4, 1, N'/Content/image/visual.png', N'hehe')
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (8, N'Bai 5', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'/Content/Practical/tuesday''speaking.docx', N'/Content/Practical/tuesday''speaking.docx', 15, 1, 4, 1, N'/Content/image/visual.png', N'hehe')
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (10, N'BAi', N'https://www.youtube.com/v/kb_Ouy_YEH0', N'/Content/Practical/tuesday''speaking.docx', N'/Content/Practical/tuesday''speaking.docx', 15, 1, 4, 1, N'/Content/image/visual.png', N'fs')
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (11, N'BAi', N'fsdf', N'fdfd', N'fdf', 15, 1, 4, 1, N'/Content/image/visual.png', N'fdsfs')
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (12, N'Bai', N'fdsfs', N'fdsf', N'sdfsdf', 15, 1, 4, 1, N'/Content/image/visual.png', N'fdsf')
INSERT [dbo].[Subject] ([ID], [name], [information], [PraticalFile], [PraticalText], [TeacherID], [CourseID], [NumberOfQuestion], [ThesisTime], [imgUrl], [overview]) VALUES (13, N'bsdbs', N'fsdfs', N'dsfsd', N'fsdfsdf', 15, 1, 4, 1, N'/Content/image/visual.png', N'fsdfsdf')
SET IDENTITY_INSERT [dbo].[Subject] OFF
SET IDENTITY_INSERT [dbo].[SubjectAnswer] ON 

INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (1, N'Managed code is the code that is compiled by the JIT compilers.', 0, 1)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (2, N'Managed code is the code where resources are Garbage Collected.', 0, 1)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (3, N'Managed code is the code that runs on top of Windows.', 0, 1)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (4, N'Managed code is the code that is written to target the services of the CLR.', 1, 1)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (5, N'gacutil', 0, 2)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (6, N'ngen', 1, 2)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (7, N'sn', 0, 2)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (8, N'dumpbin', 0, 2)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (9, N'.NET class libraries', 1, 3)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (10, N'Common Language Runtime', 0, 3)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (11, N'Common Language Infrastructure', 0, 3)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (12, N'Component Object Model', 0, 3)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (13, N'Common Language Infrastructure', 0, 4)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (14, N'CLR', 0, 4)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (15, N'Garbage Collector', 1, 4)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (16, N'Class Loader', 0, 4)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (20, N'Private Assemblies', 0, 5)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (21, N'Friend Assemblies', 0, 5)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (22, N'Shared Assemblies', 1, 5)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (23, N'Public Assemblies', 0, 5)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (24, N'Managed code is the code that is compiled by the JIT compilers.', 0, 6)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (25, N'Managed code is the code where resources are Garbage Collected.', 0, 6)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (26, N'Managed code is the code that runs on top of Windows.', 0, 6)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (27, N'Managed code is the code that is written to target the services of the CLR.', 1, 6)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (28, N'gacutil', 0, 7)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (29, N'ngen', 1, 7)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (30, N'sn', 0, 7)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (31, N'dumpbin', 0, 7)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (32, N'.NET class libraries', 1, 8)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (33, N'Common Language Runtime', 0, 8)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (34, N'Common Language Infrastructure', 0, 8)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (35, N'Component Object Model', 0, 8)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (36, N'Common Language Infrastructure', 0, 9)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (37, N'CLR', 0, 9)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (38, N'Garbage Collector', 1, 9)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (39, N'Class Loader', 0, 9)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (40, N'Private Assemblies', 0, 10)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (41, N'Friend Assemblies', 0, 10)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (42, N'Shared Assemblies', 1, 10)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (43, N'Public Assemblies', 0, 10)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (44, N'Managed code is the code that is compiled by the JIT compilers.', 0, 11)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (45, N'Managed code is the code where resources are Garbage Collected.', 0, 11)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (46, N'Managed code is the code that runs on top of Windows.', 0, 11)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (47, N'Managed code is the code that is written to target the services of the CLR.', 1, 11)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (48, N'gacutil', 0, 12)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (49, N'ngen', 1, 12)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (50, N'sn', 0, 12)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (51, N'dumpbin', 0, 12)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (52, N'.NET class libraries', 1, 13)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (53, N'Common Language Runtime', 0, 13)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (54, N'Common Language Infrastructure', 0, 13)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (55, N'Component Object Model', 0, 13)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (56, N'Common Language Infrastructure', 0, 14)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (57, N'CLR', 0, 14)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (58, N'Garbage Collector', 1, 14)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (59, N'Class Loader', 0, 14)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (60, N'Private Assemblies', 0, 15)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (61, N'Friend Assemblies', 0, 15)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (62, N'Shared Assemblies', 1, 15)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (63, N'Public Assemblies', 0, 15)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (64, N'Managed code is the code that is compiled by the JIT compilers.', 0, 16)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (65, N'Managed code is the code where resources are Garbage Collected.', 0, 16)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (66, N'Managed code is the code that runs on top of Windows.', 0, 16)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (67, N'Managed code is the code that is written to target the services of the CLR.', 1, 16)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (68, N'gacutil', 0, 17)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (69, N'ngen', 1, 17)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (70, N'sn', 0, 17)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (71, N'dumpbin', 0, 17)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (72, N'.NET class libraries', 1, 18)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (73, N'Common Language Runtime', 0, 18)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (74, N'Common Language Infrastructure', 0, 18)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (75, N'Component Object Model', 0, 18)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (76, N'Common Language Infrastructure', 0, 19)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (77, N'CLR', 0, 19)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (78, N'Garbage Collector', 1, 19)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (79, N'Class Loader', 0, 19)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (80, N'Private Assemblies', 0, 20)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (81, N'Friend Assemblies', 0, 20)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (82, N'Shared Assemblies', 1, 20)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (83, N'Public Assemblies', 0, 20)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (84, N'Managed code is the code that is compiled by the JIT compilers.', 0, 21)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (85, N'Managed code is the code where resources are Garbage Collected.', 0, 21)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (86, N'Managed code is the code that runs on top of Windows.', 0, 21)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (87, N'Managed code is the code that is written to target the services of the CLR.', 1, 21)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (88, N'gacutil', 0, 22)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (89, N'ngen', 1, 22)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (90, N'sn', 0, 22)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (91, N'dumpbin', 0, 22)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (92, N'.NET class libraries', 1, 23)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (93, N'Common Language Runtime', 0, 23)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (94, N'Common Language Infrastructure', 0, 23)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (95, N'Component Object Model', 0, 23)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (96, N'Common Language Infrastructure', 0, 24)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (97, N'CLR', 0, 24)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (98, N'Garbage Collector', 1, 24)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (99, N'Class Loader', 0, 24)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (100, N'Private Assemblies', 0, 25)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (101, N'Friend Assemblies', 0, 25)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (102, N'Shared Assemblies', 1, 25)
GO
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (103, N'Public Assemblies', 0, 25)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (104, N'Managed code is the code that is compiled by the JIT compilers.', 0, 26)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (105, N'Managed code is the code where resources are Garbage Collected.', 0, 26)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (106, N'Managed code is the code that runs on top of Windows.', 0, 26)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (107, N'Managed code is the code that is written to target the services of the CLR.', 1, 26)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (108, N'gacutil', 0, 27)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (109, N'ngen', 1, 27)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (110, N'sn', 0, 27)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (111, N'dumpbin', 0, 27)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (112, N'.NET class libraries', 1, 28)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (113, N'Common Language Runtime', 0, 28)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (114, N'Common Language Infrastructure', 0, 28)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (115, N'Component Object Model', 0, 28)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (116, N'Common Language Infrastructure', 0, 29)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (117, N'CLR', 0, 29)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (118, N'Garbage Collector', 1, 29)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (119, N'Class Loader', 0, 29)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (120, N'Private Assemblies', 0, 30)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (121, N'Friend Assemblies', 0, 30)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (122, N'Shared Assemblies', 1, 30)
INSERT [dbo].[SubjectAnswer] ([ID], [answer], [result], [SubjectQuestionID]) VALUES (123, N'Public Assemblies', 0, 30)
SET IDENTITY_INSERT [dbo].[SubjectAnswer] OFF
SET IDENTITY_INSERT [dbo].[SubjectQuestion] ON 

INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (1, N'Which of the following statements is correct about Managed Code?', 1)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (2, N'Which of the following utilities can be used to compile managed assemblies into processor-specific native code?', 1)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (3, N'Which of the following components of the .NET framework provide an extensible set of classes that can be used by any .NET compliant programming language?', 1)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (4, N'Which of the following .NET components can be used to remove unused references from the managed heap?', 1)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (5, N'Which of the following assemblies can be stored in Global Assembly Cache?', 1)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (6, N'Which of the following statements is correct about Managed Code?', 5)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (7, N'Which of the following utilities can be used to compile managed assemblies into processor-specific native code?', 5)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (8, N'Which of the following components of the .NET framework provide an extensible set of classes that can be used by any .NET compliant programming language?', 5)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (9, N'Which of the following .NET components can be used to remove unused references from the managed heap?', 5)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (10, N'Which of the following assemblies can be stored in Global Assembly Cache?', 5)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (11, N'Which of the following statements is correct about Managed Code?', 6)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (12, N'Which of the following utilities can be used to compile managed assemblies into processor-specific native code?', 6)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (13, N'Which of the following components of the .NET framework provide an extensible set of classes that can be used by any .NET compliant programming language?', 6)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (14, N'Which of the following .NET components can be used to remove unused references from the managed heap?', 6)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (15, N'Which of the following assemblies can be stored in Global Assembly Cache?', 6)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (16, N'Which of the following statements is correct about Managed Code?', 7)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (17, N'Which of the following utilities can be used to compile managed assemblies into processor-specific native code?', 7)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (18, N'Which of the following components of the .NET framework provide an extensible set of classes that can be used by any .NET compliant programming language?', 7)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (19, N'Which of the following .NET components can be used to remove unused references from the managed heap?', 7)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (20, N'Which of the following assemblies can be stored in Global Assembly Cache?', 7)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (21, N'Which of the following statements is correct about Managed Code?', 3)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (22, N'Which of the following utilities can be used to compile managed assemblies into processor-specific native code?', 3)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (23, N'Which of the following components of the .NET framework provide an extensible set of classes that can be used by any .NET compliant programming language?', 3)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (24, N'Which of the following .NET components can be used to remove unused references from the managed heap?', 3)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (25, N'Which of the following assemblies can be stored in Global Assembly Cache?', 3)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (26, N'Which of the following statements is correct about Managed Code?', 4)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (27, N'Which of the following utilities can be used to compile managed assemblies into processor-specific native code?', 4)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (28, N'Which of the following components of the .NET framework provide an extensible set of classes that can be used by any .NET compliant programming language?', 4)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (29, N'Which of the following .NET components can be used to remove unused references from the managed heap?', 4)
INSERT [dbo].[SubjectQuestion] ([ID], [question], [SubjectID]) VALUES (30, N'Which of the following assemblies can be stored in Global Assembly Cache?', 4)
SET IDENTITY_INSERT [dbo].[SubjectQuestion] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [username], [password], [address], [email], [rank], [roleId], [company], [information], [imgUrl], [name], [age]) VALUES (15, N'teacherlong', N'123456', N'', N'', NULL, 1, NULL, N'good', N'/Content/image/user.png', N'teacher1', 20)
INSERT [dbo].[User] ([ID], [username], [password], [address], [email], [rank], [roleId], [company], [information], [imgUrl], [name], [age]) VALUES (16, N'teacher2', N'1', N'', N'', NULL, 1, NULL, N'very good', N'/Content/image/user.png', N'teacher2', 20)
INSERT [dbo].[User] ([ID], [username], [password], [address], [email], [rank], [roleId], [company], [information], [imgUrl], [name], [age]) VALUES (26, N'teacher3', N'1', N'fdasfds', N'sdfsdfs', NULL, 1, N'fdsfsdf', N'fdsfafd', N'/Content/image/user.png', N'fsdfsdfsd', 21)
INSERT [dbo].[User] ([ID], [username], [password], [address], [email], [rank], [roleId], [company], [information], [imgUrl], [name], [age]) VALUES (27, N'teacher4', N'1', N'gsgdsg', N'sdgsdg', NULL, 1, N'fdsfsd', N'fsdfsd', N'/Content/image/user.png', N'fsdfsd', 22)
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
