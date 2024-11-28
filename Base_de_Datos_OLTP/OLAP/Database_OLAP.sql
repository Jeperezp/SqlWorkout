-- ================================================================
-- Crear la base de datos 'Audiencias' (Audiencias)
-- =================================================================

IF NOT EXISTS (
    SELECT *
    FROM sys.databases
    WHERE name = 'Audiencias'
)
BEGIN
    create database Audiencias;

use Audiencias;
-- =================================================================
-- Crear la tabla de hechos 'FactAudiences' (Audiencias)
-- =================================================================


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
    CONSTRAINT FK_FactAudiences_Process FOREIGN KEY (id_process) REFERENCES process(id_process),
    CONSTRAINT FK_FactAudiences_City FOREIGN KEY (id_city) REFERENCES cities(id_city),
    CONSTRAINT FK_FactAudiences_Department FOREIGN KEY (id_department) REFERENCES departments(id_department),
    CONSTRAINT FK_FactAudiences_Category FOREIGN KEY (id_category) REFERENCES category(id_category),
    CONSTRAINT FK_FactAudiences_User FOREIGN KEY (id_user) REFERENCES users(id_user),
    CONSTRAINT FK_FactAudiences_Status FOREIGN KEY (id_status) REFERENCES status(id_status)
);

CREATE TABLE DimUsuario (
    id_user INT PRIMARY KEY,                       -- Identificador del usuario
    first_name VARCHAR(100),                       -- Nombre del usuario
    last_name VARCHAR(100),                        -- Apellido del usuario
    email VARCHAR(50),                             -- Correo electrónico
    phone_number VARCHAR(50)                       -- Número de teléfono
);

CREATE TABLE DimCiudad (
    id_city INT PRIMARY KEY,                       -- Identificador de la ciudad
    city_name VARCHAR(100),                        -- Nombre de la ciudad
    id_department INT,                             -- Departamento asociado
    department_name VARCHAR(100)                   -- Nombre del departamento (puedes almacenar el nombre aquí)
);

CREATE TABLE DimDepartamento (
    id_department INT PRIMARY KEY,                 -- Identificador del departamento
    department_name VARCHAR(100)                   -- Nombre del departamento
);

CREATE TABLE DimCategoria (
    id_category INT PRIMARY KEY,                   -- Identificador de la categoría
    category_name VARCHAR(100),                     -- Nombre de la categoría
    category_description VARCHAR(100)              -- Descripción de la categoría
);

CREATE TABLE DimEstado (
    id_status INT PRIMARY KEY,                     -- Identificador del estado
    status_name VARCHAR(100),                      -- Nombre del estado
    status_description VARCHAR(100)                -- Descripción del estado
);
