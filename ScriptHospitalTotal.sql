USE [Hospital]
GO
/****** Object:  UserDefinedFunction [dbo].[f_contarGenero]    Script Date: 13/05/2020 18:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*8*/
CREATE FUNCTION [dbo].[f_contarGenero] ( @genero varchar )

RETURNS int
AS
BEGIN
         DECLARE @HoM int

         SELECT @HoM = count(sexo)
         FROM [hospi].[PACIENTES]
         WHERE sexo=@genero

        RETURN @HoM
END
GO
/****** Object:  UserDefinedFunction [dbo].[f_contarPacientes]    Script Date: 13/05/2020 18:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[f_contarPacientes] ()

RETURNS int
AS
BEGIN
 
   DECLARE @NIngreso int

         SELECT @NIngreso = count([NHistorial])
         FROM [hospi].[PACIENTES]
       

        RETURN @NIngreso
END
GO
/****** Object:  Table [hospi].[INGRESOS]    Script Date: 13/05/2020 18:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hospi].[INGRESOS](
	[NIngreso] [int] IDENTITY(1,1) NOT NULL,
	[NHistorial] [varchar](9) NULL,
	[FechaIngreso] [date] NULL,
	[CodigoIdentificacion] [varchar](4) NULL,
	[NPlanta] [int] NULL,
	[NCama] [int] NULL,
	[Alergico] [char](2) NULL,
	[Observaciones] [nchar](10) NULL,
	[CosteTratamiento] [money] NULL,
	[Diagnostico] [varchar](50) NULL,
 CONSTRAINT [PK_INGRESOS] PRIMARY KEY CLUSTERED 
(
	[NIngreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hospi].[MEDICOS]    Script Date: 13/05/2020 18:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hospi].[MEDICOS](
	[CodIdentificacion] [varchar](4) NOT NULL,
	[NombreMedico] [varchar](15) NULL,
	[ApellidoMedico] [varchar](50) NULL,
	[Especialidad] [varchar](25) NULL,
	[FechaIngreso] [date] NULL,
	[Cargo] [varchar](25) NULL,
	[NColegiado] [int] NULL,
	[Observaciones] [nchar](10) NULL,
 CONSTRAINT [PK_MEDICOS] PRIMARY KEY CLUSTERED 
(
	[CodIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [hospi].[PACIENTES]    Script Date: 13/05/2020 18:53:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [hospi].[PACIENTES](
	[NSegSocial] [varchar](15) NULL,
	[Nombre] [varchar](15) NULL,
	[Apellidos] [varchar](30) NULL,
	[Domicilio] [varchar](30) NULL,
	[Poblacion] [varchar](25) NULL,
	[Provincia] [varchar](15) NULL,
	[CodPostal] [varchar](5) NULL,
	[Telefono] [varchar](12) NULL,
	[NHistorial] [varchar](9) NOT NULL,
	[Sexo] [varchar](1) NULL,
 CONSTRAINT [PK_Pacientes] PRIMARY KEY CLUSTERED 
(
	[NHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [hospi].[INGRESOS] ON 

INSERT [hospi].[INGRESOS] ([NIngreso], [NHistorial], [FechaIngreso], [CodigoIdentificacion], [NPlanta], [NCama], [Alergico], [Observaciones], [CosteTratamiento], [Diagnostico]) VALUES (1, N'10203-F', CAST(N'2009-01-23' AS Date), N'AJH', 5, 121, N'NO', N'Epileptico', NULL, NULL)
INSERT [hospi].[INGRESOS] ([NIngreso], [NHistorial], [FechaIngreso], [CodigoIdentificacion], [NPlanta], [NCama], [Alergico], [Observaciones], [CosteTratamiento], [Diagnostico]) VALUES (2, N'15413-s', CAST(N'2009-03-13' AS Date), N'RLQ', 2, 5, N'SI', N'ALERGICO  ', NULL, NULL)
INSERT [hospi].[INGRESOS] ([NIngreso], [NHistorial], [FechaIngreso], [CodigoIdentificacion], [NPlanta], [NCama], [Alergico], [Observaciones], [CosteTratamiento], [Diagnostico]) VALUES (3, N'11454-L', CAST(N'2009-05-25' AS Date), N'RLQ', 3, 31, N'NO', NULL, NULL, NULL)
INSERT [hospi].[INGRESOS] ([NIngreso], [NHistorial], [FechaIngreso], [CodigoIdentificacion], [NPlanta], [NCama], [Alergico], [Observaciones], [CosteTratamiento], [Diagnostico]) VALUES (4, N'15413-S', CAST(N'2010-01-29' AS Date), N'CEM', 2, 13, N'NO', NULL, NULL, NULL)
INSERT [hospi].[INGRESOS] ([NIngreso], [NHistorial], [FechaIngreso], [CodigoIdentificacion], [NPlanta], [NCama], [Alergico], [Observaciones], [CosteTratamiento], [Diagnostico]) VALUES (5, N'14546-E', CAST(N'2010-02-24' AS Date), N'AJH', 1, 5, N'SI', N'ALERGICO  ', NULL, NULL)
SET IDENTITY_INSERT [hospi].[INGRESOS] OFF
INSERT [hospi].[MEDICOS] ([CodIdentificacion], [NombreMedico], [ApellidoMedico], [Especialidad], [FechaIngreso], [Cargo], [NColegiado], [Observaciones]) VALUES (N'ajh', N'Antonio', N'Jaen Hernandez', N'Pediatria', CAST(N'1982-08-12' AS Date), N'Adjunto', 2113, N'          ')
INSERT [hospi].[MEDICOS] ([CodIdentificacion], [NombreMedico], [ApellidoMedico], [Especialidad], [FechaIngreso], [Cargo], [NColegiado], [Observaciones]) VALUES (N'CEM', N'Carmem', N'Esterill Manrique', N'Psiquiatria', CAST(N'1992-02-13' AS Date), N'Jefe de Seccion', 1231, NULL)
INSERT [hospi].[MEDICOS] ([CodIdentificacion], [NombreMedico], [ApellidoMedico], [Especialidad], [FechaIngreso], [Cargo], [NColegiado], [Observaciones]) VALUES (N'RLQ', N'Rocia', N'Lopez Quijada', N'Medico de familia', CAST(N'1994-09-23' AS Date), N'Titular', 1331, NULL)
INSERT [hospi].[PACIENTES] ([NSegSocial], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [CodPostal], [Telefono], [NHistorial], [Sexo]) VALUES (N'08/7888888', N'Jose Eduardo', N'Romerales Pinto', N'c/Azorin,34 3o', N'Mostoles', N'Madrid', N'28935', N'91-345-87-45', N'10203-f', N'h')
INSERT [hospi].[PACIENTES] ([NSegSocial], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [CodPostal], [Telefono], [NHistorial], [Sexo]) VALUES (N'08/7234823', N'Angel', N'Ruiz Picasso', N'c/salmeron,212', N'Madrid', N'Madrid', N'28028', N'91-565-34-33', N'11454-l', N'h')
INSERT [hospi].[PACIENTES] ([NSegSocial], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [CodPostal], [Telefono], [NHistorial], [Sexo]) VALUES (N'08/7333333', N'Mercedes', N'Romero Carvajal', N'c/Malaga,13', N'Mostoles', N'Madrid', N'28935', N'91-455-67-45', N'14546-e', N'm')
INSERT [hospi].[PACIENTES] ([NSegSocial], [Nombre], [Apellidos], [Domicilio], [Poblacion], [Provincia], [CodPostal], [Telefono], [NHistorial], [Sexo]) VALUES (N'08/7555555', N'Martin', N'Fernandez Lopez', N'c/Sastres, 21 ', N'Madrid', N'Madrid', N'28028', N'91-333-33-33', N'15413-s', N'H')
ALTER TABLE [hospi].[INGRESOS]  WITH CHECK ADD  CONSTRAINT [FK_INGRESOS_MEDICOS] FOREIGN KEY([CodigoIdentificacion])
REFERENCES [hospi].[MEDICOS] ([CodIdentificacion])
GO
ALTER TABLE [hospi].[INGRESOS] CHECK CONSTRAINT [FK_INGRESOS_MEDICOS]
GO
ALTER TABLE [hospi].[INGRESOS]  WITH CHECK ADD  CONSTRAINT [FK_INGRESOS_Pacientes] FOREIGN KEY([NHistorial])
REFERENCES [hospi].[PACIENTES] ([NHistorial])
GO
ALTER TABLE [hospi].[INGRESOS] CHECK CONSTRAINT [FK_INGRESOS_Pacientes]
GO
ALTER TABLE [hospi].[INGRESOS]  WITH CHECK ADD  CONSTRAINT [alergico si o no] CHECK  (([Alergico]='Si' OR [Alergico]='No'))
GO
ALTER TABLE [hospi].[INGRESOS] CHECK CONSTRAINT [alergico si o no]
GO
ALTER TABLE [hospi].[INGRESOS]  WITH CHECK ADD  CONSTRAINT [CK_INGRESOS_1] CHECK  (([NPlanta]<='10'))
GO
ALTER TABLE [hospi].[INGRESOS] CHECK CONSTRAINT [CK_INGRESOS_1]
GO
ALTER TABLE [hospi].[INGRESOS]  WITH CHECK ADD  CONSTRAINT [CK_INGRESOS_2] CHECK  (([NCama]<='200'))
GO
ALTER TABLE [hospi].[INGRESOS] CHECK CONSTRAINT [CK_INGRESOS_2]
GO
ALTER TABLE [hospi].[PACIENTES]  WITH CHECK ADD  CONSTRAINT [CK_Pacientes] CHECK  (([sexo]='h' OR [sexo]='m'))
GO
ALTER TABLE [hospi].[PACIENTES] CHECK CONSTRAINT [CK_Pacientes]
GO
/****** Object:  StoredProcedure [dbo].[p_MostrarPacientesIngresados]    Script Date: 13/05/2020 18:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*7*/
CREATE PROCEDURE [dbo].[p_MostrarPacientesIngresados]
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
GO
/****** Object:  StoredProcedure [dbo].[pr_MedicosAntiguos]    Script Date: 13/05/2020 18:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_MedicosAntiguos]

@p_CodigoIdentif varchar(4), 
@p_Nombre varchar(15),
@p_Apellido varchar(15),
@p_Especialidad varchar(25),
@p_Cargo varchar(25),
@p_NumeroColegiado int, 
@p_Observaciones varchar(6000),
@p_error int
AS
	BEGIN
		IF @p_NumeroColegiado >1000
		BEGIN
			SET @p_error = 1
		END 
	END
GO
