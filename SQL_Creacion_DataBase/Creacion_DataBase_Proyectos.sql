IF EXISTS (SELECT NAME
           FROM   sys.databases
           WHERE  NAME = N'Proyectos')
  BEGIN
      PRINT( 'La base de Datos Proyectos ya existe' )
  END
ELSE
  BEGIN
      CREATE DATABASE proyectos

      PRINT( 'La base de Datos se ha Creado Exitosamente' )
  END;

USE proyectos;

IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'Empleado')
  BEGIN
      PRINT( 'La Tabla ya Existe' )
  END
ELSE
  BEGIN
      CREATE TABLE empleado
        (
           id_empleado INT PRIMARY KEY IDENTITY(1, 1),
           nombre      VARCHAR(100) NOT NULL,
           apellido    VARCHAR(100) NOT NULL,
           email       VARCHAR(100) NOT NULL,
           rol         VARCHAR(100) NOT NULL,
           telefono    VARCHAR(100) NOT NULL
        );
  END; 

IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'Equipo')
  BEGIN
      PRINT( 'La Tabla ya Existe' )
  END
ELSE
  BEGIN
      CREATE TABLE Equipo
        (
           id_equipo			INT PRIMARY KEY IDENTITY(1, 1),
           nombre_nombre		VARCHAR(100) NOT NULL,
           Lider_equipo			INT,
           FOREIGN KEY (lider_equipo) REFERENCES Empleado(id_empleado)
        );
  END;

IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'Proyecto')
  BEGIN
      PRINT( 'La Tabla ya Existe' )
  END
ELSE
  BEGIN
      CREATE TABLE Proyecto
        (
           id_proyecto			INT PRIMARY KEY IDENTITY(1, 1),
           titulo				VARCHAR(150) NOT NULL,
           descripcion			TEXT,
		   Fecha_inicio			date,
		   Fecha_fin			date,
		   estado				varchar(100),
		   id_equipo			int,
		   FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo)
        );
  END;

IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'Tarea')
  BEGIN
      PRINT( 'La Tabla ya Existe' )
  END
ELSE
  BEGIN
      CREATE TABLE Tarea
        (
           id_tarea						INT PRIMARY KEY IDENTITY(1, 1),
           titulo_tarea					VARCHAR(150) NOT NULL,
           descripcion					TEXT,
		   prioridad					VARCHAR(50),
		   Fecha_inicio					date,
		   Fecha_fin					date,
		   estado						varchar(100),
		   id_proyecto					int,
		   id_empleado_asignado			int,
		   FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id_proyecto),
		   FOREIGN KEY (id_empleado_asignado) REFERENCES Empleado(id_empleado)

        );
  END;

IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'Comentarios')
  BEGIN
      PRINT( 'La Tabla ya Existe' )
  END
ELSE
  BEGIN
      CREATE TABLE Comentarios
        (
           id_comentario				INT PRIMARY KEY IDENTITY(1, 1),
           contenido					TEXT NOT NULL,
		   Fecha_Comentario				datetime,
		   id_tarea						INT,
		   id_empleado					INT,
		   FOREIGN KEY (id_tarea) REFERENCES Tarea(id_tarea),
		   FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)

        );
  END;