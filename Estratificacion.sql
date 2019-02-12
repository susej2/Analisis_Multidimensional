USE TareaAnalisis;
IF OBJECT_ID('DimEstratificacion', 'U') IS NOT NULL
	DROP TABLE DimEstratificacion;
CREATE TABLE DimEstratificacion (
	ID int PRIMARY KEY,
	CodigoEstrato VARCHAR (10),
	Descripcion VARCHAR (50),
	Ano_Fab  INT,
	Tiempo_Est  INT,
	Hora_Inicio_Est  time,
	Hora_Final_Est  time,
	Ganancia_Obt money
)
;