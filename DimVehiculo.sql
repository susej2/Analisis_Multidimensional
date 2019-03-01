use TareaAnalisis

IF OBJECT_ID('DimVehiculo', 'U') IS NOT NULL
	DROP TABLE DimVehiculo;
CREATE TABLE DimVehiculo(
Id_Vehiculo int,
Tipo_Vehiculo nvarchar(50),
Fab_Vehiculo nvarchar(50),
Pais_Fab_Vehiculo nvarchar(50),
Abv_Pais_Fab_Vehiculo nvarchar(50),
Region_Fab_Vehiculo nvarchar(50),
Continente_Fab_Vehiculo nvarchar(50),
Estrato_Ano_Fab int
);
