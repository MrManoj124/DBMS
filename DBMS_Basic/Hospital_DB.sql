create database if does not exist Hospital_db;

use Hospital_db;

--Create Departments table
create table Departments(
    department_id INT NOT NULL AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL ,
    dept_code CHAR(5) NOT NULL,
    floor_number TINYINT NOT NULL,
    phone_txt VARCHAR,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_departments PRIMARY KEY (department_id),
    CONSTRAINT uq_dept_code UNIQUE (dept_code)
);