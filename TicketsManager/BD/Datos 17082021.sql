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
