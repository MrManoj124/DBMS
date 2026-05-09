create database Human_Resource;

use Human_Resource;

CREATE TABLE Location (
    Location_ID INT PRIMARY KEY,
    City VARCHAR(50) NOT NULL DEFAULT 'Vavuniya'
);


CREATE TABLE Job_Details (
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

