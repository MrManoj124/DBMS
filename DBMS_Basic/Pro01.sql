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


