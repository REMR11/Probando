
--ALUMNO:VARGAS PAMPA BLADIMEIR HARRY
--CREACION BD
create database Farmaciaxd 
--BORRAR BD
drop database farmacia
--USO DE LA BD
USE Farmaciaxd
--CREACION DE TABLAS
create table Usuario
(
cod_usu varchar(8)primary key not null,
cod_emp varchar(8)not null,
nivel_usu varchar(2)not null,
nom_usu varchar(30)not null,
password varchar(10) not null,
activo varchar(2) not null
)
GO

CREATE table Clientes
(
cod_cli varchar(8) primary key not null,
nom_cli varchar(40)not null,
dir_cli varchar(40) null,
cod_dis varchar(8)null,
sexo varchar(1)not null,
DNI INT NULL,
RUC int null,
Telefono int null,
Celular int null
)
go

create table OrdenPedido
(
num_ordenPedido varchar(8) primary key not null,
fecha datetime not null,
cod_cli varchar (8) null,
nom_cli varchar(40)null,
cod_emp varchar(8) null, 
cod_tipoPago varchar(8) null, 
total int null 
) 
go 


create table Distrito 
( 
cod_dis varchar(8)primary key not null, 
nom_dis varchar(40) not null 
) 
go 


create table Categoria 
( 
cod_cate varchar(8)primary key not null, 
nom_des varchar(40)not null 
) 
go 


create table Producto 
( 
cod_pro varchar(8)primary key not null, 
nom_pro varchar(40)not null, 
pre_venta decimal(10,2) not null, 
pre_compra decimal(10,2) not null, 
fecha_venc datetime not null, 
stock int not null, 
cod_cate varchar(8)not null, 
cod_prov varchar(8)null, 
cod_pres varchar(8)null 
) 
go 


create table Empleado 
( 
cod_emp varchar(8)primary key not null, 
nom_emp varchar(40)not null, 
dir_emp varchar(40)null, 
cod_dis varchar(8)not null, 
cargo varchar(40) not null, 
edad varchar(2)null, 
tel int not null, 
cel int null, 
ingreso datetime not null,
clave varchar (20) not null, 
) 
go 


create table DetalleOrdenPedido 
( 
num_ordenp varchar(8)primary key not null, 
cod_pro varchar(8) not null, 
nom_pro varchar(40) not null, 
cantidad decimal(10,2)null, 
precio_venta decimal(10,2), 
importe decimal(10,2) 
) 
GO 


create table Boleta 
(
num_boleta varchar(8) primary key not null, 
fecha datetime not null, 
cod_empl varchar(8) not null, 
cod_cli varchar(8)not null, 
num_ordenpedido varchar(8)not null, 
subtotal int not null, 
descuento int null, 
total int not null 
) 
go 


create table Presentacion 
( 
cod_pre varchar(8)primary key not null,
nom_pre varchar(50)null,
) 
go 


create table Proveedor 
( 
cod_prov varchar(8)primary key not null,
nom_prov varchar(40)not null,
dir_prov varchar(50)null,
telefono char(7)null,
celular char(10)null,
id_distrito varchar(8)null 
) 
go 

-- UNION Y RESTRICCIONES CLAVES SECUNDARIAS 

  alter table ordenpedido 
  add constraint pk_cod_cli foreign key(cod_cli) references clientes(cod_cli) 

  alter table clientes 
  add constraint pk_cod_dis_cli foreign key (cod_dis) references distrito(cod_dis) -- no funciona nose por que 
 
  alter table producto 
  add constraint pk_cod_cate foreign key(cod_cate) references categoria(cod_cate)
  
  alter table empleado 
  add constraint pk_cod_dis foreign key (cod_dis) references distrito(cod_dis)
  
  alter table ordenpedido 
  add constraint pk_cod_enpL foreign key (cod_emp) references empleado(cod_emp)
  
  alter table ordenpedido 
  add constraint pk_cod_clis foreign key(cod_cli) references clientes(cod_cli)
  
  alter table detalleordenPedido 
  add constraint pk_cod_pro foreign key (cod_pro) references producto(cod_pro)
  
  alter table boleta 
  add constraint pk_or_pedi foreign key (num_ordenpedido) references ordenpedido(num_ordenpedido)
  
  alter table ordenpedido 
  add constraint pk_cod_empl foreign key (cod_emp) references empleado(cod_emp)
  
  alter table producto 
  add constraint pk_cod_prove foreign key(cod_prov) references proveedor(cod_prov)
  
  alter table producto 
  add constraint pk_cod_presentacion foreign key(cod_pres) references presentacion(cod_pre)
  
  alter table usuario 
  add constraint pk_cod_emple foreign key(cod_emp) references empleado(cod_emp)
  
  alter table proveedor 
  add constraint pk_cod_dis_pro foreign key(id_distrito) references distrito(cod_dis)

  alter table clientes 
  add constraint uni_dni unique(dni)

  alter table clientes 
  add constraint CK_SEXO CHECK(SEXO IN('M','F'))

--RESTRICCIONES VALIDACION DE CAMPOS 
  alter table distrito add constraint uni_distrito unique(nom_dis)  
  alter table clientes add constraint CK_DNI CHECK(LEN(dni)=8)


--INSERTAMOS DATOS SELECT ID FROM Usuario;
select * from Distrito
insert into Distrito values ('001','la tiendona'),
                            ('002','fosalud'),
                            ('003','don bosco'),
                            ('004','san luis'),
                            ('005','lourdes')

