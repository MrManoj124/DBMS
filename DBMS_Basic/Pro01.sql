create project database;
use project;

create table Suppliers(
    SID varchar(20) PRIMARY KEY,
    SName varchar(50) NOT NULL,
    Status INT,
    SCity varchar(50)NOT NULL);
)

