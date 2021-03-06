USE [TicketsManager]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2/8/2021 00:51:32 ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 2/8/2021 00:51:32 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2/8/2021 00:51:32 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2/8/2021 00:51:32 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2/8/2021 00:51:32 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2/8/2021 00:51:32 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2/8/2021 00:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
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
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 2/8/2021 00:51:32 ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 2/8/2021 00:51:32 ******/
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
/****** Object:  Table [dbo].[Department]    Script Date: 2/8/2021 00:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_dbo.Empresa] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Incident]    Script Date: 2/8/2021 00:51:32 ******/
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
 CONSTRAINT [PK_dbo.Incidente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priority]    Script Date: 2/8/2021 00:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priority](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_dbo.Prioridad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sesion]    Script Date: 2/8/2021 00:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sesion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [nvarchar](128) NULL,
	[Incident_Id] [int] NOT NULL,
	[Status_Id] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Hour] [int] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_dbo.Sesion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 2/8/2021 00:51:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_dbo.Estado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210714034330_Seguridad', N'5.0.8')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5cacd309-53bc-404b-b941-a4b19af6f83d', N'Soportista', N'SOPORTISTA', N'1d5d0de1-d577-4b2d-b3c3-d70a3ebcaf8d')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6824584c-7197-4f3a-b2b7-f5cfd347966f', N'Administrador', N'ADMINISTRADOR', N'34cf2dc5-362a-4fb4-a255-1ae29b8a469a')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8a8f4fa5-466d-4aea-8aba-7985b61dea5c', N'Cliente', N'CLIENTE', N'2258bd4b-5a27-44ff-9560-740c085fc46c')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0abdb749-f329-4145-b39e-ed09047dc8c9', N'5cacd309-53bc-404b-b941-a4b19af6f83d')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', N'6824584c-7197-4f3a-b2b7-f5cfd347966f')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0abdb749-f329-4145-b39e-ed09047dc8c9', N'usuario3@correo.com', N'USUARIO3@CORREO.COM', N'usuario3@correo.com', N'USUARIO3@CORREO.COM', 0, N'AQAAAAEAACcQAAAAEGSf65V+Fab8JBrAKZ0fnuH3ZvnS4G0cyv8tZwGS4aEl2VdT57Suc33dymomY/lLQw==', N'IDV3VQMJZYWPCMX4Q73J5CNDEULA5ICD', N'a091cc14-8e98-4723-a621-52f4579bba0c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'268a6b2f-36a9-4180-b46e-ac7cdc8b46cd', N'usuario2@correo.com', N'USUARIO2@CORREO.COM', N'usuario2@correo.com', N'USUARIO2@CORREO.COM', 0, N'AQAAAAEAACcQAAAAENWjKQYyvkglOA3JeWpBMAwu+VI45Xme/TaBKTKPgRbo85lXyEek0jihTgq2Ma5zHw==', N'UATJUBFE2FZK2NIGB2DKACWWMV3R5GJZ', N'f4aef9f4-f252-4d7f-981a-35f023038326', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', N'usuario@correo.com', N'USUARIO@CORREO.COM', N'usuario@correo.com', N'USUARIO@CORREO.COM', 0, N'AQAAAAEAACcQAAAAENDLBX9lAp9oie0KbTV6cd8OjV9KVyEUoaeFBayXqByQGttB/yf/5BD+xXQzUi3kAw==', N'QSBDCI5QLDT7C3UPFXP3CDQ3EGRBZQ55', N'971b2a45-38fb-49a9-a133-9cb9bcfcaf2f', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (1, N'Aplicaciones de Negocio', 1)
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (2, N'Asistencia en Desarrollo de Soluciones', 1)
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (3, N'Colaboración y Productividad', 1)
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (4, N'Gestión de Identidades', 1)
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (5, N'Redes y Telecomunicaciones', 1)
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (6, N'Seguridad', 1)
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (7, N'Servicios en la Nube', 1)
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (8, N'Soporte a usuario final', 1)
INSERT [dbo].[Category] ([Id], [CategoryName], [Active]) VALUES (9, N'Soporte y asesoria en infraestructura tecnológica', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Id], [Name], [Active]) VALUES (1, N'TI', 1)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Incident] ON 

INSERT [dbo].[Incident] ([Id], [User_Id], [RequestBy_Id], [Category_Id], [Theme], [Description], [Priority_Id], [Status_Id], [Created], [Resolved], [Attended]) VALUES (4, N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', 8, N'Prueba de incidente', N'Esto es un incidente', 3, 1, CAST(N'2021-07-30T22:03:56.6863517' AS DateTime2), NULL, NULL)
INSERT [dbo].[Incident] ([Id], [User_Id], [RequestBy_Id], [Category_Id], [Theme], [Description], [Priority_Id], [Status_Id], [Created], [Resolved], [Attended]) VALUES (9, N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', NULL, 9, N'Prueba', N'Esto es un incidente de prueba', 3, 1, CAST(N'2021-08-02T00:45:10.6506534' AS DateTime2), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Incident] OFF
GO
SET IDENTITY_INSERT [dbo].[Priority] ON 

INSERT [dbo].[Priority] ([Id], [Description], [Active]) VALUES (2, N'Baja', 1)
INSERT [dbo].[Priority] ([Id], [Description], [Active]) VALUES (3, N'Medio', 1)
INSERT [dbo].[Priority] ([Id], [Description], [Active]) VALUES (4, N'Alto', 1)
INSERT [dbo].[Priority] ([Id], [Description], [Active]) VALUES (5, N'Critico', 1)
SET IDENTITY_INSERT [dbo].[Priority] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (1, N'Creado', 1)
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (2, N'En revisión', 1)
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (3, N'Asignado', 1)
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (4, N'Resuelto', 1)
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (5, N'Finalizado', 1)
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Priority] ADD  CONSTRAINT [DF_Priority_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Status] ADD  CONSTRAINT [DF_Status_Active]  DEFAULT ((1)) FOR [Active]
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
ALTER TABLE [dbo].[Sesion]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Sesion_dbo.Estado_Estado_Id] FOREIGN KEY([Status_Id])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Sesion] CHECK CONSTRAINT [FK_dbo.Sesion_dbo.Estado_Estado_Id]
GO
