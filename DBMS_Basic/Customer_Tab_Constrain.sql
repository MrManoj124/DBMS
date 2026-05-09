create database Human_Resource;

use Human_Resource;

CREATE TABLE Location (
    Location_ID INT PRIMARY KEY,
    City VARCHAR(50) NOT NULL DEFAULT 'Vavuniya'
);


CREATE TABLE Job_details (
    Job_ID VARCHAR(20) PRIMARY KEY,
    Job_Title VARCHAR(100) NOT NULL,
    Min_Salary DECIMAL(10,2) DEFAULT 5000 CHECK (Min_Salary > 0),
    Max_Salary DECIMAL(10,2) DEFAULT 100000 CHECK (Max_Salary > 0)
);


CREATE TABLE Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL DEFAULT 'HR',
    Manager_ID INT NOT NULL,
    Location_ID INT NOT NULL,
    
    FOREIGN KEY (Location_ID)
    REFERENCES Location(Location_ID)
);


CREATE TABLE Employee (
    Employee_ID INT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Hire_Date DATE,
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    Job_ID VARCHAR(20),
    Department_ID INT,

    FOREIGN KEY (Job_ID)
    REFERENCES Job_Details(Job_ID),

    FOREIGN KEY (Department_ID)
    REFERENCES Department(Department_ID)
);

INSERT INTO Location VALUES(1000, 'Colombo');
INSERT INTO Location VALUES(1100, 'Vavuniya');
INSERT INTO Location VALUES(1200, 'Anuradhapura');
INSERT INTO Location VALUES(1300, 'Kandy');
INSERT INTO Location VALUES(1400, 'Jaffna');


INSERT INTO Job_details VALUES('AD_PRES', 'President', 20000.0, 40000.0);
INSERT INTO Job_details VALUES('AD_VP', 'Administration Vice President', 15000.0, 30000.0);
INSERT INTO Job_details VALUES('AD_ASST', 'Administration Assistant', 3000.0, 6000.0);
INSERT INTO Job_details VALUES('FI_MGR', 'Finance Manager', 8200.0, 16000.0);
INSERT INTO Job_details VALUES('FI_ACCOUNT', 'Accountant', 4200.0, 9000.0);
INSERT INTO Job_details VALUES('AC_MGR', 'Accounting Manager', 8200.0, 16000.0);
INSERT INTO Job_details VALUES('AC_ACCOUNT', 'Public Accountant', 4200.0, 9000.0);
INSERT INTO Job_details VALUES('SA_MAN', 'Sales Manager', 10000.0, 20000.0);
INSERT INTO Job_details VALUES('SA_REP', 'Sales Representative', 6000.0, 12000.0);
INSERT INTO Job_details VALUES('PU_MAN', 'Purchasing Manager', 8000.0, 15000.0);
INSERT INTO Job_details VALUES('PU_CLERK', 'Purchasing Clerk', 2500.0, 5500.0);
INSERT INTO Job_details VALUES('ST_MAN', 'Stock Manager', 5500.0, 8500.0);
INSERT INTO Job_details VALUES('ST_CLERK', 'Stock Clerk', 2000.0, 5000.0);
INSERT INTO Job_details VALUES('SH_CLERK', 'Shipping Clerk', 2500.0, 5500.0);
INSERT INTO Job_details VALUES('IT_PROG', 'Programmer', 4000.0, 10000.0);
INSERT INTO Job_details VALUES('MK_MAN', 'Marketing Manager', 9000.0, 15000.0);
INSERT INTO Job_details VALUES('MK_REP', 'Marketing Representative', 4000.0, 9000.0);
INSERT INTO Job_details VALUES('HR_REP', 'Human Resources Representative', 4000.0, 9000.0);
INSERT INTO Job_details VALUES('PR_REP', 'Public Relations Representative', 4500.0, 10500.0);

INSERT INTO Department VALUES(10, 'Administration', 110, 1000);
INSERT INTO Department VALUES(20, 'Marketing', 108, 1100);
INSERT INTO Department VALUES(30, 'Purchasing', 114, 1100);
INSERT INTO Department VALUES(40, 'Human Resources', 103, 1000);
INSERT INTO Department VALUES(50, 'Shipping', 121, 1000);
INSERT INTO Department VALUES(60, 'IT', 106, 1400);
INSERT INTO Department VALUES(70, 'Public Relations', 125, 1300);
INSERT INTO Department VALUES(80, 'Sales', 115, 1200);
INSERT INTO Department VALUES(90, 'Executive', 100, 1300);
INSERT INTO Department VALUES(100, 'Finance', 117, 1000);
INSERT INTO Department VALUES(110, 'Accounting', 120, 1000);


