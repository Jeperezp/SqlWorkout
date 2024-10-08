use Proyectos

Go

INSERT INTO Empleado (nombre, apellido, email, rol, telefono)
VALUES 
('Juan', 'Pérez', 'juan.perez@empresa.com', 'Desarrollador', '555-1234'),
('Ana', 'Gómez', 'ana.gomez@empresa.com', 'Analista', '555-5678'),
('Carlos', 'Martínez', 'carlos.martinez@empresa.com', 'Project Manager', '555-8765'),
('Lucía', 'Rodríguez', 'lucia.rodriguez@empresa.com', 'Desarrollador', '555-4321'),
('Marta', 'Sánchez', 'marta.sanchez@empresa.com', 'Desarrollador', '555-1122'),
('Pedro', 'García', 'pedro.garcia@empresa.com', 'Analista', '555-3344');


INSERT INTO Equipo (nombre_nombre, lider_equipo)
VALUES 
('Equipo Alpha', 3),
('Equipo Beta', 2);

INSERT INTO Proyecto (titulo, descripcion, Fecha_inicio, Fecha_fin, estado, id_equipo)
VALUES 
('Sistema de Gestión de Inventarios', 'Desarrollo de un sistema para gestionar inventarios en tiempo real.', '2024-01-10', '2024-06-15', 'En progreso', 1),
('Aplicación de Control Financiero', 'Desarrollo de una aplicación web para el control de finanzas personales.', '2024-03-01', '2024-09-30', 'En progreso', 2),
('Portal de Atención al Cliente', 'Portal web para gestión de solicitudes y quejas de clientes.', '2023-11-15', '2024-03-01', 'Completado', 1);


INSERT INTO Tarea (titulo_tarea, descripcion, prioridad, fecha_inicio, fecha_fin, estado, id_proyecto, id_empleado_asignado)
VALUES 
('Diseño de Base de Datos', 'Diseñar la estructura de la base de datos para el sistema.', 'Alta', '2024-01-10', '2024-02-01', 'Completada', 1, 1),  -- Juan Pérez
('Desarrollo del Frontend', 'Crear el frontend de la aplicación de inventarios.', 'Media', '2024-02-15', '2024-04-15', 'En progreso', 1, 4),  -- Lucía Rodríguez
('Integración de la API', 'Integrar la API con el sistema de inventarios.', 'Alta', '2024-04-01', '2024-06-01', 'Pendiente', 1, 5),  -- Marta Sánchez
('Análisis de Requisitos', 'Analizar los requisitos del cliente para la aplicación financiera.', 'Alta', '2024-03-01', '2024-03-15', 'Completada', 2, 6),  -- Pedro García
('Desarrollo del Backend', 'Crear la API del control financiero.', 'Media', '2024-03-20', '2024-06-30', 'En progreso', 2, 1),  -- Juan Pérez
('Pruebas Unitarias', 'Realizar pruebas unitarias del sistema.', 'Alta', '2024-05-01', '2024-05-15', 'Pendiente', 2, 2);  -- Ana Gómez


INSERT INTO Comentarios (contenido, fecha_comentario, id_tarea, id_empleado)
VALUES 
('La base de datos ha sido diseñada con éxito.', '2024-02-02 10:30:00', 1, 1),  -- Comentario de Juan Pérez
('El frontend está en desarrollo, ajustando componentes visuales.', '2024-03-10 14:45:00', 2, 4),  -- Comentario de Lucía Rodríguez
('Esperando detalles para la integración de la API.', '2024-04-10 09:15:00', 3, 5),  -- Comentario de Marta Sánchez
('Requisitos analizados y entregados al equipo de desarrollo.', '2024-03-16 11:00:00', 4, 6),  -- Comentario de Pedro García
('El desarrollo de la API está en marcha, creando endpoints.', '2024-04-05 16:00:00', 5, 1),  -- Comentario de Juan Pérez
('Iniciaré las pruebas unitarias la próxima semana.', '2024-05-01 09:00:00', 6, 2);  -- Comentario de Ana Gómez

