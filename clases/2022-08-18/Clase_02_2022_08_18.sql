--insert into
-- << tabla (campo1,campo2,campo3,etc) >>
--values
-- << (valor1,valor2,valor3,etc) >>

insert into
 department
values 
 (55,'Prueba',122)

insert into
 department
 (department_id,name,location_id)
values 
 (58,'Prueba',122)

insert into
 department
 (department_id,name,location_id)
values 
 (59,'Prueba',122)

select * 
from department
where department_id = 58

select * 
from department
where department_id in (55,58,59)

select * 
from department
where name = 'Prueba'

select * 
from department
where name like 'Prueba%'

select * 
from department
where location_id = 122

delete
 from department 
 where department_id = 58

delete
 from department 
 where name = 'Prueba'

update <<tabla>>
set campo1 = valor1,
    campo2 = valor2,
    etc
<<condiciones>>

update department
set location_id = 167
where name = 'Hola'

update department
set location_id = 122
where name = 'Prueba'

select department_id, name , REGIONAL_GROUP
from department d
inner join location l
on l.location_id = d.location_id

select department_id, name , REGIONAL_GROUP
from department d , location l 
where l.location_id = d.location_id

savepoint 1
commit;
rollback;

savepoint 1
oper 1
oper 2
savepoint 2
oper 3


--Bloques Anonimos
-- comentarios
/*
Area optativa -> Declarativa
Area obligatoria -> Ejecucion 
Begin
 null
end;
Area optativa -> Manejo de Errores
*/

declare
 variables
 constantes
 types
 cursores

declare
 v_nombre   varchar2(15) default 'Pedro';
 v_edad     number(2);
 v_fecha    date := sysdate;
 v_encontre boolean;
 v_precio   number(6,2);
 c_iva      constant number(3,2) := 0.21;
 v_nom      employee.first_name%type default 'Juan'; -- formato de 1 campo
 vr_emple   employee%rowtype;         -- formato de 1 fila  


Begin
 --v_edad := :Edad;
 dbms_output.put_line('Edad: '||v_edad);

 v_precio := 100;
 dbms_output.put_line('precio: '||v_precio ||'+'||v_precio*c_iva);
 dbms_output.put_line('Nombre: '||v_nombre);
 
 v_nombre := 'Maria';
 dbms_output.put_line('Nombre: '||v_nombre);

 v_nombre := 'Pepe';
 dbms_output.put_line('Nombre: '||v_nombre);
 dbms_output.put_line('Fecha: '||v_fecha);

 null;

 vr_emple.first_name := 'Jose';
 vr_emple.salary := 1500;
 vr_emple.commission := 500;

 dbms_output.put_line(vr_emple.first_name||' '||vr_emple.salary||' '||vr_emple.commission);
end;

--
declare
 v_id  department.department_id%type;
 v_nom department.name%type;
Begin
 v_id  := :Id;
 v_nom := :Nom;

 insert into department (department_id,name) values (v_id,v_nom);

 dbms_output.put_line(v_id||' '||v_nom);
 end; 

 select * 
 from department
 where department_id = 60;
