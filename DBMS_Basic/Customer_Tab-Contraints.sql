create database Customer_db;

use Customer_db;

CREATE TABLE CUSTOMERS (
ID INT NOT NULL,
NAME VARCHAR (20) NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR (25),
SALARY DECIMAL (18, 2),
PRIMARY KEY (ID)
);


INSERT INTO CUSTOMERS VALUES
(1, ‘Sunath’, 30, ‘Colombo’, 2000.00 ),
(2, ‘kamal’, 28, ‘Jaffna’, 1500.00 ),
(3, ‘Mala’, 25, ‘Kandy’, NULL ),
(4, ‘Manuja’, 26, ‘Gampaha’, 6500.00 ),
(5, ‘Kathees’, 22, ‘Anuradhapura’, 8500.00 ),
(6, ‘Anushi’, 27, ‘Vavuniya’, NULL ),
(7, ‘Mahi’, 28, ‘Mahi’, 10000.00 );

-- Check NULLIF() function
SELECT ID, NAME, NULLIF(ADDRESS, "Colombo") AS ADDRESS FROM CUSTOMERS;

-- check NULLIF() function with same values
SELECT NAME, ADDRESS, NULLIF(NAME, ADDRESS) AS Result FROM
CUSTOMERS;

-- check NULLIF() function with different values 
SELECT NAME, ADDRESS, nullif(NAME, SALARY) AS Result FROM CUSTOMERS;


-- The IFNULL() Function
SELECT NAME, SALARY, IFNULL(SALARY, 0) AS Salary FROM CUSTOMERS;

-- Example of IFNULL() function with non-null value
SELECT NAME, ADDRESS, IFNULL(ADDRESS, "No Address") AS Address FROM CUSTOMERS;


-- Example of IFNULL() function with null value
SELECT NAME, ADDRESS, IFNULL(ADDRESS, "No Address") AS Address FROM CUSTOMERS WHERE ID = 6;

-- example of IFNULL() function with another non-null value
SELECT NAME, SALARY, IFNULL(SALARY, 0) AS Salary FROM CUSTOMERS WHERE ID = 4;

-- Practice of COALESCE() function
SELECT NAME, ADDRESS, COALESCE(ADDRESS, "No Address") AS Address FROM CUSTOMERS;
-- this will return the first non-null value in the list, which is the ADDRESS column. If ADDRESS is null, it will return "No Address".

-- create a new table with a CHECK constaints
CREATE TABLE CUSTOMERS_2 (
ID INT NOT NULL,
NAME VARCHAR (20) NOT NULL,
AGE INT NOT NULL CHECK(AGE>=20),
ADDRESS CHAR (25),
SALARY DECIMAL (18, 2),
PRIMARY KEY (ID)
);

INSERT INTO CUSTOMERS_2 VALUES
(1, ‘Sunath’, 30, ‘Colombo’, 2000.00 ),
(2, ‘kamal’, 28, ‘Jaffna’, 1500.00 ),
(3, ‘Mala’, 25, ‘Kandy’, NULL ),
(4, ‘Manuja’, 26, ‘Gampaha’, 6500.00 ),
(5, ‘Kathees’, 22, ‘Anuradhapura’, 8500.00 ),
(6, ‘Anushi’, 27, ‘Vavuniya’, NULL ),
(7, ‘Mahi’, 28, ‘Mahi’, 10000.00 );

-- Check the constraints of the table
SELECT table_name, constraint_type, constraint_name FROM
information_schema.table_constraints WHERE
table_name='CUSTOMERS_2';

-- Add a new record that violates the CHECK constraint
INSERT INTO CUSTOMERS_2 (ID,NAME,AGE,ADDRESS,SALARY) VALUES
(8, ‘Mithilan’, 15, ‘Vanni’, 2000.00 );

-- check the records in the table
SELECT * FROM CUSTOMERS_2;

-- check the new constraint with another record
INSERT INTO CUSTOMERS_2 (ID,NAME,AGE,ADDRESS,SALARY) VALUES
(9, ‘Nimal’, 19, ‘Colombo’, 3000.00 );

-- check the new constraints with null value
INSERT INTO CUSTOMERS_2 (ID,NAME,AGE,ADDRESS,SALARY) VALUES
(10, ‘Saman’, NULL, ‘Colombo’, 3000.00 );

-- Check Constraint on Multiple Columns
CREATE TABLE CUSTOMERS_3 (
ID INT NOT NULL,
NAME VARCHAR (20) NOT NULL,
AGE INT NOT NULL CHECK(AGE >= 20),
ADDRESS CHAR (25),
SALARY DECIMAL (18, 2) CHECK(SALARY >= 20000),
PRIMARY KEY (ID)
);

-- Execute the following statement to list down the constraints implemeted on CUSTOMERS_3.
-- check the constraints of the table
select table_name, constraint_type, constraint_name from information_schema.table_constraints where table_name = 'CUSTOMERS_3';

-- check the constraint with a new record
insert into CUSTOMERS_3 (ID, NAME, AGE, ADDRESS, SALARY) VALUES 
(1, 'Sri', 30, 'Vanni', 2000.00);


-- An alternate method to define Check Constraint
CREATE TABLE PRODUCTS(
PID INT NOT NULL,
PNAME VARCHAR(30),
DELIVERY_CITY VARCHAR(20),
DATE_OF_ORDER Date NOT NULL,
PRICE INT,
PRIMARY KEY(PID),
CONSTRAINT Constraint_DOO CHECK(DATE_OF_ORDER <= '2023-
02-09')
);

-- Execute the following statement to list down the constraint implemented on CUSTOMERS_3
select table_name, constraint_type, constraint_name from information_schema.table_constraints where table_name='PRODUCTS';

-- Execute the following MySql statement and observe the result;
insert into products values (001, 'Malith thennakon','Ranchi','2024-01-12',5000);

-- Insert a new record
INSERT INTO PRODUCTS VALUES (002, 'Mathan Ran', 'Ranchi', '2023-
03-11', 2000);

-- Check Constraint on an Existing Column
-- ALTER TABLE table_name
-- ADD constraint constraint_name check (ColumnName condition_value);
 CREATE TABLE CUSTOMERS_4 (
ID INT NOT NULL,
NAME VARCHAR(20) NOT NULL,
AGE INT NOT NULL,
ADDRESS CHAR (25),
SALARY DECIMAL (18, 2),
PRIMARY KEY (ID)
);

-- Execute the following statement to list down the constraints implemented on CUSTOMERS_4.
select table_name, constraint_type, constraint_name, from information_schema.table_constraints where table_name='CUSTOMERS_4';

-- Execute the following MySql Statement
alter table CUSTOMERS_4 ADD CONSTRAINT Constraint_Age check (AGE >= 21);

-- Execute the following statement to list down the constraints implemented on CUSTOMERS_4.
select table_name, constraint_type, constraint_name from information_schema.table_constraints where table_name='CUSTOMERS_4';


-- === Removing check constraint === 
-- Syntax for Removing check constraint
-- ALTER TABLE table_name DROP CONSTRAINT constraint_name;

ALTER TABLE CUSTOMERS_4 DROP CONSTRAINT Constraint_Age;

-- check the constraints implemented on CUSTOMERS_4 
select table_name, constraint_type, constraint_name from information_schema.table_constraints where table_name=CUSTOMERS_4;

