# SqlWorkout: Ejercicios Prácticos con SQL para Analistas e Ingenieros de Datos

¡Bienvenido al repositorio **SqlWorkout**! Este repositorio está diseñado para ayudar a **Analistas de Datos** e **Ingenieros de Datos** a mejorar sus habilidades en SQL mediante ejercicios prácticos basados en la base de datos **AdventureWorks**. Cada ejercicio está dividido en tres niveles: **Básico**, **Intermedio** y **Avanzado**, cubriendo desde conceptos fundamentales hasta técnicas más complejas utilizadas en el análisis de datos y el manejo de grandes volúmenes de información.

## Descripción de los Niveles de Ejercicios

### 1. Nivel Básico

En este cuaderno, aprenderás los fundamentos de SQL, que son esenciales para cualquier Analista de Datos. Los ejercicios de este nivel cubren las operaciones más comunes para consultar y manipular datos.

**Temas cubiertos:**
- `SELECT`: Cómo seleccionar datos de una tabla.
- `WHERE`: Filtrado de datos con condiciones.
- `ORDER BY`: Ordenación de resultados.
- `GROUP BY`: Agrupación y agregación de datos.
- Funciones de agregación (`COUNT`, `SUM`, `AVG`, `MIN`, `MAX`).
- Uso de `JOIN`, `LEFT JOIN`, `RIGHT JOIN` para combinar datos de múltiples tablas.
- Gestión de valores `NULL`.
- `TOP`: Limitar el número de resultados en una consulta.

Estos ejercicios te prepararán para realizar consultas básicas, trabajar con conjuntos de datos simples y obtener información valiosa para análisis iniciales.

### 2. Nivel Intermedio

El segundo cuaderno se enfoca en mejorar tus habilidades de SQL con operaciones más avanzadas, útiles para cálculos y análisis más detallados de los datos.

**Temas cubiertos:**
- Manipulación y cálculo con fechas (`YEAR`, `MONTH`, `DATEDIFF`, `DATEADD`, etc.).
- Funciones condicionales y lógicas.
- Cálculos más avanzados utilizando funciones agregadas y de comparación.
- Uso de `MIN`, `MAX`, `YEAR`, `MONTH` para cálculos con fechas y tendencias.

En este nivel, aprenderás cómo realizar consultas más complejas y obtener información clave de manera más eficiente, lo cual es esencial para análisis de datos más profundos y reportes avanzados.

### 3. Nivel Avanzado

Este cuaderno está diseñado para los profesionales que ya dominan los conceptos intermedios y buscan aprender técnicas avanzadas para realizar consultas complejas y optimizadas en SQL.

**Temas cubiertos:**
- **Window Functions**: Cálculos avanzados como `ROW_NUMBER`, `RANK`, `LEAD`, `LAG` y cómo utilizarlas para análisis más profundos sobre conjuntos de datos.
- **CTE (Common Table Expressions)**: Simplificación de consultas largas y mejoras de rendimiento.
- Uso de **Variables** para manejar datos temporales dentro de una consulta.
- Consultas más avanzadas para reportes y análisis complejos, ideales para trabajar con grandes volúmenes de datos.

Este nivel te ayudará a realizar análisis complejos y a optimizar el rendimiento de tus consultas para escenarios del mundo real.

## Requisitos

Para ejecutar estos ejercicios, necesitarás lo siguiente:
- **Base de datos AdventureWorks**: Puedes descargar la base de datos AdventureWorks desde el [sitio web de Microsoft](https://docs.microsoft.com/es-es/sql/samples/adventureworks-install-configure).
- Un servidor de base de datos SQL Server o una conexión a alguna instancia de **AdventureWorks**.

## Cómo usar los notebooks

1. **Clonar el repositorio**:
   ```bash
   git clone https://github.com/Jeperezp/SqlWorkout.git
   cd SqlWorkout
