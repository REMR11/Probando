
DROP DATABASE FARMACIA

---------------------------BORRAR BD

CREATE DATABASE FARMACIA

---------------------------CREACION DE TABLAS

USE FARMACIA
CREATE TABLE USUARIO
(
ID_USU			INT PRIMARY KEY NOT NULL,
NOM_USU			VARCHAR(40) NOT NULL, 
CONTRASE�A		VARCHAR(10) NOT NULL,
ID_EMP			INT NOT NULL,
ID_DU			INT NOT NULL
);

CREATE TABLE DETALLE_USUARIO 
(
ID_DU	INT PRIMARY KEY NOT NULL,
NIVEL_USUARIO	VARCHAR(2) NOT NULL,
ACTIVO			VARCHAR(2) NOT NULL
);

CREATE TABLE CLIENTES
(
ID_CLI			INT PRIMARY KEY NOT NULL,
NOM_CLI			VARCHAR(40) NOT NULL,
ID_DIR			INT NOT NULL,
SEXO			VARCHAR NOT NULL,
DUI				INT NOT NULL
);

CREATE TABLE UBICACION 
(
ID_DIR		INT PRIMARY KEY NOT NULL,
ID_DIS		INT NOT NULL,
LOCALIDAD	VARCHAR( 20 ) NOT NULL,
DIRECCION	VARCHAR( 50 ) NOT NULl,
TELEFONO	INT NOT NULL,
CELULAR		INT NOT NULL
);
ALTER TABLE UBICACION ALTER COLUMN LOCALIDAD VARCHAR ( 50 )

CREATE TABLE OrdenPedido
(
NUM_OrdenPedido		INT PRIMARY KEY IDENTITY(1,1),
FECHA				DATE NOT NULL,
ID_CLI				INT DEFAULT(8) NOT NULL,
ID_EMP				INT DEFAULT(8) NOT NULL,
ID_TipoPago			INT DEFAULT(8) NOT NULL,
TOTAL				INT NOT NULL
);

CREATE TABLE CATEGORIA
(
ID_CATE	INT PRIMARY KEY NOT NULL,
NOM_DES	VARCHAR(40) NOT NULL
);

CREATE TABLE PRODUCTO
(
ID_PRO		INT PRIMARY KEY NOT NULL,
NOM_PRO		VARCHAR(40)NOT NULL,
ID_CATE		INT NOT NULL,
ID_PROV		INT NOT NULL,
ID_PRES		INT NOT NULL,
ID_DP		INT NOT NULL
);

CREATE TABLE DETALLE_PRODUCTO
(
ID_DP		INT PRIMARY KEY NOT NULL,
PRE_VENTAS	DECIMAL(10,2)NOT NULL,
PRE_COMPRAS	DECIMAL(10, 2)NOT NULL,
FECHA_VENC	DATETIME NOT NULL,
STOCK		INT NOT NULL
);

CREATE TABLE EMPLEADO
(
ID_EMP		INT PRIMARY KEY NOT NULL,
NOM_EMP		VARCHAR(40) NOT NULL,
ID_DIR		INT NOT NULL,
ID_DIS		INT NOT NULL,
CLAVE		VARCHAR(20) NOT NULL
ID_DE		INT NOT NULL
);

alter table EMPLEADO
ADD ID_DE INT NOT NULL
select * from  EMPLEADO
CREATE TABLE DetalleEmpledo
(
ID_DE INT PRIMARY KEY NOT NULL,
CARGO		VARCHAR(40) NOT NULL,
EDAD		VARCHAR(2) NOT NULL,
INGRESO		DATETIME NOT NULL,
);

ALTER TABLE EMPLEADO
ADD CONSTRAINT PK_ID_DE
FOREIGN KEY (ID_DE)
REFERENCES DetalleEmpleado(ID_DE)

CREATE TABLE DetalleOrdenPedido
(
NUM_ORDEP		INT PRIMARY KEY IDENTITY(1,1),
ID_PRO			INT NOT NULL,
CANTIDAD		DECIMAL (10, 2) NULL,
PRECIO_VENTA	DECIMAL(10, 2),
IMPORTE			DECIMAL(10, 2)
);

CREATE TABLE BOLETA
(
NUM_BOLETA		INT PRIMARY KEY IDENTITY(1,1),
FECHA			DATE NOT NULL,
ID_EMPL			INT DEFAULT(8) NOT NULL,
ID_CLI			INT DEFAULT(8) NOT NULL,
NUM_OrdenPedido	INT DEFAULT(8) NOT NULL,
SUBTOTAL		INT NOT NULL,
DESCUENTO		INT NULL,
TOTAL			INT NOT NULL
);

