USE [TicketsManager]
GO
SET IDENTITY_INSERT [dbo].[Priority] ON 
GO
INSERT [dbo].[Priority] ([Id], [Description]) VALUES (2, N'Baja')
GO
INSERT [dbo].[Priority] ([Id], [Description]) VALUES (3, N'Medio')
GO
INSERT [dbo].[Priority] ([Id], [Description]) VALUES (4, N'Alto')
GO
INSERT [dbo].[Priority] ([Id], [Description]) VALUES (5, N'Critico')
GO
SET IDENTITY_INSERT [dbo].[Priority] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 
GO
INSERT [dbo].[Status] ([Id], [Description]) VALUES (1, N'Creado')
GO
INSERT [dbo].[Status] ([Id], [Description]) VALUES (2, N'En revisión')
GO
INSERT [dbo].[Status] ([Id], [Description]) VALUES (3, N'Asignado')
GO
INSERT [dbo].[Status] ([Id], [Description]) VALUES (4, N'Resuelto')
GO
INSERT [dbo].[Status] ([Id], [Description]) VALUES (5, N'Finalizado')
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
