USE [Hospital]
GO
/****** Object:  Table [hospi].[INGRESOS]    Script Date: 13/05/2020 18:47:00 ******/
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
/****** Object:  Table [hospi].[MEDICOS]    Script Date: 13/05/2020 18:47:00 ******/
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
/****** Object:  Table [hospi].[PACIENTES]    Script Date: 13/05/2020 18:47:00 ******/
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
