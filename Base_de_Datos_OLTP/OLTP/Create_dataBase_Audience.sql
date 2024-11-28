-- ====================================================================================
--                          Crear base de datos 'db_audiencias'
-- ====================================================================================
CREATE DATABASE IF NOT EXISTS db_audiencias;

-- Seleccionar la base de datos 'db_audiencias' para usarla
USE db_audiencias;

-- ==========================================
-- Crear tabla 'departments' (Departamentos)
-- ==========================================
CREATE TABLE IF NOT EXISTS departments (
    id_department INT PRIMARY KEY NOT NULL,        -- Identificador único del departamento
    department_name VARCHAR(100) NOT NULL          -- Nombre del departamento
);

-- ==========================================
-- Crear tabla 'cities' (Ciudades)
-- ==========================================
CREATE TABLE IF NOT EXISTS cities (
    id_city INT PRIMARY KEY NOT NULL,             -- Identificador único de la ciudad
    city_name VARCHAR(100) NOT NULL,               -- Nombre de la ciudad
    id_department INT NOT NULL,                    -- Referencia al departamento (clave foránea)
    FOREIGN KEY (id_department) REFERENCES departments(id_department) -- Clave foránea a 'departments'
);


-- ====================================================================================
--                           Crear tabla 'users' (Usuarios)
-- ====================================================================================
CREATE TABLE IF NOT EXISTS users (
    id_user INT PRIMARY KEY NOT NULL,              -- Identificador único del usuario
    Number_document INT NOT NULL,                  -- Número de documento del usuario
    First_Name VARCHAR(100) NOT NULL,              -- Nombre del usuario
    last_Name VARCHAR(100) NOT NULL,               -- Apellido del usuario
    email VARCHAR(50) NOT NULL,                    -- Correo electrónico del usuario
    phone_number VARCHAR(50) DEFAULT NULL          -- Número de teléfono del usuario (opcional)
);
-- ====================================================================================
--                             Crear tabla 'user_status' (Estado de usuarios)
-- ====================================================================================
CREATE TABLE IF NOT EXISTS user_status (
    id_user_status INT PRIMARY KEY NOT NULL,       -- Identificador único del estado
    status_name VARCHAR(50) NOT NULL,              -- Nombre del estado (e.g., "Activo", "Vacaciones", "Inactivo")
    status_description VARCHAR(100) NOT NULL       -- Descripción del estado
);
-- ====================================================================================
--                             Crear tabla 'rol' (Roles)
-- ====================================================================================
CREATE TABLE IF NOT EXISTS rol (
    id_rol INT PRIMARY KEY NOT NULL,               -- Identificador único del rol
    Name VARCHAR(50),                              -- Nombre del rol
    Description VARCHAR(50)                        -- Descripción del rol (opcional)
);

-- ====================================================================================
-- Crear tabla 'user_rol' (Roles de Usuario)
-- ====================================================================================
CREATE TABLE IF NOT EXISTS user_rol (
    id_user_rol INT PRIMARY KEY NOT NULL,          -- Identificador único de la relación
    id_user INT NOT NULL,                          -- Referencia al usuario (clave foránea)
    id_rol INT NOT NULL,                           -- Referencia al rol (clave foránea)
    start_date DATE NOT NULL,                      -- Fecha de inicio del rol
    end_date DATE DEFAULT NULL,                                 -- Fecha de finalización del rol (opcional)
    id_user_status INT NOT NULL,                   -- Estado del usuario (vacaciones, activo, inactivo, etc.)
    FOREIGN KEY (id_user) REFERENCES users(id_user),   -- Clave foránea a 'users'
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol),         -- Clave foránea a 'rol'
    FOREIGN KEY (id_user_status) REFERENCES user_status(id_user_status)  -- Clave foránea a 'user_status'
);
-- ====================================================================================
-- Crear tabla 'category' (Categorías)
-- ====================================================================================
CREATE TABLE IF NOT EXISTS category (
    id_category INT PRIMARY KEY NOT NULL,          -- Identificador único de la categoría
    category_name VARCHAR(100) NOT NULL,           -- Nombre de la categoría
    category_description VARCHAR(100) NOT NULL     -- Descripción de la categoría
);

