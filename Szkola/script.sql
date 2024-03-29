USE [master]
GO
/****** Object:  Database [BazaSzkola]    Script Date: 2019-06-14 16:30:54 ******/
CREATE DATABASE [BazaSzkola]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BazaSzkola', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\BazaSzkola_Primary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BazaSzkola_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLSERVER\MSSQL\DATA\BazaSzkola_Primary.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BazaSzkola] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BazaSzkola].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BazaSzkola] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [BazaSzkola] SET ANSI_NULLS ON 
GO
ALTER DATABASE [BazaSzkola] SET ANSI_PADDING ON 
GO
ALTER DATABASE [BazaSzkola] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [BazaSzkola] SET ARITHABORT ON 
GO
ALTER DATABASE [BazaSzkola] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BazaSzkola] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BazaSzkola] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BazaSzkola] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BazaSzkola] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [BazaSzkola] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [BazaSzkola] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BazaSzkola] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [BazaSzkola] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BazaSzkola] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BazaSzkola] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BazaSzkola] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BazaSzkola] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BazaSzkola] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BazaSzkola] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BazaSzkola] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BazaSzkola] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BazaSzkola] SET RECOVERY FULL 
GO
ALTER DATABASE [BazaSzkola] SET  MULTI_USER 
GO
ALTER DATABASE [BazaSzkola] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [BazaSzkola] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BazaSzkola] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BazaSzkola] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [BazaSzkola] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BazaSzkola] SET QUERY_STORE = OFF
GO
USE [BazaSzkola]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Budynek]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Budynek](
	[BudynekID] [int] IDENTITY(1,1) NOT NULL,
	[Ulica] [nchar](50) NOT NULL,
	[Nr_budynku] [nchar](10) NOT NULL,
	[Kod_pocztowy] [nchar](10) NOT NULL,
	[Miejscowosc] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Budynek] PRIMARY KEY CLUSTERED 
(
	[BudynekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[C__RefactorLog]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[C__RefactorLog](
	[OperationKey] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_C__RefactorLog] PRIMARY KEY CLUSTERED 
(
	[OperationKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nauczyciel]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nauczyciel](
	[NauczycielID] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nchar](50) NOT NULL,
	[Nazwisko] [nchar](50) NOT NULL,
	[Stopien] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Nauczyciel] PRIMARY KEY CLUSTERED 
(
	[NauczycielID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prowadzi]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prowadzi](
	[ProwadziID] [int] IDENTITY(1,1) NOT NULL,
	[PrzedmiotID] [int] NOT NULL,
	[NauczycielID] [int] NOT NULL,
 CONSTRAINT [PK_Prowadzi] PRIMARY KEY CLUSTERED 
(
	[ProwadziID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Przedmiot]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Przedmiot](
	[PrzedmiotID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nchar](100) NOT NULL,
	[SalaID] [int] NOT NULL,
 CONSTRAINT [PK_Przedmiot] PRIMARY KEY CLUSTERED 
(
	[PrzedmiotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sala]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sala](
	[SalaID] [int] IDENTITY(1,1) NOT NULL,
	[Nazwa] [nchar](10) NOT NULL,
	[BudynekID] [int] NOT NULL,
 CONSTRAINT [PK_Sala] PRIMARY KEY CLUSTERED 
(
	[SalaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Imie] [nchar](50) NOT NULL,
	[Nazwisko] [nchar](50) NOT NULL,
	[Pesel] [nchar](11) NOT NULL,
	[Imie_matki] [nchar](50) NOT NULL,
	[Imie_ojca] [nchar](50) NOT NULL,
	[Data_urodzenia] [datetime] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zapisy]    Script Date: 2019-06-14 16:30:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zapisy](
	[ZapisyID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NOT NULL,
	[PrzedmiotID] [int] NOT NULL,
	[Data_zapisu] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Zapisy] PRIMARY KEY CLUSTERED 
(
	[ZapisyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_NauczycielProwadzi]    Script Date: 2019-06-14 16:30:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_NauczycielProwadzi] ON [dbo].[Prowadzi]
(
	[NauczycielID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PrzedmiotProwadzi]    Script Date: 2019-06-14 16:30:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_PrzedmiotProwadzi] ON [dbo].[Prowadzi]
(
	[PrzedmiotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_SalaPrzedmiot]    Script Date: 2019-06-14 16:30:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_SalaPrzedmiot] ON [dbo].[Przedmiot]
(
	[SalaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_BudynekSala]    Script Date: 2019-06-14 16:30:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_BudynekSala] ON [dbo].[Sala]
(
	[BudynekID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PrzedmiotZapisy]    Script Date: 2019-06-14 16:30:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_PrzedmiotZapisy] ON [dbo].[Zapisy]
(
	[PrzedmiotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_StudentZapisy]    Script Date: 2019-06-14 16:30:56 ******/
CREATE NONCLUSTERED INDEX [IX_FK_StudentZapisy] ON [dbo].[Zapisy]
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Prowadzi]  WITH CHECK ADD  CONSTRAINT [FK_NauczycielProwadzi] FOREIGN KEY([NauczycielID])
REFERENCES [dbo].[Nauczyciel] ([NauczycielID])
GO
ALTER TABLE [dbo].[Prowadzi] CHECK CONSTRAINT [FK_NauczycielProwadzi]
GO
ALTER TABLE [dbo].[Prowadzi]  WITH CHECK ADD  CONSTRAINT [FK_PrzedmiotProwadzi] FOREIGN KEY([PrzedmiotID])
REFERENCES [dbo].[Przedmiot] ([PrzedmiotID])
GO
ALTER TABLE [dbo].[Prowadzi] CHECK CONSTRAINT [FK_PrzedmiotProwadzi]
GO
ALTER TABLE [dbo].[Przedmiot]  WITH CHECK ADD  CONSTRAINT [FK_SalaPrzedmiot] FOREIGN KEY([SalaID])
REFERENCES [dbo].[Sala] ([SalaID])
GO
ALTER TABLE [dbo].[Przedmiot] CHECK CONSTRAINT [FK_SalaPrzedmiot]
GO
ALTER TABLE [dbo].[Sala]  WITH CHECK ADD  CONSTRAINT [FK_BudynekSala] FOREIGN KEY([BudynekID])
REFERENCES [dbo].[Budynek] ([BudynekID])
GO
ALTER TABLE [dbo].[Sala] CHECK CONSTRAINT [FK_BudynekSala]
GO
ALTER TABLE [dbo].[Zapisy]  WITH CHECK ADD  CONSTRAINT [FK_PrzedmiotZapisy] FOREIGN KEY([PrzedmiotID])
REFERENCES [dbo].[Przedmiot] ([PrzedmiotID])
GO
ALTER TABLE [dbo].[Zapisy] CHECK CONSTRAINT [FK_PrzedmiotZapisy]
GO
ALTER TABLE [dbo].[Zapisy]  WITH CHECK ADD  CONSTRAINT [FK_StudentZapisy] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Zapisy] CHECK CONSTRAINT [FK_StudentZapisy]
GO
USE [master]
GO
ALTER DATABASE [BazaSzkola] SET  READ_WRITE 
GO
