USE [TicketsManager]
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
SET IDENTITY_INSERT [dbo].[Status] ON 
GO
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (1, N'Creado', 1)
GO
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (2, N'En revisión', 1)
GO
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (3, N'Asignado', 1)
GO
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (4, N'Resuelto', 1)
GO
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (5, N'Finalizado', 1)
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
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
SET IDENTITY_INSERT [dbo].[Incident] ON 
GO
INSERT [dbo].[Incident] ([Id], [User_Id], [RequestBy_Id], [Category_Id], [Theme], [Description], [Priority_Id], [Status_Id], [Created], [Resolved], [Attended]) VALUES (4, N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', 8, N'Prueba de incidente', N'Esto es un incidente', 3, 1, CAST(N'2021-07-30T22:03:56.6863517' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Incident] ([Id], [User_Id], [RequestBy_Id], [Category_Id], [Theme], [Description], [Priority_Id], [Status_Id], [Created], [Resolved], [Attended]) VALUES (9, N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', NULL, 9, N'Prueba', N'Esto es un incidente de prueba', 3, 1, CAST(N'2021-08-02T00:45:10.6506534' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Incident] ([Id], [User_Id], [RequestBy_Id], [Category_Id], [Theme], [Description], [Priority_Id], [Status_Id], [Created], [Resolved], [Attended]) VALUES (10, N'0abdb749-f329-4145-b39e-ed09047dc8c9', NULL, 9, N'Prueba Usuario3 ', N'Esto es un incidente de usuario 3', 3, 1, CAST(N'2021-08-05T22:37:13.8311386' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Incident] ([Id], [User_Id], [RequestBy_Id], [Category_Id], [Theme], [Description], [Priority_Id], [Status_Id], [Created], [Resolved], [Attended]) VALUES (11, N'268a6b2f-36a9-4180-b46e-ac7cdc8b46cd', NULL, 7, N'Incidente de prueba Usuario Cliente', N'Esto es un Cliente', 4, 1, CAST(N'2021-08-06T00:02:22.7590677' AS DateTime2), NULL, NULL)
GO
INSERT [dbo].[Incident] ([Id], [User_Id], [RequestBy_Id], [Category_Id], [Theme], [Description], [Priority_Id], [Status_Id], [Created], [Resolved], [Attended]) VALUES (12, N'268a6b2f-36a9-4180-b46e-ac7cdc8b46cd', NULL, 9, N'Prueba', N'Esto es una prueba', 4, 1, CAST(N'2021-08-07T15:30:12.2929756' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Incident] OFF
GO
SET IDENTITY_INSERT [dbo].[Sesion] ON 
GO
INSERT [dbo].[Sesion] ([Id], [User_Id], [Incident_Id], [Description], [Hour], [Created]) VALUES (1, N'5cacd309-53bc-404b-b941-a4b19af6f83d', 4, N'Prueba de sesion', 2, CAST(N'2021-08-05T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Sesion] ([Id], [User_Id], [Incident_Id], [Description], [Hour], [Created]) VALUES (2, N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', 9, N'Esto es una prueba', 2, CAST(N'2021-08-04T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Sesion] ([Id], [User_Id], [Incident_Id], [Description], [Hour], [Created]) VALUES (3, N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', 9, N'Esto es otra prueba', 2, CAST(N'2021-08-05T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Sesion] ([Id], [User_Id], [Incident_Id], [Description], [Hour], [Created]) VALUES (4, N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', 10, N'Esto es una sesión de prueba', 2, CAST(N'2021-08-07T15:30:53.6136073' AS DateTime2))
GO
INSERT [dbo].[Sesion] ([Id], [User_Id], [Incident_Id], [Description], [Hour], [Created]) VALUES (5, N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', 10, N'Sesion 2', 3, CAST(N'2021-08-07T15:31:20.9979551' AS DateTime2))
GO
INSERT [dbo].[Sesion] ([Id], [User_Id], [Incident_Id], [Description], [Hour], [Created]) VALUES (6, N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', 4, N'adasd', 1, CAST(N'2021-08-07T20:04:35.8249831' AS DateTime2))
GO
INSERT [dbo].[Sesion] ([Id], [User_Id], [Incident_Id], [Description], [Hour], [Created]) VALUES (7, N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', 10, N'hadaskdasjd', 23, CAST(N'2021-08-07T20:10:21.5454390' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Sesion] OFF
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([Id], [Name], [Active]) VALUES (1, N'TI', 1)
GO
INSERT [dbo].[Department] ([Id], [Name], [Active]) VALUES (2, N'Administrador', 1)
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator],  [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0abdb749-f329-4145-b39e-ed09047dc8c9','ApplicationUser', N'usuario3@correo.com', N'USUARIO3@CORREO.COM', N'usuario3@correo.com', N'USUARIO3@CORREO.COM', 0, N'AQAAAAEAACcQAAAAEGSf65V+Fab8JBrAKZ0fnuH3ZvnS4G0cyv8tZwGS4aEl2VdT57Suc33dymomY/lLQw==', N'IDV3VQMJZYWPCMX4Q73J5CNDEULA5ICD', N'a091cc14-8e98-4723-a621-52f4579bba0c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'268a6b2f-36a9-4180-b46e-ac7cdc8b46cd','ApplicationUser', N'usuario2@correo.com', N'USUARIO2@CORREO.COM', N'usuario2@correo.com', N'USUARIO2@CORREO.COM', 0, N'AQAAAAEAACcQAAAAENWjKQYyvkglOA3JeWpBMAwu+VI45Xme/TaBKTKPgRbo85lXyEek0jihTgq2Ma5zHw==', N'UATJUBFE2FZK2NIGB2DKACWWMV3R5GJZ', N'f4aef9f4-f252-4d7f-981a-35f023038326', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd482898c-7b15-490b-8ed4-6b8686a4f1d0','ApplicationUser', N'usuario@correo.com', N'USUARIO@CORREO.COM', N'usuario@correo.com', N'USUARIO@CORREO.COM', 0, N'AQAAAAEAACcQAAAAENDLBX9lAp9oie0KbTV6cd8OjV9KVyEUoaeFBayXqByQGttB/yf/5BD+xXQzUi3kAw==', N'QSBDCI5QLDT7C3UPFXP3CDQ3EGRBZQ55', N'971b2a45-38fb-49a9-a133-9cb9bcfcaf2f', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5cacd309-53bc-404b-b941-a4b19af6f83d', N'Soportista', N'SOPORTISTA', N'1d5d0de1-d577-4b2d-b3c3-d70a3ebcaf8d')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6824584c-7197-4f3a-b2b7-f5cfd347966f', N'Administrador', N'ADMINISTRADOR', N'34cf2dc5-362a-4fb4-a255-1ae29b8a469a')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8a8f4fa5-466d-4aea-8aba-7985b61dea5c', N'Cliente', N'CLIENTE', N'2258bd4b-5a27-44ff-9560-740c085fc46c')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0abdb749-f329-4145-b39e-ed09047dc8c9', N'5cacd309-53bc-404b-b941-a4b19af6f83d')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', N'6824584c-7197-4f3a-b2b7-f5cfd347966f')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'268a6b2f-36a9-4180-b46e-ac7cdc8b46cd', N'8a8f4fa5-466d-4aea-8aba-7985b61dea5c')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210714034330_Seguridad', N'5.0.8')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210808035733_updateIndentityUser', N'5.0.8')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210808040004_addUserDpt', N'5.0.8')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20210808040428_addUserDptReference', N'5.0.8')
GO