-- ====================================================================================
-- Crear tabla 'status' (Estados)
-- ====================================================================================
CREATE TABLE IF NOT EXISTS status (
    id_status INT PRIMARY KEY NOT NULL,            -- Identificador único del estado
    status_name VARCHAR(100) NOT NULL,              -- Nombre del estado
    status_description VARCHAR(100) NOT NULL        -- Descripción del estado
);

-- ====================================================================================
-- Crear tabla 'status_stage' (Estados de Etapas)
-- ====================================================================================
CREATE TABLE IF NOT EXISTS status_stage (
    id_status_stage INT PRIMARY KEY NOT NULL,      -- Identificador único del estado de la etapa
    status_stage_name VARCHAR(100) NOT NULL,        -- Nombre del estado de la etapa
    status_stage_description VARCHAR(100) NOT NULL  -- Descripción del estado de la etapa
);

-- ====================================================================================
-- Crear tabla 'process' (Procesos)
-- ====================================================================================
CREATE TABLE IF NOT EXISTS process (
    id_process INT PRIMARY KEY NOT NULL,           -- Identificador único del proceso
    date_entry DATETIME NOT NULL,                   -- Fecha y hora de entrada del proceso
    internal_id INT NOT NULL,						-- Numero radicado interno
    id_user INT,                                   -- Referencia al usuario que inició el proceso (clave foránea)
    id_category INT,                               -- Referencia a la categoría del proceso (clave foránea)
    id_status INT,                                 -- Referencia al estado del proceso (clave foránea)
    id_user_rol INT,                               -- Referencia al rol del usuario en este proceso (clave foránea)
    id_department INT,                        -- Departamento de origen del radicado
	id_city INT,                               -- Ciudad de origen del radicado
	FOREIGN KEY (id_department) REFERENCES departments(id_department), -- Clave foránea a 'departments'
	FOREIGN KEY (id_city) REFERENCES cities(id_city),
    FOREIGN KEY (id_user) REFERENCES users(id_user),               -- Clave foránea a 'users'
    FOREIGN KEY (id_category) REFERENCES category(id_category),   -- Clave foránea a 'category'
    FOREIGN KEY (id_status) REFERENCES status(id_status),         -- Clave foránea a 'status'
    FOREIGN KEY (id_user_rol) REFERENCES user_rol(id_user_rol)    -- Clave foránea a 'user_rol'
);

-- ====================================================================================
-- Crear tabla 'stage' (Etapas)
-- ====================================================================================
CREATE TABLE IF NOT EXISTS stage (
    id_stage INT NOT NULL PRIMARY KEY,             -- Identificador único de la etapa
    stage_name VARCHAR(100) NOT NULL,              -- Nombre de la etapa
    description VARCHAR(100) NOT NULL              -- Descripción de la etapa
);

-- ====================================================================================
-- Crear tabla 'process_stage' (Etapas del Proceso)
-- ====================================================================================
CREATE TABLE IF NOT EXISTS process_stage (
    id_process_stage INT PRIMARY KEY NOT NULL,     -- Identificador único de la relación entre proceso y etapa
    id_process INT,                                -- Referencia al proceso (clave foránea)
    id_stage INT,                                  -- Referencia a la etapa (clave foránea)
    id_status_stage INT,                           -- Referencia al estado de la etapa (clave foránea)
    start_date DATE,								-- Fecha inicio de la Etapa
    end_date DATE,									-- Fecha finalizacion de la Etapa
    FOREIGN KEY (id_process) REFERENCES process(id_process),         -- Clave foránea a 'process'
    FOREIGN KEY (id_stage) REFERENCES stage(id_stage),               -- Clave foránea a 'stage'
    FOREIGN KEY (id_status_stage) REFERENCES status_stage(id_status_stage) -- Clave foránea a 'status_stage'
);

-- ====================================================================================
-- Crear tabla 'audience' (Audiencias)
-- ====================================================================================
CREATE TABLE IF NOT EXISTS audience (
    id_audience INT NOT NULL PRIMARY KEY,          -- Identificador único de la audiencia
    id_process INT,                               -- Referencia al proceso asociado a la audiencia (clave foránea)
    audience_date DATE,                            -- Fecha de la audiencia
    audience_hour TIME,                            -- Hora de la audiencia
    id_status INT,                                 -- Estado de la audiencia (clave foránea)
    FOREIGN KEY (id_process) REFERENCES process(id_process),         -- Clave foránea a 'process'
    FOREIGN KEY (id_status) REFERENCES status(id_status)              -- Clave foránea a 'status'
);
