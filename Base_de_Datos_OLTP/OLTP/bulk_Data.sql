use db_audiencias;

LOAD DATA LOCAL INFILE 'path\\Deparments.txt'
INTO TABLE departments
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_department, department_name);

LOAD DATA LOCAL INFILE 'path\\Cities.txt'
INTO TABLE cities
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_city, city_name,id_department);

LOAD DATA LOCAL INFILE 'path\\users.txt'
INTO TABLE users
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
(id_user, Number_document,First_Name,Last_Name,email,phone_number);


LOAD DATA LOCAL INFILE 'path\\Roles.txt'
INTO TABLE Rol
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_rol, Name,Description);

LOAD DATA LOCAL INFILE 'path\\Category.txt'
INTO TABLE Category
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_category, Category_Name,category_description);

LOAD DATA LOCAL INFILE 'path\\stages.txt'
INTO TABLE stage
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_stage,stage_name,Description);

LOAD DATA LOCAL INFILE 'path\\status.txt'
INTO TABLE status
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_status,status_name,status_Description);

LOAD DATA LOCAL INFILE 'path\\user_status.txt'
INTO TABLE user_status
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_user_status,status_name,status_description);

LOAD DATA LOCAL INFILE 'path\\user_rol.txt'
INTO TABLE user_rol
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_user_rol,id_user,id_rol,start_date,end_date,id_user_status);

LOAD DATA LOCAL INFILE 'path\\status_stages.txt'
INTO TABLE status_stage
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_status_stage,status_stage_name,status_stage_description);

LOAD DATA LOCAL INFILE 'path\\process.txt'
INTO TABLE process
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_process, date_entry, internal_id, id_user, id_category, id_status, id_user_rol, id_department, id_city);

LOAD DATA LOCAL INFILE 'path\\process_stage.txt'
INTO TABLE process_stage
FIELDS TERMINATED BY '|'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id_process_stage, id_process, id_stage, id_status_stage, start_date, end_date);
