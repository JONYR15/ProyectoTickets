USE [TicketsManager]
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
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (1, N'Sin atender', 1)
GO
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (2, N'En proceso', 1)
GO
INSERT [dbo].[Status] ([Id], [Description], [Active]) VALUES (5, N'Finalizado', 1)
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'5cacd309-53bc-404b-b941-a4b19af6f83d', N'Soportista', N'SOPORTISTA', N'1d5d0de1-d577-4b2d-b3c3-d70a3ebcaf8d')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'6824584c-7197-4f3a-b2b7-f5cfd347966f', N'Administrador', N'ADMINISTRADOR', N'34cf2dc5-362a-4fb4-a255-1ae29b8a469a')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'8a8f4fa5-466d-4aea-8aba-7985b61dea5c', N'Cliente', N'CLIENTE', N'2258bd4b-5a27-44ff-9560-740c085fc46c')
GO