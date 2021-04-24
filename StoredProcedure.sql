USE FARMACIA

--stored procedure

--============================================================
-- Author:		<Ronald Mejia>
-- Description:	<busqueda de empleado mediante ID, 
--				mostrando a detalle la informacion del empleado>
-- Create date:	<2021-23-04>
--============================================================

--EXEC SP_EMPLEADO 1

ALTER PROCEDURE SP_EMPLEADO 
	@ID INT
AS
BEGIN
	SELECT 
		E.ID_EMP AS ID,
		E.NOM_EMP AS NOMBRE,
		DE.EDAD,
		DE.CARGO,
		U.DIRECCION AS UBICACION,
		U.LOCALIDAD AS LOCALIDAD,
		U.CELULAR AS N_CELULAR,
		U.TELEFONO AS N_TELEFONO,
		DI.NOM_DIS AS DISTRITO,
		DE.INGRESO AS FECHA_INGRESO
	FROM 
		DISTRITO DI INNER JOIN 
			(DetalleEmpledo DE INNER JOIN 
				(UBICACION U INNER JOIN EMPLEADO E 
				ON U.ID_DIR = E.ID_DIR ) 
			ON E.ID_DE = DE.ID_DE) 
		ON DI.ID_DIS = E.ID_DIS
	WHERE 
		E.ID_EMP = @ID
END
GO


--EXEC SP_DISTRITO 
--============================================================
-- Author:		<Ronald Mejia>
-- Description:	<Filtro mediante ID>
-- Create date:	<2021-23-04>
--============================================================
ALTER PROCEDURE SP_DISTRITO 
	@ID INT
AS
BEGIN
SELECT 
	 D.ID_DIS
	,D.NOM_DIS
FROM 
	DISTRITO D
WHERE 
	D.ID_DIS =@ID
END
GO

--EXEC SP_Producto 4
--============================================================
-- Author:		<Ronald Mejia>
-- Description:	<Filtro mediante ID>
-- Create date:	<2021-23-04>
--===========================================================
ALTER PROCEDURE SP_PRODUCTO
	@ID int
as
	SELECT 
		P.ID_PRO AS ID,
		P.NOM_PRO AS NOMBRE,
		C.NOM_DES AS CATEGORIA,
		PO.NOM_PROV AS PROVEEDOR,
		PR.NOM_PRE AS PRESENTACION,
		DP.FECHA_VENC AS " VENCE EN ",
		DP.PRE_COMPRAS AS "PRE COMPRAS",
		DP.PRE_VENTAS AS "PRE VENTAS",
		DP.STOCK,
		DOP.CANTIDAD,
		DOP.IMPORTE,
		DOP.NUM_ORDEP AS "NUMERO DE PEDIDO",
		DOP.PRECIO_VENTA AS "PRECIO DE VENTAS"
	FROM 
		CATEGORIA C INNER JOIN
			(PROVEEDOR PO INNER JOIN 
				(PRESENTACION PR INNER JOIN 
					(DETALLE_PRODUCTO DP INNER JOIN 
						(DetalleOrdenPedido DOP INNER JOIN PRODUCTO P
						ON DOP.ID_PRO = P.ID_PRO)
					ON DP.ID_DP = P.ID_DP)
				ON P.ID_PRES = PR.ID_PRE)
			ON P.ID_PROV = PO.ID_PROV)
		ON C.ID_CATE = P.ID_CATE
	WHERE P.ID_PRO = @ID

--EXEC SP_USUARIO 2
--============================================================
-- Author:		<Ronald Mejia>
-- Description:	<Filtro mediante ID>
-- Create date:	<2021-23-04>
--============================================================
ALTER PROCEDURE SP_USUARIO
	@ID INT 
AS
	SELECT 
		U.ID_USU AS ID,
		U.NOM_USU AS NOMBRE,
		U.CONTRASEÑA,
		DU.ACTIVO,
		DU.NIVEL_USUARIO AS "NIVEL USUARIO",
		E.NOM_EMP AS "ATENDIDO POR "
	FROM 
		EMPLEADO E INNER JOIN
			(DETALLE_USUARIO DU INNER JOIN USUARIO U
			ON DU.ID_DU = U.ID_DU)
		ON E.ID_EMP =  U.ID_EMP
	WHERE U.ID_USU = @ID
GO

SELECT NAME FROM SYSOBJECTS WHERE TYPE = 'U'