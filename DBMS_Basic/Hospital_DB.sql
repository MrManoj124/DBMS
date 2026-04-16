create database if does not exist Hospital_db;

use Hospital_db;

-- Create Departments table
create table Departments(
    department_id INT NOT NULL AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL ,
    dept_code CHAR(5) NOT NULL,
    floor_number TINYINT NOT NULL DEFAULT 1,
    phone_txt VARCHAR(10) NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT pk_departments PRIMARY KEY (department_id),
    CONSTRAINT uq_dept_code UNIQUE (dept_code)
);


-- Create Doctors table
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
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    CONSTRAINT chk_doctor_salary CHECK (salary > 0)
);



-- Create Patients table
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
    constraint uq_national_id UNIQUE (national_id),
    -- constraint chk_dob CHECK (date_of_birth < CURDATE())
);


-- create Appointments table
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
    constraint fk_appoin_id FOREIGN KEY(patient_id) REFERENCES Patients(patient_id) ON DELETE RESTRICT,
    constraint fk_appoin_doctor_id FOREIGN KEY(doctor_id) REFERENCES Doctors(doctor_id) ON DELETE RESTRICT,
    constraint chk_appoin_date CHECK (appointment_date > created_at)
);


-- Insert departments
INSERT INTO Departments (dept_name, dept_code, floor_number, phone_txt) VALUES
('Cardiology',      'CARD',  3, '301'),
('Neurology',       'NEUR',  4, '401'),
('Pediatrics',      'PEDI',  2, '201'),
('Orthopedics',     'ORTH',  5, '501'),
('Emergency',       'EMRG',  1, '101'),
('Radiology',       'RADI',  2, '210'),
('Oncology',        'ONCO',  6, '601');


-- Insert doctors
INSERT INTO Doctors (department_id, first_name, last_name, specialization, license_number, email, phone, salary, hire_date) VALUES
(1, 'Sarah',   'Ahmed',    'Interventional Cardiologist', 'MD-2018-001', 'sarah.ahmed@hospital.lk',   '0771234567', 350000.00, '2018-03-15'),
(1, 'Kamal',   'Perera',   'General Cardiologist',        'MD-2015-002', 'kamal.perera@hospital.lk',  '0772345678', 300000.00, '2015-07-01'),
(2, 'Nirmala', 'Fernando', 'Neurologist',                 'MD-2019-003', 'nirmala.f@hospital.lk',     '0773456789', 320000.00, '2019-01-10'),
(3, 'Roshan',  'Silva',    'Pediatrician',                'MD-2016-004', 'roshan.silva@hospital.lk',  '0774567890', 280000.00, '2016-09-20'),
(5, 'Amali',   'Jayakody', 'Emergency Medicine',          'MD-2020-005', 'amali.j@hospital.lk',       '0775678901', 290000.00, '2020-06-01');


-- Insert patients
INSERT INTO Patients (first_name, last_name, date_of_birth, gender, blood_group, national_id, phone, email) VALUES
('Nuwan',    'Bandara',   '1985-04-12', 'M', 'O+',  '198512400123', '0711234567', 'nuwan.b@email.com'),
('Sanduni',  'Wickrama',  '1992-08-25', 'F', 'A+',  '199223600456', '0712345678', 'sanduni.w@email.com'),
('Lakshan',  'Gamage',    '1978-11-30', 'M', 'B-',  '197832600789', '0713456789', NULL),
('Dilhani',  'Rathnayake','2001-03-17', 'F', 'AB+', '200107800012', '0714567890', 'dilhani.r@email.com'),
('Chamara',  'Samarasinghe','1965-06-05','M','O-',  '196516100345', '0715678901', NULL);


-- Insert appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_dt, reason, status) VALUES
(1, 1, '2025-01-15 09:00:00', 'Chest pain evaluation',     'Completed'),
(2, 3, '2025-01-16 10:30:00', 'Frequent headaches',        'Completed'),
(3, 1, '2025-01-20 14:00:00', 'Follow-up ECG',             'Completed'),
(4, 4, '2025-01-22 11:00:00', 'Routine checkup',           'Completed'),
(5, 1, '2025-02-01 09:30:00', 'Hypertension management',   'Completed'),
(1, 1, '2025-06-10 09:00:00', 'Annual cardiac review',     'Scheduled');


