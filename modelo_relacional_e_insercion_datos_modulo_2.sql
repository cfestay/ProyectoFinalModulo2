CREATE TABLE usuarios ( 
idusuario number(9) primary key,
nombre varchar2(20), 
apellido varchar2(20) not null,
fechanac date not null,
runusuario number(10) not null

);


create table cliente (
idcliente number(9) primary key,
rutcliente number(9),
clinombres varchar2(30) not null,
cliapellidos varchar2(50) not null,
clitelefono varchar2(20) not null,
cliafp varchar2 (30),
clisistemasalud number (2),
clidireccion varchar2(100) not null,
clicomuna varchar2 (50) not null,
cliedad number(3) not null,
foreign key (idcliente)REFERENCES usuarios(idusuario)
);




create table admnistrativos (
idadministrativo number(9) primary key,
runad number(9),
nombresad VARCHAR2 (40) not null,
apellidosad varchar2(40) not null,
correoe  varchar2(50) not null,
area varchar2(30) not null,
foreign key (idadministrativo)REFERENCES usuarios(idusuario)
);

create table profesionales (
idprofesional number(9) primary key,
runpro number (9),
nombrespro VARCHAR2 (40) not null,
apellidospro varchar2(40) not null,
telefono varchar2 (20) not null,
titulopro varchar2 (15) not null,
proyecto varchar2 (20) not null,
foreign key (idprofesional)REFERENCES usuarios(idusuario)
);


create table capacitacion (
idcapacitacion number (9) primary key,
capfecha date not null,
caphora date,
caplugar varchar2 (100) not null,
capduracion number (4),
cliente_rutcliente number (9),
foreign key (idcapacitacion)REFERENCES cliente(idcliente)

);


create table accidente (
idaccidente number (9) primary key,
accifecha date not null,
accihora date not null,
accilugar varchar2(150) not null,
acciorigen varchar2(100) not null,
acciconsecuencias varchar2 (100),
cliente_rutcliente number (9),
foreign key (idaccidente)REFERENCES cliente(idcliente)

);


create table visita (
idvisita number (9) primary key,
visfecha date not null,
vishora date,
vislugar varchar2 (50) not null,
viscomentarios varchar2 (250) not null,
cliente_rutcliente number (9),
foreign key (idvisita )REFERENCES cliente(idcliente)

);

create table asistentes(
idasistente number (9) primary key,
asistnombrecompleto varchar2 (100) not null,
asistedad number(3) not null,
asistcorreo varchar2 (70),
asisttelefono varchar2 (20),
capacitacion_idcapacitacion number (9),
foreign key (capacitacion_idcapacitacion)REFERENCES capacitacion(idcapacitacion)
);

CREATE TABLE CHEQUEOS (
IDCHEQUEO NUMBER (9) PRIMARY KEY,
NOMCHEQUEO VARCHAR2(50) not null,
foreign key (IDCHEQUEO )REFERENCES visita (idvisita )

);

CREATE TABLE REGISTROCHEQUEO(
IDREGISTROCHEQUEO NUMBER (9) PRIMARY KEY,
CUMPLIMIENTO CHAR(1)NOT NULL,
OBSERVACIONES VARCHAR2(250),
foreign key (IDREGISTROCHEQUEO)REFERENCES CHEQUEOS(IDCHEQUEO)
);

create table pagocliente(
idcliente number (9) primary key,
idpago number (5), 
fechapago date not null,
montopago number (10) not null,
mes date not null,
años date not null,
foreign key (idcliente)REFERENCES cliente(idcliente)

);

CREATE SEQUENCE pag_seq;

CREATE OR REPLACE TRIGGER pag_bir 
BEFORE INSERT ON pagocliente  
FOR EACH ROW 
WHEN (new.idpago IS NULL) 
BEGIN 
  :new.idpago := pag_seq.NEXTVAL; 
END; 
/ 


create table asesorias (
idasesoria number (9) primary key,
fecha date not null,
motivo varchar2 (150) not null,
asesoria_idprofesional number(9), 
foreign key (asesoria_idprofesional)REFERENCES profesionales(idprofesional)
);


create table mejoras (
idmejoras number (9) primary key,
titulomej varchar2 (20) not null,
descripcion varchar2 (250) not null,
plazo number(2) not null, 
foreign key (idmejoras)REFERENCES asesorias(idasesoria)
);


CREATE SEQUENCE mej_seq;

CREATE OR REPLACE TRIGGER mej_bir 
BEFORE INSERT ON mejoras  
FOR EACH ROW 
WHEN (new.idmejoras IS NULL) 
BEGIN 
  :new.idmejoras := mej_seq.NEXTVAL; 
END; 
/ 

insert into usuarios values (1,'Gonzalo','Godoy', TO_DATE('1985/11/15 15:02:44', 'yyyy/mm/dd hh24:mi:ss'),16142083 );
insert into usuarios values (2,'Yossie','Muñoz', TO_DATE('1993/11/16 16:02:44', 'yyyy/mm/dd hh24:mi:ss'),18169593 );
insert into usuarios values (3,'Gustavo','Lima', TO_DATE('1978/11/18 15:02:44', 'yyyy/mm/dd hh24:mi:ss'),14467859 );

