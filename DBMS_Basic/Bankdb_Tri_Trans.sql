create database Bankdb;

use Bankdb;

create table Customers(
	CustomerID int primary key auto_increment,
    Name varchar(50),
    City Varchar(30)
);

create table Branches(
	BranchID int primary key auto_increment,
    BranchName varchar(50),
    Location varchar(50)
);

create table Accounts(
	AccountID int primary key,
    CustomerID int,
    BranchID int,
    Balance decimal(10, 2),
    
    foreign key(CustomerID) references Customers(CustomerID),
    
    foreign key(BranchID) references Branches(BranchID)
);


INSERT INTO Customers VALUES
(1, 'Alice', 'Colombo'),
(2, 'Bob', 'Kandy'),
(3, 'Charlie', 'Galle'),
(4, 'David', 'Jaffna'),
(5, 'Eva', 'Negombo'),
(6, 'Frank', 'Kurunegala'),
(7, 'Grace', 'Matara'),
(8, 'Hannah', 'Anuradhapura'),
(9, 'Ishan', 'Batticaloa'),
(10, 'Julia', 'Trincomalee'),
(11, 'Kevin', 'Ratnapura'),
(12, 'Lara', 'Badulla');