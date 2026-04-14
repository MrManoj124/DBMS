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


--Create Doctors table
create table Doctors(
    doctor_id INT NOT NULL AUTO_INCREMENT,
    department_id INT NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    specialization VARCHAR(100) NOT NULL,
    license_number VARCHAR(30) NOT NULL,
    email VARCHAR(150) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_doctors PRIMARY KEY (doctor_id),
    CONSTRAINT uq_license_number UNIQUE(license_number),
    CONSTRAINT uq_doctor_email UNIQUE(email),
    CONSTRAINT fk_doc_dept FOREIGN KEY(department_id) REFERENCES Departments(department_id)
    ON DELETE RESTRICT,
    ON DELETE CASCADE,
    CONSTRAINT chk_doctor_salary CHECK (salary > 0)
);