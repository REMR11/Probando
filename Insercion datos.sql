
USE FARMACIA

SELECT NAME FROM SYSOBJECTS WHERE TYPE = 'U'

SELECT * FROM USUARIO
SELECT * FROM DETALLE_USUARIO
SELECT * FROM CLIENTES
SELECT * FROM UBICACION
SELECT * FROM OrdenPedido
SELECT * FROM CATEGORIA
SELECT * FROM PRODUCTO
SELECT * FROM EMPLEADO
SELECT * FROM DetalleOrdenPedido
SELECT * FROM BOLETA
SELECT * FROM PRESENTACION
SELECT * FROM PROVEEDOR
SELECT * FROM DETALLE_PRODUCTO

---------------------------INSERCION DE DATOS

--DISTRITO
SELECT 
	ID_DIS, 
	NOM_DIS 
FROM 
	DISTRITO

INSERT INTO DISTRITO( ID_DIS, NOM_DIS )
VALUES	(01,'Santa Ana'),
		(02,'Sonsonate'),
		(03,'Ahuchapan'),
		(04,'Chalatenango'),
		(05,'La Libertad'),
		(06,'San Salvador'),
		(07,'Cuscatlan'),
		(08,'Cabañas'),
		(09,'La Paz'),
		(10,'San Vicente'),
		(11,'Usulutan'),
		(12,'San Miguel'),
		(13,'Morazan'),
		(14,'La Union')

--UBICACION
select 
	ID_DIR,
	ID_DIS,
	LOCALIDAD,
	DIRECCION,
	TELEFONO, 
	CELULAR
from
	UBICACION
			   
INSERT	INTO UBICACION ( ID_DIR, ID_DIS, LOCALIDAD, DIRECCION, TELEFONO, CELULAR)
		VALUES	(1, 6, 'LA PALMA',								'DOMICILIO CONOCIDO',				3244550,  997287262),
				(2, 6, 'EL BONDHO',								'AV. GUADALUPE S/N',				3246343,  997284534),
				(3, 6, 'BOXTHA CHICO',							'AVENIDA NIÑOS HEROES NO. 3',		3244334,  997287234),
				(4, 6, 'CAÑADA GRANDE',							'CARRETERA MEXICO-LAREDO KM.125',	3246343,  997287564),
				(5, 6, 'DEMACU',								'PLAZA CONSTITUCION NO. 1',			3246450,  997654566),
				(6, 6, 'DEXTHO DE VICTORIA',					'DOMICILIO CONOCIDO',				3244551,  997287261),
				(7, 6, 'FRANCISCO VILLA',						'CARRETERA MEXICO-LAREDO',			3246342,  997284532),
				(8, 6, 'SAN MIGUEL ACAMBAY',					'AVENIDA MIGUEL HIDALGO S/N',		3244333,  997287233),
				(9, 7, 'MATEO BENITEZ JUAN',					'CALLE AGUSTIN LARA NO. 69-B',		3246344,  997287564),
				(10, 7, 'JOSEFINA ENRIQUEZ PEÑA',				'AV. INDEPENDENCIA NO. 241',		3246455,  997654565),
				(11, 7, 'AGUSTINA CARRERA NEGRETE',				'AV. INDEPENDENCIA NO. 779',		3244556,  997287266),
				(12, 7, 'VICTORIA EUGENIA CUEVAS JIMENEZ',		'AV. 20 DE NOVIEMBRE NO.1024',		3246415,  997654515),
				(13, 7, 'CAMILO MORA MUÑOZ',					'CARRETERA A LOMA ALTA S/N.',		3246425,  997654525),
				(14, 7, 'QUIMICA A.B.C..S.A DE C.V.',			'AV. 20 DE NOVIEMBRE NO. 1060',		3246435,  997654535),
				(15, 7, 'ISIDRO BRAVO UBIETA',					'CALLE ZARAGOZA NO. 1010',			3246445,  997654545),
				(16, 7, 'IBIS IVONNE JUAREZ GAVITO',			'CALLE MATAMOROS NO. 310',			3246455,  997654555),
				(17, 8, 'HECTOR IGNACIO GOMEZ FUENTES',			'AV. 20 DE NOVIEMBRE NO.859-B',		3246465,  997654565),
				(18, 8, 'VANAGRO S.A. DE C.V.',					'AV. 20 DE NOVIEMBRE NO 1053',		3246475,  997654575),
				(19, 8, 'MATERIALES ACEROS TUCAN.S.A. DE C.V',	'BLVD. BENITO JUAREZ NO. 1466-A',	3246485,  997654585),
				(20, 8, 'PUBLICACIONES NAVA.S.A. DE C.C.',		'CALLE MATAMOROS NO.280',			3246495,  997654595),
				(21, 9, 'SUPER BODEGA DE CORDOBA.S.A DE C.V.',	 'AV. INDEPENDENCIA NO. 545',		3246015,  997654015)


