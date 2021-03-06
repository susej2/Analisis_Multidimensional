insert 
into [TareaAnalisis]..DimVehiculo

select v.IDVehiculo, tv.Descripcion as 'Nombre tipo vehiculo', f.NombreFabricante, p.NombrePais,p.AbreviaturaPais, rc.Descripcion as 'Nombre Region', c.Descripcion as 'Nombre Continente', v.Ano
from [ExamenAnalisis]..Vehiculo v
inner join [ExamenAnalisis]..TipoVehiculo tv on tv.IDTipoVehiculo = v.IDTipoVehiculo
inner join [ExamenAnalisis]..Fabricante f on f.IDFabricante = v.IDFabricante
inner join [ExamenAnalisis]..Pais p  on p.IDPais = f.IDPais
inner join [ExamenAnalisis]..RegionContinente rc on rc.IDRegionContinente = p.IDRegionContinente
inner join [ExamenAnalisis]..Continente c on c.IDContinente = rc.IDContinente
order by 1 asc;