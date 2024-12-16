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

# Migración de Datos de OLTP a OLAP

Este proyecto tiene como objetivo realizar una migración de datos de un sistema OLTP (Online Transaction Processing) a un sistema OLAP (Online Analytical Processing). Utiliza Python para realizar la extracción, transformación y carga (ETL) de los datos, conectándose a bases de datos MySQL y SQL Server. A continuación, se describen los pasos y las funciones principales del proyecto.

## Descripción del Proyecto

El flujo de trabajo de este proyecto incluye:

1. **Extracción de datos (ETL):** Los datos se extraen desde un sistema OLTP (bases de datos MySQL).
2. **Transformación de datos:** Se realizan verificaciones de calidad, como la validación de duplicados, la verificación de valores faltantes y la validación de claves foráneas.
3. **Carga de datos:** Los datos transformados se cargan en una base de datos OLAP (SQL Server) para su análisis posterior.

## Requisitos

El proyecto requiere de las siguientes dependencias:

- Python 3.12.2
- `pandas`
- `sqlalchemy`
- `pymysql`
- `pyodbc`
- `logging`

Estas dependencias se pueden instalar utilizando `pip`:

```bash
pip install pandas sqlalchemy pymysql pyodbc
```

## Archivos y Estructura

El proyecto tiene la siguiente estructura de archivos:

- **config.json:**  
  Archivo de configuración que contiene las credenciales para conectar con las bases de datos MySQL y SQL Server. Es necesario proporcionar la información de acceso a ambas bases de datos (usuario, contraseña, host, puerto, etc.) en este archivo para que el proceso ETL funcione correctamente.

- **Mig_Data_ETL.log:**  
  Archivo de registro donde se almacenan los eventos clave del proceso ETL. Este archivo captura la información sobre la carga de datos, inserciones y cualquier error que ocurra durante el proceso. Es útil para el monitoreo y depuración del proceso de migración.

- **Código Python:**  
  El script principal del proyecto que ejecuta el proceso ETL. El código contiene las funciones necesarias para conectarse a las bases de datos, realizar las transformaciones de datos y cargar los resultados en SQL Server. 

  ## Funciones Principales

El script contiene varias funciones clave que realizan operaciones específicas dentro del proceso ETL. A continuación se describe cada una de ellas:

### `connect_db(query: str) -> pd.DataFrame`
Esta función se conecta a la base de datos MySQL, ejecuta una consulta SQL y devuelve los resultados en un `DataFrame` de pandas.

#### Parámetros:
- `query` (str): La consulta SQL que se ejecutará en la base de datos.

#### Retorno:
- `pd.DataFrame`: El resultado de la consulta en formato de `DataFrame`.

#### Ejemplo de uso:
```python
df = connect_db("SELECT * FROM Cities")
insert_data_to_sql(df: pd.DataFrame, table_name: str, if_exists: str = 'append')
```
Esta función inserta los datos de un `DataFrame` en una tabla de SQL Server.
#### Parámetros:
- `df` (pd.DataFrame): El `DataFrame` con los datos a insertar.
- `table_name` (str): El nombre de la tabla en SQL Server.
- `if_exists` (str): Especifica qué hacer si la tabla ya existe. Puede ser `'replace'`, `'append'` o `'fail'`.

#### Ejemplo de uso
```python
insert_data_to_sql(df, 'DimUsuario')
```
### `duplicates_Pk(df: pd.DataFrame, campo: str) -> pd.DataFrame`

Esta función verifica si existen duplicados en la columna especificada de un `DataFrame`. Si se encuentran duplicados, lanza una excepción.

#### Parámetros:
- `df` (pd.DataFrame): El `DataFrame` en el que se verificarán los duplicados.
- `campo` (str): El nombre de la columna en la que se verificarán los duplicados.
#### Retorno:
`pd.DataFrame`: El `DataFrame` original si no se encuentran duplicados.
#### Ejemplo de uso:
```python
df = duplicates_Pk(df, 'id_city')
```

### `Faltantes(df: pd.DataFrame, campos: list) -> pd.DataFrame`
Esta función verifica si existen valores faltantes `(NaN)` en las columnas especificadas de un `DataFrame`. Si se encuentran valores faltantes, lanza una excepción.

#### Parámetros:
- `df` (pd.DataFrame): El `DataFrame` en el que se verificarán los valores faltantes.
- `campos` (list): Lista de nombres de las columnas a verificar.
#### Retorno:
`pd.DataFrame`: El `DataFrame` original si no se encuentran valores faltantes.
#### Ejemplo de uso:
```python
df = Faltantes(df, ['id_city', 'category_name'])
```
### `relaciones(df1: pd.DataFrame, key: str, df2: pd.DataFrame, foreing_key: str) -> pd.DataFrame`

Esta función verifica que los valores en la columna `foreing_key` del `DataFrame df2` existan en la columna `key` del `DataFrame df1`.

#### Parámetros:
- `df1` (pd.DataFrame): Primer `DataFrame` que contiene la clave primaria.
- `key` (str): Nombre de la columna en `df1` que contiene las claves primarias.
- `df2` (pd.DataFrame): Segundo `DataFrame` que contiene la clave foránea.
- `foreing_key` (str): Nombre de la columna en `df2` que contiene las claves foráneas.
#### Retorno:
`pd.DataFrame`: El `DataFrame df2` si todas las claves foráneas son válidas.
#### Ejemplo de uso:
```python
df = relaciones(DimEstado, 'id_status', DimProcess, 'id_status')
```