--EMPLEADO
SELECT
	ID_EMP
	NOM_EMP, 
	ID_DIR	
	ID_DIS,		
	CARGO,	
	EDAD,
	INGRESO, 
	CLAVE 
FROM 
	EMPLEADO

INSERT	INTO EMPLEADO( ID_EMP, NOM_EMP, ID_DIR, ID_DIS, CARGO, EDAD, INGRESO, CLAVE )
		VALUES	(01, 'Ronald Eduardo Mejia Reinosa',	4,  5, 'Admin',			76, 01-12-2019, 'Empleado123'),
				(02, 'Fidel Alejandro Contreras Perez', 6,	6, 'Servi',			75, 02-12-2019, 'Empleado234'),
				(03, 'Jose Miguel Melgar Rivera',		8,	4, 'Servi',			74, 03-12-2019, 'Empleado345'),
				(04, 'Caled Ezequiel Avelar Sanchez',	3,	7, 'SuperVisor',	73, 04-12-2019, 'Empleado456'),
				(05, 'Jose Miguel Melgar Rivera',		9,	8, 'Servi',			72, 05-12-2019, 'Empleado346'),
				(06, 'German the Monkey',				5,	3, 'Admin',			71, 06-12-2019, 'Empleado567'),
				(07, 'Anderson Callejas',				7,	1, 'servi',			70, 07-12-2019, 'Empleado678'),
				(08, 'Josue Alejandro Mancia Rodriguez', 16, 9, 'Admin',		69, 08-12-2019, 'Empleado679'),
				(09, 'Empleado Ramdom ',				12, 1, 'SuperVisor',	68, 09-12-2019, 'Empleado671')


--USUARIO
SELECT 
	ID_USU,
	ID_EMP,
	NOM_USU,
	CONTRASEÑA
FROM 
	USUARIO

INSERT	INTO USUARIO(ID_USU, ID_EMP, ID_DU, NOM_USU, CONTRASEÑA )
		VALUES	(1, 1, 1, 'Ricardo Milos',		159357),
				(2,	2, 2, 'Lana RhoADES',		481592),
				(3,	3, 3, 'Jordi Colinas',		683572),
				(4,	4, 4, 'Jonny Coda',			258741),
				(5,	5, 5, 'Nayic Bukele',		963852),
				(6,	6, 6, 'Emma Hernández',		159357),
				(7, 7, 6, 'Usuario Ramdon 1',	123456),
				(8, 8, 8, 'Usuario Ramdon 2',	234567),
				(9, 9, 9, 'Usuario Ramdon 3',	345678)

--DETALLE USUARIO
SELECT
	ID_DU,
	NIVEL_USUARIO,
	ACTIVO
FROM 
	DETALLE_USUARIO