INSERT INTO Employee VALUES(100, 'Steven', 'Rajan', 'srajan@gmail.com', '2003-06-17',  6000.00, 'AD_ASST', 90);
INSERT INTO Employee VALUES(101, 'Neena', 'Mathan', 'nmathan@gmail.com', 'null',  17000.00,'SA_REP', 80);
INSERT INTO Employee VALUES(102, 'Luxi', 'Kaanthan', 'lkanthan@gmail.com', '2001-01-13', 17000.00,'MK_REP', 20);
INSERT INTO Employee VALUES(103, 'Alex', 'Ronald', 'aronald@gmail.com', '2006-01-03',  9000.00, 'HR_REP', 40);
INSERT INTO Employee VALUES(104, 'Bavan', 'Kathirvel', 'bkathirvel@gmail.com', 'null',  6000.00, 'PR_REP', 70);
INSERT INTO Employee VALUES(105, 'David', 'Austin', 'daustin@gmail.com', '2005-06-25',  4800.00, 'FI_ACCOUNT', 100);
INSERT INTO Employee VALUES(106, 'Valli', 'Bala', 'vbala@gmail.com', '2006-02-05',  4800.00, 'IT_PROG', 60);
INSERT INTO Employee VALUES(107, 'Diana', 'Lawrence', 'dlawrence@gmail.com', 'null',  4200.00, 'AC_ACCOUNT', 110);
INSERT INTO Employee VALUES(108, 'Nancy', 'Desman', 'ndesman@gmail.com', '2002-08-17',  12000.00, 'MK_MAN', 20);
INSERT INTO Employee VALUES(109, 'Daniel', 'Faviet', 'dfaviet@gmail.com', '2002-08-16',  9000.00, 'FI_ACCOUNT', 100);
INSERT INTO Employee VALUES(110, 'John', 'Shekaan', 'jshekaan@gmail.com', '2005-09-28',  30000.00, 'AD_PRES', 10);
INSERT INTO Employee VALUES(111, 'Ismael', 'Mohamed', 'imohamed@gmail.com', '2005-09-30',  6000.00, 'AD_ASST', 90);
INSERT INTO Employee VALUES(112, 'Jose', 'Urman', 'jurman@gmail.com', '2006-03-07',  7800.00, 'HR_REP', 40);
INSERT INTO Employee VALUES(113, 'Kamal', 'Maniyam', 'kmaniyam@gmail.com', '2007-12-07',  6900.00, 'IT_PROG', 60);
INSERT INTO Employee VALUES(114, 'Gihan', 'Perera', 'gperera@gmail.com', '2002-12-07',  11000.00, 'PU_MAN', 30);
INSERT INTO Employee VALUES(115, 'Akilan', 'Thaas', 'athass@gmail.com', '2003-05-18', 15000.00, 'SA_MAN',  80);
INSERT INTO Employee VALUES(116, 'Shelli', 'Baida', 'sbaida@gmail.com', '2005-12-24',  3000.00, 'PU_CLERK', 30);
INSERT INTO Employee VALUES(117, 'Swetha', 'Mohan', 'smohan@gmail.com', '2005-07-24',  9000.00, 'FI_MGR', 100);
INSERT INTO Employee VALUES(118, 'Gowri', 'Balan', 'gbalan@gmail.com', '2006-11-15',  6000.00, 'AD_ASST', 10);
INSERT INTO Employee VALUES(119, 'Karan', 'Kathir', 'kkathir@gmail.com', '2007-08-10',  4000.00, 'MK_REP', 20);
INSERT INTO Employee VALUES(120, 'Bandara', 'Kumara', 'bkumara@gmail.com', '2004-07-18',  10000.00, 'AC_MGR', 110);
INSERT INTO Employee VALUES(121, 'Adam', 'Fripp', 'afripp@gmail.com', '2005-04-10',  5000.00, 'SH_CLERK', 50);
INSERT INTO Employee VALUES(122, 'Pathma', 'Maaran', 'pmaaran@gmail.com', '2003-05-01', 7900.00, 'SA_REP', 80);
INSERT INTO Employee VALUES(123, 'Shanth', 'Velu', 'svelu@gmail.com', '2005-10-10',  6500.00, 'AC_ACCOUNT', 110);
INSERT INTO Employee VALUES(124, 'Kevin', 'Mathu', 'kmathu@gmail.com', '2007-11-16', 5000.00, 'SH_CLERK', 50);
INSERT INTO Employee VALUES(125, 'Julia', 'Nayer', 'jnayar@gmail.com', '2005-07-16', 4500.00, 'PR_REP',  70);


-- i. Replace NULL Hire_Date with 2008-03-17 using IFNULL Display Version
SELECT Employee_ID,
       First_Name,
       IFNULL(Hire_Date, '2008-03-17') AS Hire_Date
FROM Employee;

-- Permanent Update Version
UPDATE Employee
SET Hire_Date = '2008-03-17'
WHERE Hire_Date IS NULL;

-- ii. Check duplicate First_Name and Last_Name
SELECT First_Name,
       Last_Name,
       COUNT(*) AS Total
FROM Employee
GROUP BY First_Name, Last_Name
HAVING COUNT(*) > 1;

-- iii. Check same Min_Salary and Max_Salary
SELECT *
FROM Job_Details
WHERE Min_Salary = Max_Salary;

