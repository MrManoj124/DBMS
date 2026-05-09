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

