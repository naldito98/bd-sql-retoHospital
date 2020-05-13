/*1*/
SELECT [Nombre_del_Médico], [Apellidos_del_Médico]
FROM [dbo].[Médicos]
WHERE [Especialidad] like 'Pediatría'

/*2*/
SELECT [Nombre]
FROM [hospi].[PACIENTES]
WHERE [Poblacion]='Madrid'

/*3*/
SELECT [NombreMedico]
FROM [hospi].[MEDICOS] as M
JOIN [hospi].[INGRESOS] as I 
ON M.CodIdentificacion= I.CodigoIdentificacion
WHERE I.FechaIngreso > '01-01-2010' and  I.FechaIngreso > '01-02-2010'

/*4*/
SELECT p.Nombre,p.Apellidos 
FROM [hospi].[PACIENTES] as P
JOIN [hospi].[INGRESOS] as I 
ON P.NHistorial= I.NHistorial
WHERE I.FechaIngreso> '01-01-2009' and  I.FechaIngreso > '01-05-2009' and I.Alergico ='Si'

/*5*/
SELECT P.Nombre 
FROM [hospi].[MEDICOS] as M
JOIN [hospi].[INGRESOS] as I 
ON M.CodIdentificacion= I.CodigoIdentificacion
JOIN [hospi].[PACIENTES] as P   
ON P.NHistorial =I.NHistorial
WHERE NombreMedico ='Antonio' and ApellidoMedico= 'Jaen Hernandez'

/*6*/
CREATE PROCEDURE pr_MedicosAntiguos
@p_CodigoIdentif varchar(4), 
@p_Nombre varchar(15),
@p_Apellido varchar(15),
@p_Especialidad varchar(25),
@p_Cargo varchar(25),
@p_NumeroColegiado int, 
@p_Observaciones varchar(6000),
@error int
AS
	BEGIN
		IF @p_NumeroColegiado >1000
		BEGIN
			SET @error = 1
		END 
	END

/*7*/
CREATE PROCEDURE p_MostrarPacientesIngresados
@p_Fecha1 date,
@p_Fecha2 date
AS

BEGIN

		SELECT P.NSegSocial,P.Nombre,P.Apellidos,P.Domicilio,P.Poblacion,P.Provincia,P.CodPostal,P.Telefono,P.NHistorial,P.Sexo
		FROM [hospi].[PACIENTES] AS P
		JOIN [hospi].[INGRESOS] AS I 
		ON P.NHistorial= I.NHistorial
		WHERE I.FechaIngreso> @p_Fecha1 AND  I.FechaIngreso > @p_Fecha2 
END

        exec p_MostrarPacientesIngresados '1/1/2009',' 1/2/2009'


/*8*/
ALTER FUNCTION f_contarGenero ( @genero varchar )

RETURNS int
AS
BEGIN
         DECLARE @HoM int

         SELECT @HoM = count(sexo)
         FROM [hospi].[PACIENTES]
         WHERE sexo=@genero

        RETURN @HoM
END


SELECT dbo.f_contarGenero ('H')
SELECT dbo.f_contarGenero ('M')


/*9*/
ALTER FUNCTION f_contarPacientes ()

RETURNS int
AS
BEGIN
 
   DECLARE @NIngreso int

         SELECT @NIngreso = count([NHistorial])
         FROM [hospi].[PACIENTES]
       

        RETURN @NIngreso
END



