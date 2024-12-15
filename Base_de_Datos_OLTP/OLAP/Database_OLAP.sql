-- Crear la base de datos 'Audiencias'
IF NOT EXISTS (
    SELECT *
    FROM sys.databases
    WHERE name = 'Audiencias'
)
BEGIN
    CREATE DATABASE Audiencias;
END;

USE Audiencias;

-- Crear la tabla de hechos 'FactAudiences'
CREATE TABLE FactAudiences (
    id_audience INT PRIMARY KEY,                    -- Identificador único de la audiencia
    id_process INT,                                 -- Referencia al proceso asociado a la audiencia
    audience_count INT,                             -- Número de audiencias (medida)
    total_duration INT,                             -- Duración total (medida)
    audience_date DATE,                             -- Fecha de la audiencia
    id_city INT,                                    -- Ciudad de la audiencia
    id_department INT,                              -- Departamento de la audiencia
    id_category INT,                                -- Categoría del proceso relacionado
    id_user INT,                                    -- Usuario asociado a la audiencia
    id_status INT,                                  -- Estado de la audiencia
    
    -- Relaciones con las dimensiones (claves foráneas)
    FOREIGN KEY (id_process) REFERENCES DimProcess(id_process),  -- Relación con la dimensión DimProcess
    FOREIGN KEY (id_status) REFERENCES DimEstado(id_status),     -- Relación con la dimensión DimEstado
    FOREIGN KEY (id_department) REFERENCES DimDepartamento(id_department), -- Relación con la dimensión DimDepartamento
    FOREIGN KEY (id_city) REFERENCES DimCiudad(id_city),         -- Relación con la dimensión DimCiudad
    FOREIGN KEY (id_user) REFERENCES DimUsuario(id_user)         -- Relación con la dimensión DimUsuario
);

-- Crear la tabla de dimensión 'DimUsuario'
CREATE TABLE DimUsuario (
    id_user INT IDENTITY(1,1) PRIMARY KEY,         -- Clave primaria autoincremental
    first_name VARCHAR(100),                       
    last_name VARCHAR(100),                        
    email VARCHAR(50),                             
    phone_number VARCHAR(50)                       
);

-- Crear la tabla de dimensión 'DimCiudad'
CREATE TABLE DimCiudad (
    id_city INT PRIMARY KEY,                        -- Identificador de la ciudad
    city_name VARCHAR(100),                         -- Nombre de la ciudad
    id_department INT,                              -- Referencia al departamento
    FOREIGN KEY (id_department) REFERENCES DimDepartamento(id_department)  -- Relación con DimDepartamento
);

-- Crear la tabla de dimensión 'DimDepartamento'
CREATE TABLE DimDepartamento (
    id_department INT PRIMARY KEY,                  -- Identificador del departamento
    department_name VARCHAR(100)                    -- Nombre del departamento
);

-- Crear la tabla de dimensión 'DimCategoria'
CREATE TABLE DimCategoria (
    id_category INT PRIMARY KEY,                    -- Identificador de la categoría
    category_name VARCHAR(100),                      -- Nombre de la categoría
    category_description VARCHAR(100)               -- Descripción de la categoría
);

-- Crear la tabla de dimensión 'DimEstado'
CREATE TABLE DimEstado (
    id_status INT PRIMARY KEY,                      -- Identificador del estado
    status_name VARCHAR(100),                       -- Nombre del estado
    status_description VARCHAR(100)                 -- Descripción del estado
);

-- Crear la tabla de dimensión 'DimProcess' (Procesos)
CREATE TABLE DimProcess (
    id_process INT PRIMARY KEY,                    -- Identificador único del proceso
    internal_id INT,                               -- Número radicado interno
    date_entry DATETIME,                           -- Fecha de entrada del proceso
    id_category INT,                               -- Categoría del proceso (referencia a la tabla DimCategoria)
    category_name VARCHAR(100),                    -- Nombre de la categoría
    id_status INT,                                 -- Estado del proceso (referencia a la tabla DimEstado)
    status_name VARCHAR(100),                      -- Nombre del estado
    FOREIGN KEY (id_category) REFERENCES DimCategoria(id_category),  -- Relación con DimCategoria
    FOREIGN KEY (id_status) REFERENCES DimEstado(id_status)         -- Relación con DimEstado
);


