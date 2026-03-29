create database project;
use project;

create table Suppliers(
    SID varchar(20) PRIMARY KEY,
    SName varchar(50) NOT NULL,
    Status INT,
    SCity varchar(50)NOT NULL
);

create table Parts(
    PID varchar(10) PRIMARY KEY,
    PName varchar(30) NOT NULL,
    Colour varchar(20) NOT NULL,
    Weight INT,
    PCity varchar(30), NOT NULL
);

create table Projects(
    PrID varchar(10) PRIMARY KEY,
    PrName varchar(30) NOT NULL,
    PrCity varchar(30) NOT NULL
);

create table Shipments(
    SID varchar(10),
    PID varchar(10),
    PrID varchar(10),
    Quantity INT,
    CONSTRAINT fk_supplier
        FOREIGN KEY(SID) REFERENCES Suppliers(SID)
        ON DELETE CASCADE,

    CONSTRAINT fk_parts
        FOREIGN KEY(PID) REFERENCES Parts(PID)
        ON DELETE CASCADE

    CONSTRAINT fk_projects
        FOREIGN KEY(PrID) REFERENCES Projects(PrID)
        ON DELETE CASCADE
);

INSERT INTO Parts (PID, PName, Colour, Weight, PCity) VALUES
('P1','Nut','Red',12,'London'),
('P2','Bolt','Green',17,'Paris'),
('P3','Screw','Blue',17,'Rome'),
('P4','Screw','Red',14,'London'),
('P5','Cam','Blue',12,'Paris'),
('P6','Cog','Red',19,'London');


INSERT INTO Suppliers (SID, SName, Status, SCity) VALUES
('S1','Smith',20,'London'),
('S2','Jones',10,'Paris'),
('S3','Black',30,'Paris'),
('S4','Clark',20,'London'),
('S5','Adams',30,'Athens');

INSERT INTO Projects (PrID, PrName, PrCity) VALUES
('J1','Sorter','Paris'),
('J2','Punch','Rome'),
('J3','Reader','Athens'),
('J4','Console','Athens'),
('J5','Collator','London'),
('J6','Terminal','Oslo'),
('J7','Tape','London');

INSERT INTO Shipments (SID, PID, PrID, Quantity) VALUES
('S1','P1','J1',200),
('S1','P1','J4',700),
('S2','P2','J1',400),
('S2','P3','J2',200),
('S2','P3','J3',200),
('S2','P3','J4',500),
('S2','P3','J5',600),
('S2','P3','J6',400),
('S2','P3','J7',800),
('S2','P5','J2',100),
('S3','P3','J1',200),
('S3','P4','J2',500),
('S4','P6','J3',300),
('S4','P6','J7',300),
('S5','P2','J2',200),
('S5','P2','J4',100),
('S5','P5','J5',500),
('S5','P5','J7',100),
('S5','P6','J2',200),
('S5','P1','J4',100),
('S5','P3','J4',200),
('S5','P4','J4',800),
('S5','P5','J4',400),
('S5','P6','J4',500);


--Get Full details of all the projects in London
SELECT * FROM Projects WHERE PrCity = 'London';

--Get the range(300-750) of quality of Shipments
SELECT * FROM Shipments WHERE Quantity BETWEEN 300 AND 750;

--Get SID for check Status greater than 20
SELECT SID FROM Suppliers WHERE Status > 20;

--Get SID who supply project J1 in Ascending order
SELECT SID FROM Shipments WHERE PrID = 'J1' ORDER BY SID ASC;

--Get all the suppliers names who supply part P2
SELECT SName FROM Suppliers WHERE SID IN (SELECT SID FROM Shipments WHERE PID = 'P2');

--Get all the suppliers name such that more than one suppliers are living in the same location
SELECT SName FROM Suppliers WHERE SCity IN (SELECT SCity FROM Suppliers GROUP BY SCity HAVING COUNT(*) > 1);

--Get all the supplier names who do not supply part P2
SELECT SName FROM Suppliers WHERE SID NOT IN (SELECT SID FROM Shipments WHERE PID = 'P2');

--Get Get all supplier ID, part ID and project ID triples such that the indicated
--supplier, part and project are not all co-located.
SELECT sh.SID, sh.PID, sh.PrID FROM Shipments sh JOIN Suppliers s ON sh.SID = s.SID
JOIN Parts p ON sh.PID = p.PID
JOIN Projects j ON sh.PrID = j.PrID
WHERE NOT (s.SCity = p.PCity AND p.PCity = j.PrCity);

--Find the total number of projects supplied by supplier S1.
SELECT COUNT(DISTINCT PrID) FROM Shipments WHERE SID = 'S1';

--Find the total quantity of parts supplied by supplier S5.
SELECT SUM (Quantity) FROM Shipments WHERE SID = 'S5';

--Get all the part IDs of parts which has been supplied to some project in an average quantity of more than 320.



