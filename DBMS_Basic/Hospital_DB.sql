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



--Create Patients table
create table Patients(
    patient_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender ENUM('M','F','Other') NOT NULL,
    date_of_birth DATE NOT NULL,
    blood_group ENUM('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
    national_id VARCHAR (20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(150) NOT NULL,
    address TEXT,
    emergency_contact_name VARCHAR(100) NOT NULL,
    emergency_contact_phone VARCHAR(20) NOT NULL,
    registered_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    constraint pk_patients PRIMARY KEY (patient_id),
    constraint uq_national_id UNIQUE (nationl_id),
    constraint chk_dob CHECK (date_of_birth < CURDATE())
);


--create Appointments table
create table Appointments(
    appointment_id INT NOT NULL AUTO_INCREMENT,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    reason VARCHAR(255) NOT NULL,
    status ENUM('Scheduled','Completed','Cancelled','No-Show') NOT NULL DEFAULT 'Scheduled',
    notes TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    constraint pk_appointments PRIMARY KEY (appointment_id),
    
)