INSERT INTO DETALLE_USUARIO (ID_DU, NIVEL_USUARIO, ACTIVO)
		VALUES	(1, 8, 'si'),
				(2, 6, 'si'),
				(3,	7, 'no'),
				(4, 4, 'si'),
				(5, 3, 'si'),
				(6,	6, 'no'),
				(7, 7, 'si'),
				(8, 5, 'si'),
				(9,	2, 'no'),
				(10, 8, 'si'),
				(11, 6, 'si'),
				(12, 7, 'no')

--CLIENTES
SELECT 
	ID_CLI,
	NOM_CLI,
	ID_DIR,
	SEXO,
	DUI
FROM 
	CLIENTES

INSERT	INTO CLIENTES( ID_CLI, NOM_CLI, ID_DIR, SEXO, DUI )
		VALUES	(01, 'ADRIANA CAROLINA HERNANDEZ MONTERROZA',	2, 'F', 78766543),
				(02, 'ADRIANA MARCELA REY SANCHEZ',				3, 'F', 75432187),
				(03, 'ALEJANDRO ABONDANO ACEVEDO',				5, 'M', 75612378),
				(04, 'ALEXANDER CARVAJAL VARGAS',				6, 'M', 76789123),
				(05, 'ANDREA CATALINA ACERO CARO',				1, 'F', 73213549),
				(06, 'ANDREA LILIANA CRUZ GARCIA',				2, 'F', 73541265),
				(07, 'ANDRES FELIPE VILLA MONROY',				3, 'M', 76549821),
				(08, 'ANGELA PATRICIA MAHECHA PIÑEROS',			4, 'F', 76954132),
				(10, 'ANGELICA MARIA ROCHA GARCIA',				6, 'F', 76542185),
				(11, 'ANGIE TATIANA FERNÁNDEZ MARTÍNEZ',		7, 'F', 76548125),
				(12, 'GABRIEL MAURICIO NIETO BUSTOS',			4, 'M', 75499544)

--OrdenPedido
SELECT 
	NUM_OrdenPedido, 
	FECHA,	
	ID_CLI, 
	ID_EMP, 
	ID_TipoPago, 
	TOTAL 
FROM 
	OrdenPedido
--
INSERT	INTO OrdenPedido(FECHA, ID_CLI, ID_EMP, ID_TipoPago, TOTAL)
		VALUES 	('01-2-2019', 1, 2,'44333475',$75.00),
                ('02-2-2019', 2, 3,'43334634',$80.00),
                ('03-2-2019', 3, 4,'44335457',$60.00),
                ('04-2-2019', 4, 5,'44895645',$25.75),
                ('05-2-2019', 5, 1,'44304674',$345.00)

--Categoria 
select 
	ID_CATE,
	NOM_DES
from 
	Categoria 

insert	into Categoria (ID_CATE, NOM_DES)  
		values (34345,'PARA LOS DOLORES MUSCULARES'),
               (56445,'PARA LOS DOLORES MUELAS'),
               (87653,'PARA LOA GRIPE'),
               (24567,'PARA EL DOLOR DE CUERPO'),
               (99767,'PARA EL RESFRIO'),
               (23423,'PARA LA FIEBRE')

--PROVEEDOR
select
	ID_PROV,
	NOM_PROV,
	ID_DIR,	
	ID_DISTRITO
from 
	PROVEEDOR

INSERT	INTO PROVEEDOR (ID_PROV, NOM_PROV, ID_DIR, ID_DISTRITO)
		values (128, 'DROGUERIA CORPORACION PHARMALIVET ',	14,	1),
               (823, 'DROGUERIA PROMESAS',					15, 2),
               (123, 'DROGUERIA BF INTERNACIONAL',			16, 3),
               (824, 'DROGUERIA JERUSALEM',					17, 4),
               (127, 'DROGUERIA NOVA SALUD',				18, 5)
			   
--Presentacion
select 
	ID_PRE,
	NOM_PRE
from 
	Presentacion

insert into Presentacion values(26,'HARRY VARGAS'),
                               (27,'RUFUEL SOTO'),
                               (28,'ANGEL ANGUILA'),
                               (29,'ROBERT LAS CASAS'),
                               (30,'LUIS')

