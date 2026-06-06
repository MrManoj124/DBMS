CREATE DATABASE SPJ_Database;
USE SPJ_Database;

-- create Suppliers Table
CREATE TABLE Suppliers (
    SID VARCHAR(5) PRIMARY KEY,
    SName VARCHAR(50) NOT NULL,
    Status INT,
    SCity VARCHAR(50)
);