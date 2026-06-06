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

-- create Shipments table
CREATE TABLE Shipments (
    SID VARCHAR(5),
    PID VARCHAR(5),
    PrID VARCHAR(5),
    Quantity INT,
    PRIMARY KEY (SID, PID, PrID),
    FOREIGN KEY (SID) REFERENCES Suppliers(SID),
    FOREIGN KEY (PID) REFERENCES Parts(PID),
    FOREIGN KEY (PrID) REFERENCES Projects(PrID)
);

INSERT INTO Suppliers VALUES
('S1','Smith',20,'London'),
('S2','Jones',10,'Paris'),
('S3','Black',30,'Paris'),
('S4','Clark',20,'London'),
('S5','Adams',30,'Athens');

INSERT INTO Parts VALUES
('P1','Nut','Red',12,'London'),
('P2','Bolt','Green',17,'Paris'),
('P3','Screw','Blue',17,'Rome'),
('P4','Screw','Red',14,'London'),
('P5','Cam','Blue',12,'Paris'),
('P6','Cog','Red',19,'London');