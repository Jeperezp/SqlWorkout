# 📊 Base de Datos OLAP (Online Analytical Processing) - Audiencias

## Descripción

La base de datos **Audiencias** está diseñada para realizar análisis y consultas complejas sobre datos relacionados con audiencias. Utiliza un modelo de base de datos **OLAP** (Online Analytical Processing) para permitir un análisis eficiente de grandes volúmenes de datos históricos.

El modelo implementado en esta base de datos sigue el **modelo estrella**, donde la tabla de hechos se encuentra en el centro, y las dimensiones relacionadas se encuentran alrededor de la tabla de hechos. Esta estructura optimiza las consultas analíticas y permite la toma de decisiones basada en datos.

---

## 📘 ¿Qué es OLAP?

OLAP (Online Analytical Processing) es una técnica de bases de datos que permite realizar análisis multidimensional de grandes volúmenes de datos. Se utiliza principalmente en aplicaciones de inteligencia empresarial (BI) para generar informes, análisis históricos, y pronósticos.

### Características principales de OLAP:

- **Consultas multidimensionales**: Permiten analizar los datos a través de diferentes dimensiones como tiempo, ubicación, categoría, etc.
- **Alto rendimiento de lectura**: Optimizado para consultas rápidas y agregación de datos.
- **Enfoque en análisis y reportes**: A diferencia de OLTP (Online Transaction Processing), OLAP se centra en análisis, no en la gestión de transacciones.

---

## ⚙️ Estructura de la Base de Datos

La base de datos **Audiencias** está compuesta por una tabla de hechos y varias tablas de dimensiones. A continuación se detalla la estructura de la base de datos.

### 1. **Tabla de Hechos (Fact Table)**

- **FactAudiences**: La tabla de hechos principal que contiene las medidas relacionadas con las audiencias y claves foráneas a las dimensiones.

| **Columna**        | **Descripción**                                   |
|--------------------|---------------------------------------------------|
| `id_audience` (PK) | Identificador único de la audiencia               |
| `id_process` (FK)  | Referencia al proceso asociado a la audiencia     |
| `audience_count`   | Número de audiencias (medida)                     |
| `total_duration`   | Duración total de la audiencia (medida)           |
| `audience_date`    | Fecha de la audiencia                             |
| `id_city` (FK)     | Ciudad asociada con la audiencia                  |
| `id_department` (FK) | Departamento asociado con la audiencia           |
| `id_category` (FK) | Categoría del proceso relacionado con la audiencia |
| `id_user` (FK)     | Usuario asociado con la audiencia                 |
| `id_status` (FK)   | Estado de la audiencia                            |

### 2. **Tablas de Dimensiones (Dimension Tables)**

#### **DimUsuario**
| **Columna**    | **Descripción**                             |
|----------------|---------------------------------------------|
| `id_user` (PK) | Identificador único del usuario             |
| `first_name`   | Nombre del usuario                          |
| `last_name`    | Apellido del usuario                        |
| `email`        | Correo electrónico del usuario              |
| `phone_number` | Número de teléfono del usuario              |

#### **DimCiudad**
| **Columna**     | **Descripción**                             |
|-----------------|---------------------------------------------|
| `id_city` (PK)  | Identificador único de la ciudad            |
| `city_name`     | Nombre de la ciudad                         |
| `id_department` | Identificador del departamento asociado    |
| `department_name` | Nombre del departamento                    |

#### **DimDepartamento**
| **Columna**       | **Descripción**                             |
|-------------------|---------------------------------------------|
| `id_department` (PK) | Identificador único del departamento    |
| `department_name`  | Nombre del departamento                     |

#### **DimCategoria**
| **Columna**         | **Descripción**                             |
|---------------------|---------------------------------------------|
| `id_category` (PK)  | Identificador único de la categoría         |
| `category_name`     | Nombre de la categoría                      |
| `category_description` | Descripción de la categoría               |

#### **DimEstado**
| **Columna**      | **Descripción**                             |
|------------------|---------------------------------------------|
| `id_status` (PK) | Identificador único del estado              |
| `status_name`    | Nombre del estado                           |
| `status_description` | Descripción del estado                    |

---

## 🔗 Relaciones entre Tablas

La tabla **FactAudiences** (tabla de hechos) está relacionada con las siguientes tablas de dimensiones mediante claves foráneas (FK):

- `id_process` → **DimProcess(id_process)**
- `id_city` → **DimCiudad(id_city)**
- `id_department` → **DimDepartamento(id_department)**
- `id_category` → **DimCategoria(id_category)**
- `id_user` → **DimUsuario(id_user)**
- `id_status` → **DimEstado(id_status)**

### **Relaciones de las Tablas de Dimensiones**

- **DimProcess** está relacionado con **DimCategoria** y **DimEstado** mediante claves foráneas.
- **DimCiudad** está relacionada con **DimDepartamento** mediante una clave foránea.
  
---

## 📈 Diagrama Conceptual

El diagrama conceptual de la base de datos OLAP muestra las tablas de hechos y las tablas de dimensiones organizadas en un **modelo estrella**.

- **FactAudiences** se encuentra en el centro del diagrama, y las tablas de dimensiones como **DimUsuario**, **DimCiudad**, **DimDepartamento**, **DimCategoria**, y **DimEstado** están alrededor de ella.
  
![Diagrama de la base de datos OLTP](https://github.com/Jeperezp/SqlWorkout/blob/main/Base_de_Datos_OLTP/OLAP/Diagrama_OLAP.PNG)


## 📝 Consideraciones Finales

Las bases de datos OLAP son una herramienta poderosa para el análisis de grandes volúmenes de datos, proporcionando a las organizaciones una forma eficiente de analizar sus datos históricos y tomar decisiones informadas. Para aprovechar al máximo las bases OLAP, es crucial seguir las mejores prácticas de modelado, optimización y gestión de datos.

---

## 📚 Recursos Adicionales

Si deseas profundizar más sobre las bases de datos OLAP y su implementación, consulta los siguientes recursos:

- [Documentación de OLAP en SQL Server](https://docs.microsoft.com/en-us/sql/analysis-services/)
- [Tutoriales de OLAP en Oracle](https://www.oracle.com/database/technologies/olap.html)
- [Introducción a OLAP en Wikipedia](https://en.wikipedia.org/wiki/Online_analytical_processing)

