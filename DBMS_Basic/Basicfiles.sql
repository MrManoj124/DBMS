#This is only for table and table constraints and queries
CREATE DATABASE VehicleRentalDB;
USE VehicleRentalDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);