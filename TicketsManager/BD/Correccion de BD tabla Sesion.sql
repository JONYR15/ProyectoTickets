ALTER TABLE [dbo].[Sesion]   
DROP CONSTRAINT [FK_dbo.Sesion_dbo.Estado_Estado_Id];   

  
ALTER TABLE [dbo].[Sesion] DROP COLUMN [Status_Id];

ALTER TABLE [dbo].[Sesion] 
ADD FOREIGN KEY ([Incident_Id]) REFERENCES [dbo].[Incident]([Id]); 