CREATE TABLE PRESENTACION 
(
ID_PRE	INT PRIMARY KEY NOT NULL,
NOM_PRE	VARCHAR(50) NOT NULL
);

CREATE TABLE PROVEEDOR
(
ID_PROV		INT PRIMARY KEY NOT NULL,
NOM_PROV	VARCHAR(40) NOT NULL,
ID_DIR		VARCHAR(50) NULL,
ID_DISTRITO INT NOT NULL
);

CREATE TABLE DISTRITO
(
ID_DIS		INT PRIMARY KEY NOT NULL,
NOM_DIS		VARCHAR(40) NOT NULL
);

---------------------------CLAVES FORANEAS 

ALTER TABLE CLIENTES
ADD CONSTRAINT PK_ID_DIR_CLI
FOREIGN KEY ( ID_DIR )
REFERENCES UBICACION( ID_DIR )

ALTER TABLE UBICACION
ADD CONSTRAINT PK_ID_DIS_DIR
FOREIGN KEY (ID_DIS)
REFERENCES DISTRITO(ID_DIS)

ALTER TABLE USUARIO
ADD CONSTRAINT PK_ID_DU
FOREIGN KEY (ID_DU)
REFERENCES DETALLE_USUARIO

ALTER TABLE OrdenPedido 
ADD CONSTRAINT PK_ID_CLI 
FOREIGN KEY( ID_CLI ) 
REFERENCES CLIENTES( ID_CLI )

ALTER TABLE PRODUCTO
ADD CONSTRAINT PK_ID_CATE 
FOREIGN KEY( ID_CATE ) 
REFERENCES CATEGORIA( ID_CATE )

ALTER TABLE PRODUCTO
ADD CONSTRAINT Pk_ID_DP
FOREIGN KEY	( ID_DP)
REFERENCES DETALLE_PRODUCTO (ID_DP)

ALTER TABLE EMPLEADO
ADD CONSTRAINT PK_ID_DIS 
FOREIGN KEY( ID_DIS ) 
REFERENCES DISTRITO( ID_DIS )

ALTER TABLE EMPLEADO
ADD CONSTRAINT PK_ID_DIR_EMP
FOREIGN KEY (ID_DIR)
REFERENCES UBICACION(ID_DIR)

ALTER TABLE OrdenPedido
ADD CONSTRAINT PK_ID_EMP 
FOREIGN KEY( ID_EMP ) 
REFERENCES EMPLEADO( ID_EMP )

ALTER TABLE USUARIO
ADD CONSTRAINT PK_ID_EMPLE 
FOREIGN KEY( ID_EMP ) 
REFERENCES EMPLEADO( ID_EMP )

ALTER TABLE PRODUCTO 
ADD CONSTRAINT PK_ID_PROV 
FOREIGN KEY( ID_PROV ) 
REFERENCES PROVEEDOR( ID_PROV )

ALTER TABLE PROVEEDOR 
ADD CONSTRAINT PK_ID_DIST 
FOREIGN KEY( ID_DISTRITO ) 
REFERENCES DISTRITO( ID_DIS )

ALTER TABLE DetalleOrdenPedido
ADD CONSTRAINT PK_ID_PRO 
FOREIGN KEY( ID_PRO ) 
REFERENCES Producto( ID_PRO )

ALTER TABLE BOLETA
ADD CONSTRAINT PK_ID_BOLE 
FOREIGN KEY( NUM_OrdenPedido ) 
REFERENCES OrdenPedido( NUM_OrdenPedido )

ALTER TABLE DetalleOrdenPedido 
ADD CONSTRAINT PK_ID_PRO_DETA 
FOREIGN KEY( ID_PRO ) 
REFERENCES PRODUCTO( ID_PRO )

ALTER TABLE PRODUCTO
ADD CONSTRAINT PK_ID_PRESENT 
FOREIGN KEY( ID_PRES ) 
REFERENCES PRESENTACION( ID_PRE )

ALTER TABLE CLIENTES
ADD CONSTRAINT UNI_DUI 
UNIQUE( DUI )

ALTER TABLE CLIENTES
ADD CONSTRAINT CK_SEXO 
CHECK( SEXO IN ( 'M','F' ) )

---------------------------RESTRICCIONES, Validacion de campos
ALTER TABLE DISTRITO 
ADD CONSTRAINT UNI_DISTRITO UNIQUE( NOM_DIS )

ALTER TABLE CLIENTES 
ADD CONSTRAINT CK_DUI CHECK( LEN( DUI ) = 8 )