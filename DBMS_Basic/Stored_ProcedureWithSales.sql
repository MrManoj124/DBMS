create database Sales_system;

use Sales_system;

-- create Customers Table
create table Customers(
    CustomerID int primary key,
    Name varchar(50),
    City varchar(50)
);

-- Products table
create table Products(
    ProductID int primary key,
    ProductName varchar(50),
    Price decimal(10, 2)    
);