/*PRIMERO ELIMINAR POR COMPLETO TODA LA BD, LUEGO
CORRER EN EL PROYECTO EL COMANDO UPDATE-DATABASE EN LA CAPA BACKEND,

DE ULTIMO, EJECUTAR ESTOS COMANDOS

*/



USE [TicketsManager]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5cacd309-53bc-404b-b941-a4b19af6f83d', N'Soportista', N'SOPORTISTA', N'1d5d0de1-d577-4b2d-b3c3-d70a3ebcaf8d')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6824584c-7197-4f3a-b2b7-f5cfd347966f', N'Administrador', N'ADMINISTRADOR', N'34cf2dc5-362a-4fb4-a255-1ae29b8a469a')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8a8f4fa5-466d-4aea-8aba-7985b61dea5c', N'Cliente', N'CLIENTE', N'2258bd4b-5a27-44ff-9560-740c085fc46c')
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
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [DepartmentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'0abdb749-f329-4145-b39e-ed09047dc8c9', N'ApplicationUser', 1, N'usuario3@correo.com', N'USUARIO3@CORREO.COM', N'Bernan-1103@hotmail.com', N'USUARIO3@CORREO.COM', 0, N'AQAAAAEAACcQAAAAEGSf65V+Fab8JBrAKZ0fnuH3ZvnS4G0cyv8tZwGS4aEl2VdT57Suc33dymomY/lLQw==', N'IDV3VQMJZYWPCMX4Q73J5CNDEULA5ICD', N'a091cc14-8e98-4723-a621-52f4579bba0c', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [DepartmentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'268a6b2f-36a9-4180-b46e-ac7cdc8b46cd', N'ApplicationUser', 3, N'usuario2@correo.com', N'USUARIO2@CORREO.COM', N'Bernan-1103@hotmail.com', N'USUARIO2@CORREO.COM', 0, N'AQAAAAEAACcQAAAAENWjKQYyvkglOA3JeWpBMAwu+VI45Xme/TaBKTKPgRbo85lXyEek0jihTgq2Ma5zHw==', N'UATJUBFE2FZK2NIGB2DKACWWMV3R5GJZ', N'f4aef9f4-f252-4d7f-981a-35f023038326', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [DepartmentId], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', N'ApplicationUser', 2, N'administrador@correo.com', N'USUARIO@CORREO.COM', N'Bernan-1103@hotmail.com', N'USUARIO@CORREO.COM', 0, N'AQAAAAEAACcQAAAAENDLBX9lAp9oie0KbTV6cd8OjV9KVyEUoaeFBayXqByQGttB/yf/5BD+xXQzUi3kAw==', N'QSBDCI5QLDT7C3UPFXP3CDQ3EGRBZQ55', N'971b2a45-38fb-49a9-a133-9cb9bcfcaf2f', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0abdb749-f329-4145-b39e-ed09047dc8c9', N'5cacd309-53bc-404b-b941-a4b19af6f83d')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', N'6824584c-7197-4f3a-b2b7-f5cfd347966f')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'268a6b2f-36a9-4180-b46e-ac7cdc8b46cd', N'8a8f4fa5-466d-4aea-8aba-7985b61dea5c')
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
SET IDENTITY_INSERT [dbo].[Incident] ON 
GO
INSERT [dbo].[Incident] ([Id], [User_Id], [RequestBy_Id], [Category_Id], [Theme], [Description], [Priority_Id], [Status_Id], [Created], [Resolved], [Attended]) VALUES (13, N'd482898c-7b15-490b-8ed4-6b8686a4f1d0', N'268a6b2f-36a9-4180-b46e-ac7cdc8b46cd', 7, N'Prueba', N'Esto es una prueba de incidente', 3, 1, CAST(N'2021-08-07T23:54:56.0716221' AS DateTime2), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Incident] OFF
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
