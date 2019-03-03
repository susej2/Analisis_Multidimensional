insert
into [TareaAnalisis]..FactEstacionamiento

select e.IDParqueo, v.IDVehiculo, e.TarifaBase, e.Ganancia, e.Mantenimiento, e.ImpVentas, e.TotalACobrar,
e.FechaHoraIngreso, e.FechaHoraSalida, 
from [TareaAnalisis]..Estacionamiento e
inner join Vehiculo v on v.IDVehiculo = e.IDVehiculo






order by 1 asc;