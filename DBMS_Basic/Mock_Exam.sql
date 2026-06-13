-- This file shows an exam preparation paper
-- create a database
-- 01. Vehicle Rental System
create database Vehicle_Rental;

-- Use the Created database
use Vehicle_Rental;

-- create table for the database
-- create a Branch table
create table Branch(
    Branch_ID int auto_increment primary key,
    Branch_Name varchar(50) not null,
    City varchar(30) not null
);

-- create a Vehicle table
create table Vehicle(
    Vehicle_ID varchar(50) primary key,
    Vehicle_Name varchar(50) not null,
    Type varchar(30) not null,
    Daily_Rate decimal(10, 2) check(Daily_Rate > 0),
    Branch_ID int ,

    foreign key(Branch_ID) references Branch(Branch_ID)
);

-- create Customer table
create table Customer(
    Customer_ID varchar(30) primary key,
    First_Name varchar(50) not null, 
    Last_Name varchar(50) not null,
    Phone varchar not null,
);

-- create Rental table
create table Rental(
    Rental_ID varchar(50) primary key,
    Customer_ID varchar(50) not null,
    Vehicle_ID varchar(50) not null,
    Rental_Date date,
    Days int check(Days > 0),

    foreign key(Customer_ID) references Customer(Customer_ID),
    foreign key(Vehicle_ID) references Vehicle(Vehicle_ID) 
);


-- B . Practice with Views
-- 