
insert 
into [TareaAnalisis]..DimParqueo

select p.IDParqueo, d.Descripcion as 'Nombre Distrito', pr.Descripcion as 'Nombre Provincia',ca.Descripcion as 'Nombre Canton'
from [ExamenAnalisis]..Parqueo p 
inner join [ExamenAnalisis]..Distrito d on p.ConsecutivoDistrito = d.ConsecutivoDistrito 
inner join [ExamenAnalisis]..Provincia pr on d.IDProvincia=pr.IDProvincia
inner join [ExamenAnalisis]..Canton ca on ca.IDCanton = d.IDCanton and ca.IDProvincia = d.IDProvincia
order by 1 asc;
