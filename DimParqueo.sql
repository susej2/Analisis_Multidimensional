use TareaAnalisis;
IF OBJECT_ID('DimParqueo', 'U') IS NOT NULL
	DROP TABLE DimParqueo;
CREATE TABLE DimParqueo(

Id_Parqueo int, 
Distrito_Parqueo int,
Provincia_Parqueo int,
Canton_Parqueo int
)