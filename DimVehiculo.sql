use TareaAnalisis;

IF OBJECT_ID('DimVehiculo', 'U') IS NOT NULL
	DROP TABLE DimVehiculo;
CREATE TABLE DimVehiculo(
Id_Vehiculo int,
Tipo_Vehiculo nvarchar(20),
Fab_Vehiculo nvarchar(20),
Pais_Fab_Vehiculo nvarchar(20),
Abv_Pais_Fab_Vehiculo nvarchar(3),
Region_Fab_Vehiculo nvarchar(10),
Continente_Fab_Vehiculo nvarchar(10),
Estrato_Ano_Fab int
)