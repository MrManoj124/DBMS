#This is only for table and table constraints and queries
CREATE DATABASE VehicleRentalDB;
USE VehicleRentalDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY AUTO_INCREMENT,
    Brand VARCHAR(50),
    Model VARCHAR(50),
    Year INT,
    Status VARCHAR(20) DEFAULT 'Available'
);


CREATE TABLE Rentals (
    RentalID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    VehicleID INT,
    RentDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
);


