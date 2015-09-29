
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/30/2015 01:39:25
-- Generated from EDMX file: D:\ExIT.git\trunk\ExIT\Models\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ExpIT];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Examination_Student1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Examination] DROP CONSTRAINT [FK_Examination_Student1];
GO
IF OBJECT_ID(N'[dbo].[FK_Examination_Subject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Examination] DROP CONSTRAINT [FK_Examination_Subject];
GO
IF OBJECT_ID(N'[dbo].[FK_Registration_Course]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Registration] DROP CONSTRAINT [FK_Registration_Course];
GO
IF OBJECT_ID(N'[dbo].[FK_Registration_Student]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Registration] DROP CONSTRAINT [FK_Registration_Student];
GO
IF OBJECT_ID(N'[dbo].[FK_Subject_Course]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Subject] DROP CONSTRAINT [FK_Subject_Course];
GO
IF OBJECT_ID(N'[dbo].[FK_Subject_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Subject] DROP CONSTRAINT [FK_Subject_User];
GO
IF OBJECT_ID(N'[dbo].[FK_SubjectQuestion_Subject]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubjectQuestion] DROP CONSTRAINT [FK_SubjectQuestion_Subject];
GO
IF OBJECT_ID(N'[dbo].[FK_SubjectQuestion_SubjectAnswer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubjectQuestion] DROP CONSTRAINT [FK_SubjectQuestion_SubjectAnswer];
GO
IF OBJECT_ID(N'[dbo].[FK_User_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_Role];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Course]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Course];
GO
IF OBJECT_ID(N'[dbo].[Examination]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Examination];
GO
IF OBJECT_ID(N'[dbo].[Registration]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Registration];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[Subject]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subject];
GO
IF OBJECT_ID(N'[dbo].[SubjectAnswer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubjectAnswer];
GO
IF OBJECT_ID(N'[dbo].[SubjectQuestion]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubjectQuestion];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(300)  NOT NULL,
    [rank] int  NOT NULL,
    [imgUrl] nvarchar(50)  NULL,
    [overview] varchar(max)  NULL
);
GO

-- Creating table 'Examinations'
CREATE TABLE [dbo].[Examinations] (
    [StudentID] int  NOT NULL,
    [SubjectID] int  NOT NULL,
    [PraticalScore] real  NULL,
    [ThesisScore] real  NULL,
    [status] int  NULL,
    [ThesisDoneTime] nvarchar(50)  NULL,
    [PraticalDoneTime] nvarchar(50)  NULL,
    [PracticalFile] nvarchar(50)  NULL
);
GO

-- Creating table 'Registrations'
CREATE TABLE [dbo].[Registrations] (
    [StudentID] int  NOT NULL,
    [CourseID] int  NOT NULL,
    [status] int  NOT NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(50)  NOT NULL
);
GO

-- Creating table 'Subjects'
CREATE TABLE [dbo].[Subjects] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [name] nvarchar(200)  NOT NULL,
    [information] varchar(max)  NOT NULL,
    [PraticalFile] nvarchar(100)  NOT NULL,
    [PraticalText] nvarchar(100)  NOT NULL,
    [TeacherID] int  NOT NULL,
    [CourseID] int  NOT NULL,
    [NumberOfQuestion] int  NOT NULL,
    [ThesisTime] int  NOT NULL,
    [imgUrl] nvarchar(50)  NULL,
    [overview] varchar(max)  NULL
);
GO

-- Creating table 'SubjectAnswers'
CREATE TABLE [dbo].[SubjectAnswers] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [answer] varchar(max)  NOT NULL,
    [result] bit  NOT NULL,
    [SubjectQuestionID] int  NOT NULL
);
GO

-- Creating table 'SubjectQuestions'
CREATE TABLE [dbo].[SubjectQuestions] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [question] varchar(max)  NOT NULL,
    [SubjectID] int  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [username] nvarchar(50)  NOT NULL,
    [password] nvarchar(50)  NOT NULL,
    [address] nvarchar(200)  NOT NULL,
    [email] nvarchar(200)  NOT NULL,
    [rank] int  NULL,
    [roleId] int  NULL,
    [company] nvarchar(50)  NULL,
    [information] varchar(max)  NULL,
    [imgUrl] nvarchar(50)  NULL,
    [name] nvarchar(50)  NULL,
    [age] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ID] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [StudentID], [SubjectID] in table 'Examinations'
ALTER TABLE [dbo].[Examinations]
ADD CONSTRAINT [PK_Examinations]
    PRIMARY KEY CLUSTERED ([StudentID], [SubjectID] ASC);
GO

-- Creating primary key on [StudentID], [CourseID] in table 'Registrations'
ALTER TABLE [dbo].[Registrations]
ADD CONSTRAINT [PK_Registrations]
    PRIMARY KEY CLUSTERED ([StudentID], [CourseID] ASC);
GO

-- Creating primary key on [Id] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ID] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [PK_Subjects]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'SubjectAnswers'
ALTER TABLE [dbo].[SubjectAnswers]
ADD CONSTRAINT [PK_SubjectAnswers]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'SubjectQuestions'
ALTER TABLE [dbo].[SubjectQuestions]
ADD CONSTRAINT [PK_SubjectQuestions]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- Creating primary key on [ID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CourseID] in table 'Registrations'
ALTER TABLE [dbo].[Registrations]
ADD CONSTRAINT [FK_Registration_Course]
    FOREIGN KEY ([CourseID])
    REFERENCES [dbo].[Courses]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Registration_Course'
CREATE INDEX [IX_FK_Registration_Course]
ON [dbo].[Registrations]
    ([CourseID]);
GO

-- Creating foreign key on [CourseID] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [FK_Subject_Course]
    FOREIGN KEY ([CourseID])
    REFERENCES [dbo].[Courses]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Subject_Course'
CREATE INDEX [IX_FK_Subject_Course]
ON [dbo].[Subjects]
    ([CourseID]);
GO

-- Creating foreign key on [StudentID] in table 'Examinations'
ALTER TABLE [dbo].[Examinations]
ADD CONSTRAINT [FK_Examination_Student1]
    FOREIGN KEY ([StudentID])
    REFERENCES [dbo].[Users]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [SubjectID] in table 'Examinations'
ALTER TABLE [dbo].[Examinations]
ADD CONSTRAINT [FK_Examination_Subject]
    FOREIGN KEY ([SubjectID])
    REFERENCES [dbo].[Subjects]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Examination_Subject'
CREATE INDEX [IX_FK_Examination_Subject]
ON [dbo].[Examinations]
    ([SubjectID]);
GO

-- Creating foreign key on [StudentID] in table 'Registrations'
ALTER TABLE [dbo].[Registrations]
ADD CONSTRAINT [FK_Registration_Student]
    FOREIGN KEY ([StudentID])
    REFERENCES [dbo].[Users]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [roleId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_User_Role]
    FOREIGN KEY ([roleId])
    REFERENCES [dbo].[Roles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_User_Role'
CREATE INDEX [IX_FK_User_Role]
ON [dbo].[Users]
    ([roleId]);
GO

-- Creating foreign key on [TeacherID] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [FK_Subject_User]
    FOREIGN KEY ([TeacherID])
    REFERENCES [dbo].[Users]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Subject_User'
CREATE INDEX [IX_FK_Subject_User]
ON [dbo].[Subjects]
    ([TeacherID]);
GO

-- Creating foreign key on [SubjectID] in table 'SubjectQuestions'
ALTER TABLE [dbo].[SubjectQuestions]
ADD CONSTRAINT [FK_SubjectQuestion_Subject]
    FOREIGN KEY ([SubjectID])
    REFERENCES [dbo].[Subjects]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubjectQuestion_Subject'
CREATE INDEX [IX_FK_SubjectQuestion_Subject]
ON [dbo].[SubjectQuestions]
    ([SubjectID]);
GO

-- Creating foreign key on [SubjectID] in table 'SubjectQuestions'
ALTER TABLE [dbo].[SubjectQuestions]
ADD CONSTRAINT [FK_SubjectQuestion_SubjectAnswer]
    FOREIGN KEY ([SubjectID])
    REFERENCES [dbo].[SubjectAnswers]
        ([ID])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SubjectQuestion_SubjectAnswer'
CREATE INDEX [IX_FK_SubjectQuestion_SubjectAnswer]
ON [dbo].[SubjectQuestions]
    ([SubjectID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------