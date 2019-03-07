USE TareaAnalisis;
IF OBJECT_ID('DimEstratificacion', 'U') IS NOT NULL
	DROP TABLE DimEstratificacion;

CREATE TABLE [dbo].[DimEstratificacion](
	[ID] [int] PRIMARY KEY,
	[CodigoEstrato] [nvarchar](20) NULL,
	[Descripcion] [varchar](50) NULL,
	[Valor_Minimo] [nvarchar](50) NULL,
	[Valor_Maximo] [nvarchar](50) NULL,
	);
GO