--DETALLE_USUARIO
SELECT 
	ID_DU,
	NIVEL_USUARIO,
	ACTIVO
FROM 
	DETALLE_USUARIO

INSERT	INTO DETALLE_USUARIO (ID_DU, NIVEL_USUARIO, ACTIVO)
		VALUES	(1, '09', 'SI'),
				(2, '07', 'SI'),
				(3, '09', 'NO'),
				(4, '04', 'SI'),
				(5, '05', 'SI'),
				(6, '08', 'NO'),
				(7, '09', 'SI'),
				(8, '07', 'SI'),
				(9, '09', 'NO'),
				(10, '04', 'SI'),
				(11, '05', 'SI'),
				(12, '08', 'NO')

--Producto
select
	ID_PRO,
	NOM_PRO,
	ID_CATE,
	ID_PROV,
	ID_PRES
from 
	Producto 

INSERT	INTO Producto( ID_PRO, NOM_PRO, ID_DP, ID_CATE, ID_PROV, ID_PRES)  
		values	(90398,	'ASPIRINAS',	1, '34345',  128,  26),
                (90938,	'PANADOL',		2, '56445',  823,  27),
                (90358, 'palagrip',		3, '87653',  123,  28),
                (90390,  'ibuprofeno',	4, '24567',  824,  29),
                (90388,  'FORTE AS',	5,' 99767',  127,  30)
				
--DetalleProducto
SELECT 
	ID_DP,
	PRE_VENTAS,
	PRE_COMPRAS,
	FECHA_VENC,
	STOCK
FROM 
	DETALLE_PRODUCTO

INSERT	INTO DETALLE_PRODUCTO( ID_DP, PRE_VENTAS, PRE_COMPRAS, FECHA_VENC, STOCK)
		VALUES	(1, '0.80', '0.30', '', 20),
				(2, '1.50', '0.60', '', 20),
				(3, '1.00', '0.50', '', 20),
				(4, '2.00', '1.00', '', 20),
				(5, '4.00', '1.00', '', 20)

--DetalleOrdenPedido
select 
	NUM_ORDEP,
	ID_PRO,
	CANTIDAD,
	PRECIO_VENTA,
	IMPORTE
from 
	DetalleOrdenPedido

INSERT	INTO DetalleOrdenPedido (ID_PRO, CANTIDAD, PRECIO_VENTA, IMPORTE)
		VALUES (90398,	'19.3', '2.50', '0.12'),
               (90938,	'19.3', '2.50', '0.14'),
               (90358,	'19.3', '1.50', '0.18'),
               (90390, '15.3', '1.50', '0.12'),
               (90388,	'15.3', '2.50', '0.12')

--Boleta
select 
	NUM_BOLETA,
	FECHA,
	ID_EMPL,
	ID_CLI,
	NUM_OrdenPedido,
	SUBTOTAL,
	DESCUENTO,
	TOTAL
FROM
	Boleta
	
insert	into Boleta(FECHA, ID_EMPL, ID_CLI, NUM_OrdenPedido, SUBTOTAL, DESCUENTO, TOTAL)
		values	(' ',  1,  8,  6, '342',  340,  10.430),
                (' ',  1,  2,  2, '744',  340,  10.560),
                (' ',  1,  1,  3, '345',  300,  10.290),
                (' ',  1,  6,  4, '644',  340,  10.560),
                (' ',  1,  3,  5, '746',  240,  30.200)


--------------------------- CONSULTAS/PRUEBAS

-- CANTIDAD DE UNIDADES POR PROVEEDOR
select ID_PRO, CANTIDAD from DetalleOrdenPedido

-- IDENTIFICACION DE PROVEEDORES CON PRECIOS MAYORES A 2,00
select  ID_PRO from  DetalleOrdenPedido  WHERE PRECIO_VENTA like '2%'

--CANTIDAD DE REGISTROS 
SELECT COUNT(*) FROM USUARIO
