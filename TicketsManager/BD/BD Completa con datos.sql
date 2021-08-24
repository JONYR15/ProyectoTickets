CREATE DATABASE [TicketsManager]

USE [TicketsManager]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 19/8/2021 16:42:26 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[DepartmentId] [int] NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[LastName] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[DocumentNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](150) NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incident]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Incident](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [nvarchar](450) NULL,
	[RequestBy_Id] [nvarchar](450) NULL,
	[Category_Id] [int] NOT NULL,
	[Theme] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Priority_Id] [int] NOT NULL,
	[Status_Id] [int] NULL,
	[Created] [datetime2](7) NOT NULL,
	[Resolved] [datetime2](7) NULL,
	[Attended] [datetime2](7) NULL,
 CONSTRAINT [PK_Incident] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priority]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priority](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Priority] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sesion]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sesion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [nvarchar](128) NULL,
	[Incident_Id] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Hour] [int] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Sesion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 19/8/2021 16:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210714034330_Seguridad', N'5.0.8')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210808035733_updateIndentityUser', N'5.0.8')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210808040004_addUserDpt', N'5.0.8')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210808040428_addUserDptReference', N'5.0.8')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210808051303_RecreateDb', N'5.0.8')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210812144900_AddNameAndLastNameToApplicationUser', N'5.0.8')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210812162210_AddDocumentNumberApplicationUser', N'5.0.8')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5cacd309-53bc-404b-b941-a4b19af6f83d', N'Soportista', N'SOPORTISTA', N'1d5d0de1-d577-4b2d-b3c3-d70a3ebcaf8d')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6824584c-7197-4f3a-b2b7-f5cfd347966f', N'Administrador', N'ADMINISTRADOR', N'34cf2dc5-362a-4fb4-a255-1ae29b8a469a')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8a8f4fa5-466d-4aea-8aba-7985b61dea5c', N'Cliente', N'CLIENTE', N'2258bd4b-5a27-44ff-9560-740c085fc46c')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'75161a62-dbd5-467e-aff3-c3c9416d0e3e', N'5cacd309-53bc-404b-b941-a4b19af6f83d')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0d482cce-e3b7-43bf-8ef3-781829a61aef', N'6824584c-7197-4f3a-b2b7-f5cfd347966f')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ecad93dd-b0fb-44c2-bbf3-02753b1ff6a1', N'8a8f4fa5-466d-4aea-8aba-7985b61dea5c')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [DepartmentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [LastName], [Name], [DocumentNumber]) VALUES (N'0abdb749-f329-4145-b39e-ed09047dc8c9', N'ApplicationUser', 1, N'usuario3@correo.com', N'USUARIO3@CORREO.COM', N'Bernan-1103@hotmail.com', N'USUARIO3@CORREO.COM', 0, N'AQAAAAEAACcQAAAAEGSf65V+Fab8JBrAKZ0fnuH3ZvnS4G0cyv8tZwGS4aEl2VdT57Suc33dymomY/lLQw==', N'IDV3VQMJZYWPCMX4Q73J5CNDEULA5ICD', N'a091cc14-8e98-4723-a621-52f4579bba0c', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [DepartmentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [LastName], [Name], [DocumentNumber]) VALUES (N'0d482cce-e3b7-43bf-8ef3-781829a61aef', N'ApplicationUser', 2, N'Adminitrador@correo.com', N'ADMINITRADOR@CORREO.COM', N'Adminitrador@correo.com', N'ADMINITRADOR@CORREO.COM', 0, N'AQAAAAEAACcQAAAAEA93zHtsoaivPFkRXy/59AWOdA7tWn3ahDdMKI26Ifj0KGwkdQhlMaoeb9vpxfie1Q==', N'ZY26FXR7WZIECEV5LWECH3RDFY6PODPV', N'188501ca-16d7-450f-8589-f8edbfd96fee', NULL, 0, 0, NULL, 1, 0, N'UREÑA LOPEZ', N'BERNAN EDUARDO', N'116460173')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [DepartmentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [LastName], [Name], [DocumentNumber]) VALUES (N'268a6b2f-36a9-4180-b46e-ac7cdc8b46cd', N'ApplicationUser', 3, N'usuario2@correo.com', N'USUARIO2@CORREO.COM', N'Bernan-1103@hotmail.com', N'USUARIO2@CORREO.COM', 0, N'AQAAAAEAACcQAAAAENWjKQYyvkglOA3JeWpBMAwu+VI45Xme/TaBKTKPgRbo85lXyEek0jihTgq2Ma5zHw==', N'UATJUBFE2FZK2NIGB2DKACWWMV3R5GJZ', N'f4aef9f4-f252-4d7f-981a-35f023038326', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [DepartmentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [LastName], [Name], [DocumentNumber]) VALUES (N'75161a62-dbd5-467e-aff3-c3c9416d0e3e', N'ApplicationUser', 1, N'Soportista@correo.com', N'SOPORTISTA@CORREO.COM', N'Soportista@correo.com', N'SOPORTISTA@CORREO.COM', 0, N'AQAAAAEAACcQAAAAEGAYYsc8HrsXRspKQkTwC9Qza5vGIIVNpgS5mqqHO2DeRd8G1tz4+LzKVwMI4rnMxA==', N'YWZ43BZRNLLCY3SHDYNB7PAFRST3FH27', N'496f71f8-d9da-4431-9773-c2f720ca5f28', NULL, 0, 0, NULL, 1, 0, N'JIMENEZ MORA', N'LEONARDO', N'103170573')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [DepartmentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [LastName], [Name], [DocumentNumber]) VALUES (N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', N'ApplicationUser', 2, N'administrador@correo.com', N'USUARIO@CORREO.COM', N'Bernan-1103@hotmail.com', N'USUARIO@CORREO.COM', 0, N'AQAAAAEAACcQAAAAENDLBX9lAp9oie0KbTV6cd8OjV9KVyEUoaeFBayXqByQGttB/yf/5BD+xXQzUi3kAw==', N'QSBDCI5QLDT7C3UPFXP3CDQ3EGRBZQ55', N'971b2a45-38fb-49a9-a133-9cb9bcfcaf2f', NULL, 0, 0, NULL, 1, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [DepartmentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [LastName], [Name], [DocumentNumber]) VALUES (N'ecad93dd-b0fb-44c2-bbf3-02753b1ff6a1', N'ApplicationUser', 3, N'Cliente@correo.com', N'CLIENTE@CORREO.COM', N'Cliente@correo.com', N'CLIENTE@CORREO.COM', 0, N'AQAAAAEAACcQAAAAEOBsLYRQkMaX/B6v/U4fK1XVoGXj6DCHYQniLg7jsdpxcMwEUTgJnvC15QLCgfcbfw==', N'XFZWTWBOO5OZGL7GAX22BZNH7ASHOTUD', N'3efa1181-4dd1-46a0-a48d-2a39e1c03f39', NULL, 0, 0, NULL, 1, 0, N'RODRIGUEZ VALVERDE', N'ESDRAS', N'103170601')
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (1, N'Aplicaciones de Negocio', 1)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (2, N'Asistencia en Desarrollo de Soluciones', 1)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (3, N'Colaboración y Productividad', 1)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (4, N'Gestión de Identidades', 1)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (5, N'Redes y Telecomunicaciones', 1)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (6, N'Seguridad', 1)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (7, N'Servicios en la Nube', 1)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (8, N'Soporte a usuario final', 1)
GO
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (9, N'Soporte y asesoria en infraestructura tecnológica', 1)
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([Id], [Name], [Active]) VALUES (1, N'TI', 1)
GO
INSERT [dbo].[Department] ([Id], [Name], [Active]) VALUES (2, N'Administrador', 1)
GO
INSERT [dbo].[Department] ([Id], [Name], [Active]) VALUES (3, N'INS', 1)
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Incident] ON 
GO
INSERT [dbo].[Incident] ([Id], [User_Id], [RequestBy_Id], [Category_Id], [Theme], [Description], [Priority_Id], [Status_Id], [Created], [Resolved], [Attended]) VALUES (23, N'0d482cce-e3b7-43bf-8ef3-781829a61aef', N'75161a62-dbd5-467e-aff3-c3c9416d0e3e', 9, N'Incidente #1', N'Esto es un incidente', 3, 2, CAST(N'2021-08-18T22:28:29.8656835' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Incident] OFF
GO
SET IDENTITY_INSERT [dbo].[Priority] ON 
GO
INSERT [dbo].[Priority] ([Id], [Description], [Active]) VALUES (2, N'Baja', 1)
GO
INSERT [dbo].[Priority] ([Id], [Description], [Active]) VALUES (3, N'Medio', 1)
GO
INSERT [dbo].[Priority] ([Id], [Description], [Active]) VALUES (4, N'Alto', 1)
GO
INSERT [dbo].[Priority] ([Id], [Description], [Active]) VALUES (5, N'Critico', 1)
GO
SET IDENTITY_INSERT [dbo].[Priority] OFF
GO
SET IDENTITY_INSERT [dbo].[Sesion] ON 
GO
INSERT [dbo].[Sesion] ([Id], [User_Id], [Incident_Id], [Description], [Hour], [Created]) VALUES (11, N'0d482cce-e3b7-43bf-8ef3-781829a61aef', 23, N'Prueba de sesión', 1, CAST(N'2021-08-18T23:33:29.5493239' AS DateTime2))
GO
INSERT [dbo].[Sesion] ([Id], [User_Id], [Incident_Id], [Description], [Hour], [Created]) VALUES (12, N'0d482cce-e3b7-43bf-8ef3-781829a61aef', 23, N'xvxcv', 1, CAST(N'2021-08-19T00:08:24.4250402' AS DateTime2))
GO
INSERT [dbo].[Sesion] ([Id], [User_Id], [Incident_Id], [Description], [Hour], [Created]) VALUES (13, N'0d482cce-e3b7-43bf-8ef3-781829a61aef', 23, N'sdfsdfsd', 3, CAST(N'2021-08-19T10:29:10.6900762' AS DateTime2))
GO
INSERT [dbo].[Sesion] ([Id], [User_Id], [Incident_Id], [Description], [Hour], [Created]) VALUES (14, N'0d482cce-e3b7-43bf-8ef3-781829a61aef', 23, N'jkbhjbjb', 5, CAST(N'2021-08-19T10:30:49.3762905' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Sesion] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 
GO
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (1, N'Sin atender', 1)
GO
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (2, N'En proceso', 1)
GO
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (5, N'Finalizado', 1)
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
ALTER TABLE [dbo].[Category] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Department] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Priority] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Status] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Department_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Department_DepartmentId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Incidente_dbo.Estado_Estado_Id] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_dbo.Incidente_dbo.Estado_Estado_Id]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Incidente_dbo.Prioridad_Prioridad_Id] FOREIGN KEY([Priority_Id])
REFERENCES [dbo].[Priority] ([Id])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_dbo.Incidente_dbo.Prioridad_Prioridad_Id]
GO
ALTER TABLE [dbo].[Incident]  WITH CHECK ADD  CONSTRAINT [FK_Incident_Category] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Incident] CHECK CONSTRAINT [FK_Incident_Category]
GO
ALTER TABLE [dbo].[Sesion]  WITH CHECK ADD  CONSTRAINT [FK__Sesion__Incident__14270015] FOREIGN KEY([Incident_Id])
REFERENCES [dbo].[Incident] ([Id])
GO
ALTER TABLE [dbo].[Sesion] CHECK CONSTRAINT [FK__Sesion__Incident__14270015]
GO