--Simple Select query to retrieve all doctors
SELECT * FROM Doctors;

--Select specific columns with for aliasing
SELECT patient_id CONCAT (first_name, '', last_name) AS full_name, date_of_birth, 
TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) AS age , blood_group FROM Patients;

--WHERE clause with conditions
select first_name, last_name, hire_date from Doctors
WHERE salary > 300000 AND is_available = TRUE;

--order by and limit
SELECT first_name, last_name, hire_date, salary from Doctors
order by salary DESC limit 3;

--Like Pattern matching
SELECT * FROM Patients 
WHERE email LIKE 's%' and last_name LIKE '%a';

--Example 02 of Like pattern matching
select * from Patients 
where phone like '071%' and first_name like '%a%';


--IN operator
select * from Appointments
WHERE Status IN ('Scheduled','Completed') AND appointment_date > 2025-01-01 AND appointment_date < 2025-12-31;

--OR operator
select * from Doctors where specialization = 'Pediatrician' or 'Neurologist';

--AND operator
select * from Patients where blood_group = 'O+' AND gender = 'M';

--Get the Doctor details for  Doctors who are specialized in 'Cardialogy'
select * from Doctors where specialization = 'Cardiology' ;


--group by and having
SELECT department_id, COUNT(*) AS doctor_count, AVG(salary) AS avg_salary
FROM Doctors
GROUP BY department_id
HAVING COUNT(*) > 1;

--example of subquery
SELECT first_name, last_name FROM Doctors
WHERE department_id IN (SELECT department_id FROM Departments WHERE dept_name = 'Cardiology');


--SQL select distinct Statement
select distinct specialization from Doctors;


--SELECT Example Without DISTINCT
SELECT specialization FROM Doctors;

--Aggregate functions with COUNT, AVG
select department_id, COUNT(*) AS doctor_count, AVG(salary) AS avg_salary from Doctors group by department_id;

--Aggregate functions with SUM
select department_id, SUM(salary)  AS total_salary from Doctors group by department_id;

--Get max and minimum salary of doctors
select * from Doctors, MAX(salary) AS max_salary, MIN(salary) AS min_salary from Doctors;


--Get the number of appointments for each doctor
select doctor_id, COUNT(*) AS Appointment_count from Appointments group by doctor_id;

--Get the department name and department code for same doctors
select d.dept_name, d.dept_code from Doctors doctor join Departments d on doctor.department_id = d.department_id;


--Count Distinct Values
select department_id, COUNT(DISTINCT specialization) AS unique_specializations from Doctors group by department_id;



--create a Medicines Table
-- ============================================================
-- TABLE 5: Medicines
-- Teaches: UNIQUE on multiple columns, CHECK on strings & numbers,
--          ENUM for controlled vocabulary
-- ============================================================

CREATE TABLE Medicines (
    medicine_id     INT             NOT NULL AUTO_INCREMENT,
    brand_name      VARCHAR(100)    NOT NULL,
    generic_name    VARCHAR(100)    NOT NULL,
    category        ENUM(
                      'Antibiotic','Analgesic','Antihypertensive',
                      'Antidiabetic','Cardiac','Neurological',
                      'Vitamin','Steroid','Other'
                    )               NOT NULL,
    unit            ENUM('Tablet','Capsule','Syrup','Injection',
                         'Cream','Inhaler','Drops') NOT NULL,
    unit_price      DECIMAL(8,2)    NOT NULL,
    stock_qty       INT             NOT NULL DEFAULT 0,
    reorder_level   INT             NOT NULL DEFAULT 50,
    manufacturer    VARCHAR(150)    NOT NULL,
    requires_prescription BOOLEAN   NOT NULL DEFAULT TRUE,
    is_available    BOOLEAN         NOT NULL DEFAULT TRUE,

    CONSTRAINT pk_medicines     PRIMARY KEY (medicine_id),

    -- The same generic name can exist under multiple brands,
    -- but not the same brand+generic combination twice
    CONSTRAINT uq_med_brand_generic UNIQUE (brand_name, generic_name),

    
);