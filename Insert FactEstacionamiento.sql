-- delcara las variables a utilizar 
declare @count int 
-- tabla que tendra la data de estacionamiento pero con el dia y mes de entrada y salida ademas del vehiculo y parqueo 
declare @ESFeriado as TABLE (Id_Vehiculo int ,DiaE  int, MesE  int, DiaS  int,MesS int,fechaE date,fechasS date,Id_Parqueo int)
-- tabla que tendra la data de si el vehiculo estuvo parqueado en un dia feriado o no 
declare @Feriados as TABLE (Vehiculo int, EF nvarchar(20), SF nvarchar(20), Parqueo int)
declare @DiaE as int 
declare @DiaS as int 
declare @MesE as int 
declare @MesS as int 
declare @vehiculo as int 

--inserta la data de estacionamiento en ESFeriado 
insert into @ESFeriado 
select  IDVehiculo, DATEPART(day, FechaHoraIngreso) as 'Dia Entrada', DATEPART(MONTH, FechaHoraIngreso) as 'Mes Entrada', DATEPART(DAY, FechaHoraSalida) as 'Dia Salida', DATEPART(MONTH, FechaHoraSalida) as 'Mes Salida', FechaHoraIngreso,FechaHoraSalida,IDParqueo
from ExamenAnalisis..Estacionamiento

--contador usado para recorrer la tabla 
set @count = (select count(*) from @ESFeriado)

while @count> 0
BEGIN
--select el primer registro de la tabla 
set @DiaE = (SELECT TOP(1) DiaE FROM @ESFeriado)
set @DiaS=(SELECT TOP(1) DiaS FROM @ESFeriado)
set @MesE = (SELECT TOP(1) MesE FROM @ESFeriado)
set @MesS =(SELECT TOP(1) MesS FROM @ESFeriado)
set @vehiculo=  (SELECT TOP(1) Id_Vehiculo FROM @ESFeriado)

-- compara si el dia y mes son feriados 
if (@DiaE in (select DiaFeriado  from ExamenAnalisis..DiasFeriadosAnuales)) AND (@MesE in (select MesFeriado from ExamenAnalisis..DiasFeriadosAnuales))
begin
--si es feriado lo inserta y agrega el nombre del dia con tres iniciales 
insert into  @Feriados 
values (@vehiculo, (SELECT TOP(1) FORMAT(fechaE,'ddd') from  @ESFeriado) ,'Dia No Feriado', (SELECT TOP(1) Id_Parqueo FROM @ESFeriado))
end
else 
--si no es un dia feriado lo define como tal 
begin

insert into  @Feriados 
values (@vehiculo,'Dia No Feriado','Dia No Feriado',(SELECT TOP(1) Id_Parqueo FROM @ESFeriado))
end 

--actualiza la tabla si el dia y mes de salida son feriados tambien 
if (@DiaS in (select DiaFeriado  from ExamenAnalisis..DiasFeriadosAnuales)) AND (@MesS in (select MesFeriado from ExamenAnalisis..DiasFeriadosAnuales))
begin
update @Feriados 
set SF = (SELECT TOP(1) FORMAT(fechasS,'ddd') from  @ESFeriado)
where Vehiculo = @vehiculo
end 

--elimina el primer registro de la tabla 
DELETE TOP (1) FROM @ESFeriado
--actualiza el contador 
set @count = (select count(*) from @ESFeriado)

END 

--select * 
--from @Feriados
--order by 1;

SELECT e.IDVehiculo, EF as 'Dia Entrada',SF as 'Dia Salida', e.IDParqueo, e.TarifaBase, e.Ganancia, e.Mantenimiento, e.ImpVentas, e.TotalACobrar, (DATEDIFF(MINUTE, e.FechaHoraIngreso, e.FechaHoraSalida)) as 'Minutos' 
FROM @Feriados f Inner join [ExamenAnalisis]..Estacionamiento e on e.IDVehiculo = f.Vehiculo and e.IDParqueo= f.Parqueo
order by 4;