select * from Empleado
insert into Empleado values('24360992','Ronald Eduardo','Soyapango','001','ADMIN','18',8346543,997287215,'04/06/21 7:00:00','1234'),
                           ('65646454','Gerardo alexis','la campanera','002','SERVI','17',8346543,137287223,'04/06/21 7:00:00','1234'),
                           ('94364339','Miguel ','surf city','003','SERVI','21',9994576,137987923,'04/06/21 7:00:00','1934'),
                           ('94360139','Caleb Ezequiel','la escalon','004','SUPERVISOR','27',9994556,137987223,'04/06/21 7:00:00','1234'),
                           ('20140152','Fidel Contreras','san salvador	','005','SUPERVISOR','18',8346543,137287431,'04/06/21 7:00:00','1234')
                      
select * from Usuario
insert into Usuario values('12345678','24360992','1','ricardo milos','1234','si' ),
                          ('23456789','65646454','2','lana Rhoades','4343','si' ),
                          ('98765654','94364339','3','jordi','6656','si' ),
                          ('23445348','94360139','4','johnny ','2365','si' ),
                          ('23457878','20140152','5','nayic','6572','si' )
					   delete from Usuario 

 
select * from Clientes
insert into Clientes values ('34984835','CLEMENTE','san miguel','004','M',72884742,1072884742,3288428,997547215),
                            ('45346576','HARRY','lirios del norte','005','M',84884342,1084884342,3266428,997547655),
                            ('45346523','RUFUEL','lourdes','003','M',84884042,1084884042,3266428,997547699),
                            ('45346524','DANTE','lourdes','002','M',84884942,1084884942,3266428,997547688),
                            ('45346525','LUIS','antiguo cuscatlan','001','M',84884765,1084884652,3266428,997547677)

select * from OrdenPedido
insert into OrdenPedido values ('88883425','2016-08-08','34984835','carlos','24360992','44333475',$75.00),
                               ('88883426','2016-08-08','45346576','kevin','65646454','43334634',$80.00),
                               ('88883427','2016-08-08','45346523','bryan','94364339','44335457',$60.00),
                               ('88883428','2016-08-08','45346524','manuel','94360139','44895645',$25.75),
                               ('88883429','2016-08-08','45346525','PILAR ','20140152','44304674',$345.00)

select * from Categoria 
insert into Categoria  values ('34345','PARA LOS DOLORES MUSCULARES'),
                              ('56445','PARA LOS DOLORES MUELAS'),
                              ('87653','PARA LOA GRIPE'),
                              ('24567','PARA EL DOLOR DE CUERPO'),
                              ('99767','PARA EL RESFRIO'),
                              ('23423','PARA LA FIEBRE')

select * from Proveedor
insert into Proveedor values('00128','metro','LOURDES','3244550','997287262','001'),
                            ('00823','las vegas','LOURDES','3246343','997284534','002'),
                            ('00123','okas','LOURDES','3244334','9972872344','003'),
                            ('00824','don bosco','LOURDES','3246343','997287564','004'),
                            ('00127','san luis','LOURDES','3246450','997654566','005') 

select * from Presentacion
insert into Presentacion values('0026','HARRY VARGAS'),
                               ('0027','RUFUEL SOTO'),
                               ('0028','ANGEL ANGUILA'),
                               ('0029','ROBERT LAS CASAS'),
                               ('0030','LUIS ')

select * from Producto 
insert into Producto  values('090398','ASPIRINAS','0.80','0.30','',20,'34345','00128','0026'),
                            ('000938','PANADOL','1.50','0.60','',20,'56445','00823','0027'),
                            ('090358','palagrip','1.00','0.50','',20,'87653','00123','0028'),
                            ('003903','ibuprofeno','2.00','1.00','',20,'24567','00824','0029'),
                            ('003983','FORTE AS','4.00','1.00','',20,'99767','00127','0030')

 
select * from DetalleOrdenPedido
insert into DetalleOrdenPedido values('32','090398','ASPIRINAS','19.3','2.50','0.12'),
                                     ('53','000938','PANADOL','19.3','2.50','0.14'),
                                     ('44','090358','DOLOCONTO','19.3','1.50','0.18'),
                                     ('43','003903','CELESTAL','15.3','1.50','0.12'),
                                     ('55','003983','FORTE AS','15.3','2.50','0.12')

select * from Boleta
insert into Boleta values ('12345678',' ','00123','00819','88883425','342',340,10.430),
                          ('98237844',' ','00123','00829','88883426','744',340,10.560),
                          ('23437844',' ','00123','00814','88883427','345',300,10.290),
                          ('12345676',' ','00123','00267','88883428','644',340,10.560),
                          ('12344632',' ','00123','00534','88883429','746',240,30.200)
  
 

  
--CONSULTAS 
-- seleccionar una tabla mas  los nombres de columnas 
-- NAME COLUMNA + , OTRO NAME COLUMNA + LA TABLA 
select nom_pro, cantidad from DetalleOrdenPedido


-- Buscar en una tabla un nombre que comience son la letra r% para que terminen '%a'
--NOMBRE DE COLUMNA + NOMBRE DE TABLA  + NOMBRE DE COLUMNA + LAS INICIALES ABC
select  nom_pro from  DetalleOrdenPedido  WHERE nom_pro like 'a%'


--- para ver cuantos archivos estan registrados 
SELECT COUNT(*) FROM DetalleOrdenPedido


