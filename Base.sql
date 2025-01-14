USE [user_management]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 27/5/2024 18:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](60) NOT NULL,
	[Apellidos] [varchar](60) NOT NULL,
	[Identificacion] [varchar](10) NOT NULL,
	[FechaNacimiento] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 27/5/2024 18:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[RolName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol_rolOpciones]    Script Date: 27/5/2024 18:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol_rolOpciones](
	[Rl_idRol] [int] NOT NULL,
	[RolOpciones_idOpcion] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Rl_idRol] ASC,
	[RolOpciones_idOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol_usuarios]    Script Date: 27/5/2024 18:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol_usuarios](
	[Rol_idRol] [int] NOT NULL,
	[usuarios_idUsuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Rol_idRol] ASC,
	[usuarios_idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolOpciones]    Script Date: 27/5/2024 18:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolOpciones](
	[IdOpcion] [int] IDENTITY(1,1) NOT NULL,
	[NombreOpciones] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 27/5/2024 18:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[FechaIngreso] [date] NULL,
	[FechaCierre] [date] NULL,
	[usuarios_idUsuario] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 27/5/2024 18:01:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](255) NULL,
	[Mail] [varchar](255) NULL,
	[SessionActive] [char](1) NOT NULL,
	[Persona_idPersona] [int] NULL,
	[Status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([idPersona], [Nombres], [Apellidos], [Identificacion], [FechaNacimiento]) VALUES (1, N'Juan', N'Pérez', N'1234567890', CAST(N'1989-12-31' AS Date))
INSERT [dbo].[Persona] ([idPersona], [Nombres], [Apellidos], [Identificacion], [FechaNacimiento]) VALUES (2, N'Jennifer', N'Peralta', N'1234567890', CAST(N'1989-12-31' AS Date))
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
ALTER TABLE [dbo].[rol_rolOpciones]  WITH CHECK ADD  CONSTRAINT [FK_RlRol] FOREIGN KEY([Rl_idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[rol_rolOpciones] CHECK CONSTRAINT [FK_RlRol]
GO
ALTER TABLE [dbo].[rol_rolOpciones]  WITH CHECK ADD  CONSTRAINT [FK_RolOpcion] FOREIGN KEY([RolOpciones_idOpcion])
REFERENCES [dbo].[RolOpciones] ([IdOpcion])
GO
ALTER TABLE [dbo].[rol_rolOpciones] CHECK CONSTRAINT [FK_RolOpcion]
GO
ALTER TABLE [dbo].[rol_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Rol] FOREIGN KEY([Rol_idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[rol_usuarios] CHECK CONSTRAINT [FK_Rol]
GO
ALTER TABLE [dbo].[rol_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuario] FOREIGN KEY([usuarios_idUsuario])
REFERENCES [dbo].[usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[rol_usuarios] CHECK CONSTRAINT [FK_Usuario]
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD  CONSTRAINT [FK_SessionUsuario] FOREIGN KEY([usuarios_idUsuario])
REFERENCES [dbo].[usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[Sessions] CHECK CONSTRAINT [FK_SessionUsuario]
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Persona] FOREIGN KEY([Persona_idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[usuarios] CHECK CONSTRAINT [FK_Persona]
GO
