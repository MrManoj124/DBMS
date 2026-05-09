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
