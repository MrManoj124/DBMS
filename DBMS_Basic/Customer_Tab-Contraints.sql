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
