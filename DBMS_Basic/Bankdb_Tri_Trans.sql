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