insert into cliente values (1,123423,'carlos felipe', 'estay acevedo','12345678', 'cuprum', 2, 'llico 918', 'san miguel',30 );
insert into cliente values (2,122523,'vanessa pia', 'amaro troncoso','14565566', 'provida', 1, 'canada 780', 'valparaiso',22 );
insert into cliente values (3,567223,'karina paola', 'moreno cortez','34567832', 'modelo', 2, 'montreal 1418', 'santiago',25 );



insert into admnistrativos values (1,234234,'ricardo fabian', 'cardoso leiva', 'rf@gmail.com', 'RR-HH' );
insert into admnistrativos values (2,645644,'maria eugenia', 'bocaz hidalgo', 'me@gmail.com', 'secretaria' );
insert into admnistrativos values (3,987654,'pedro andres', 'diaz martinez', 'pa@gmail.com', 'gerencia' );

insert into profesionales values (1, 254534, 'rodrigo rafael', 'perez medina', 3453467, 'prevencionista', 'remodelacion');
insert into profesionales values (2, 459459, 'monica andrea', 'cordova espinosa', 968583, 'arquitecto', 'construccion');
insert into profesionales values (3, 887643, 'juan pablo', 'morales jeldes', 9473728, 'abogado', 'defensoria');

insert into capacitacion values (1, TO_DATE('2020/11/18 16:00:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/11/18 16:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'casapiedra',  90, 12345678 );
insert into capacitacion values (2, TO_DATE('2020/10/20 15:00:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/10/20 15:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'aula magna santa maria',  60, 12345678 );
insert into capacitacion values (3, TO_DATE('2020/12/13 12:00:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/12/13 12:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'hotel hyatt',  120, 19905678 );

insert into accidente values (1, TO_DATE('2020/12/19 17:00:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/12/19 17:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'oficina', 'se cayo', 'se murio',3453453 );
insert into accidente values (2, TO_DATE('2020/05/28 16:00:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/05/28 16:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'su casa', 'se quemo', 'quemadura segundo grado',358855 );
insert into accidente values (3, TO_DATE('2020/11/20 18:00:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/11/20 18:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'terreno', 'golpeado por', 'contusion',7654356 );

insert into visita values (1,TO_DATE('2020/12/19 17:00:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/12/19 17:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'oficina','se traslado a servicio de urgencia', 3453453);
insert into visita values (2,TO_DATE('2020/10/09 14:00:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/10/09 14:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'planta','se ofrecieron primeros auxilios', 1643453);
insert into visita values (3,TO_DATE('2020/09/15 07:00:44', 'yyyy/mm/dd hh24:mi:ss'), TO_DATE('2020/09/15 07:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'estacionamiento','lesiones menores', 87943453);

insert into asistentes values (1,'Rosa Mendoza', 35, 'rosa@gmail.com', 978546003, 1); 
insert into asistentes values (2,'Ana Valdivia', 25, 'ana@gmail.com', 902354684, 2);
insert into asistentes values (3,'Pedro Hernandez', 40, 'pherna@gmail.com', 97145285, 3);

insert into chequeos values (1,'VISITA A TERRENO 1'); 
insert into chequeos values (2,'VISITA A TERRENO 2');
insert into chequeos values (3,'VISITA A TERRENO 3');

insert into REGISTROCHEQUEO values (1,'S', 'La proxima visita, la hacemos sin ropa');   
insert into REGISTROCHEQUEO values (2,'N', null);   
insert into REGISTROCHEQUEO values (3,'S', 'Este mes no me preocupe mucho de mi pega');

insert into pagocliente values (1, 1, TO_DATE('2020/09/15 07:00:44', 'yyyy/mm/dd hh24:mi:ss'), 25000, TO_DATE('2020/09/15 07:00:44', 'yyyy/mm/dd hh24:mi:ss'),
TO_DATE('2020/09/15 07:00:44', 'yyyy/mm/dd hh24:mi:ss'));  
insert into pagocliente values (2, 2, TO_DATE('2020/08/01 08:00:44', 'yyyy/mm/dd hh24:mi:ss'), 225000, TO_DATE('2020/08/01 08:00:44', 'yyyy/mm/dd hh24:mi:ss'),
TO_DATE('2020/08/01 08:00:44', 'yyyy/mm/dd hh24:mi:ss')); 
insert into pagocliente values (3, 3, TO_DATE('2020/04/20 09:00:44', 'yyyy/mm/dd hh24:mi:ss'), 42500, TO_DATE('2020/04/20 09:00:44', 'yyyy/mm/dd hh24:mi:ss'),
TO_DATE('2020/04/20 09:00:44', 'yyyy/mm/dd hh24:mi:ss'));  

insert into ASESORIAS values (1, TO_DATE('2020/01/01 08:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'Capacitación uso de extintores', 1);   
insert into ASESORIAS values (2, TO_DATE('2020/02/05 09:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'Capacitación primeros auxilios', 2);
insert into ASESORIAS values (3, TO_DATE('2020/03/09 13:00:44', 'yyyy/mm/dd hh24:mi:ss'), 'Capacitación uso de bloqueador solar', 3);

insert into MEJORAS values (1,'Ubicar extintores', 'Cambiar de altura a extintores', 5);
insert into MEJORAS values (2,'Proveer EPP', 'Reponer EPP con mas frecuencia', 7);
insert into MEJORAS values (3,'Check botiquines', 'Reponer insumos médicos periodicamente', 10);




