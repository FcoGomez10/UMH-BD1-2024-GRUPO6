
use mydb;

select * from tbl_domicilio;
select * from tbl_Tipopersona;
select * from tbl_persona;
select * from tbl_marcas;
select * from  tbl_Modelos;
select * from tbl_vehiculo;
select * from tbl_notario;
select * from tbl_Anotaciones;
select * from tbl_Solicitud;
select * from tbl_Proceso;

insert into tbl_Domicilio (id_domicilio, Departamento, Municipio, Barrio_Col, Num_Casa, Calle)
values
(1, "Francisco Morazan", "Tegucigalpa", "Colonia Kennedy", "1111", "Bronx"),
(2, "Cortes", "San Pedro Sula", "Prado Alto", "2222", "3ra Calle"),
(3, "Atlantida", "La Ceiba", "Barrio la Isla", "3333", "Principal Norte"), 
(4, "Yoro", "El Progreso", "Colonia Las Acacias", "4444", "2da Avenida"),
(5, "Olancho", "Catacamas", "El Pataste", "5555", "Ave San Jose");

insert into tbl_TipoPersona (id_TipoPersona, Tradente, Adquiriente, Rep_Legal_Adquiriente, Rep_Legal_Tradente, Gestor)
values (1, "Si", "No", "No", "No", "No"),
(2, "No", "Si", "No", "No", "No"),
(3, "No", "No", "Si", "No", "No"),
(4, "No", "No", "No", "Si", "No"),
(5, "No", "No", "No", "No", "Si");

insert into tbl_Persona (id_persona, Nombre, DNI, No_Telefono, Correo_Electronico, Id_Domicilio)
values (1, "Pedro Dominguez", "0801-1994-16354", "9832-5476", "pedomin@gmail.com", 1),
(2, "Jose Lopez", "0501-1985-32543", "9934-4577", "josez@gmail.com", 2),
(3, "Carlos Reyes", "0301-1988-45345", "9388-6444", "carrey@gmail.com", 3),
(4, "Ana Gomez", "0201-1978-32435", "3299-9495", "anamez@gmail.com", 4),
(5, "Maria Lopez", "0501-1967-34234", "5434-3456", "marpez@gmail.com", 5); 

insert into tbl_marcas (id_Marcas, Marca)
values (1, "Honda");

insert into tbl_Modelos(id_modelos, Modelo, Tipo, Cilindraje, Combustible, id_Marcas)
values (1, "Civic", "Sedan", "1800", "Gasolina", 1);

insert into tbl_vehiculo (id_Vehiculo, No_Placa, Anio, Color, No_VIN, No_Motor, Valor_Vehiculo, tbl_modelos_id_modelos)
values (1, "HND-1564", "2016-01-01", "Gris", "VIN12345ABC", "PJ12345U123456P", 300000.00, 1);

insert into tbl_notario (id_Notario, Nombre, No_Exequatur, No_Certificado_autenticidad, No_telefono, Correo_Electronico)
values (1, "Carlos Domingo", "1356", "CERT12345", "4322-2366", "carmingo@gmail.com");

insert into tbl_Anotaciones (id_Anotaciones, Condiciones_especiales, Ciudad, Fecha)
values (1, "Vehiculo con hipoteca", "Tegucigalpa", "2024-12-07");

insert into tbl_Solicitud (id_Solicitud, Estado, Fecha, id_Vehiculo, Id_Notario, Id_Anotaciones)
values (1, "Aprobada", "2024-12-07 10:00:00", 1, 1, 1);

insert into tbl_Proceso (id_Persona, id_TipoPersona, id_Solicitud)
values (1, 1, 1),
(2, 2, 1),
(3, 3, 1), 
(4, 4, 1),
(5, 5, 1);

SELECT 
    p.id_Persona, p.Nombre, p.DNI, p.No_Telefono, d.Departamento, d.Municipio, sp.id_TipoPersona,
    tp.Tradente, tp.Adquiriente, tp.Rep_Legal_Adquiriente, tp.Rep_Legal_Tradente, tp.Gestor
FROM 
    tbl_proceso sp
JOIN 
    tbl_Persona p ON sp.id_Persona = p.id_Persona
LEFT JOIN 
    tbl_Domicilio d ON p.id_Domicilio = d.id_Domicilio
JOIN 
    tbl_TipoPersona tp ON sp.id_TipoPersona = tp.id_TipoPersona
WHERE 
    sp.id_Solicitud = 1;





