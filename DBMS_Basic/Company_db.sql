CREATE DATABASE SPJ_Database;
USE SPJ_Database;

-- create Suppliers Table
CREATE TABLE Suppliers (
    SID VARCHAR(5) PRIMARY KEY,
    SName VARCHAR(50) NOT NULL,
    Status INT,
    SCity VARCHAR(50)
);

-- create Parts Table
CREATE TABLE Parts (
    PID VARCHAR(5) PRIMARY KEY,
    PName VARCHAR(50),
    Colour VARCHAR(20),
    Weight INT,
    PCity VARCHAR(50)
);

-- create Projects table
CREATE TABLE Projects (
    PrID VARCHAR(5) PRIMARY KEY,
    PrName VARCHAR(50),
    PrCity VARCHAR(50)
);