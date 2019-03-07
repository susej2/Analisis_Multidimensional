USE TareaAnalisis;
IF OBJECT_ID('FactEstacionamiento', 'U') IS NOT NULL
	DROP TABLE FactEstacionamiento;
CREATE TABLE FactEstacionamiento (
	[Id_Parqueo] int,
	[Id_Vehiculo] int,
	[TarifaBase] numeric(10,2),
	[Ganancia] numeric(10,2),
	[Mantenimiento] numeric(10,2),
	[ImpVentas] numeric(10,2),
	[TotalACobrar] numeric(10,2),	
	[FechaHoraIngreso] datetime,
	[FechaHoraSalida] datetime,
	[NombreFeriadoIngreso] varchar(50),
	[NombreFeriadoSalida] varchar(50),
	[CantidadDeMinutos] int,
	[IngresoEnDiaRestriccion] bit,
	[SalioEnDiaRestriccion] bit,
	[EstratoDiaRestriccion] int,
	[EstratoCantidadMinutos] int,
	[EstratoIngresoParteDelDia] time,
	[EstratoSalidaParteDelDia] time,
	[EstratoGanancia] numeric(10,2),	
);