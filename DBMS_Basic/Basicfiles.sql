#This is only for table and table constraints and queries
CREATE DATABASE VehicleRentalDB;
USE VehicleRentalDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15)
);

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY AUTO_INCREMENT,
    Brand VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    Status ENUM('Available','Rented','Maintenance') DEFAULT 'Available'
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

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    RentalID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    FOREIGN KEY (RentalID) REFERENCES Rentals(RentalID)
);


///CRUD Operations
///Create(Insert Data)
INSERT INTO Customers(Name, Email, Phone)
VALUES ('Manoj','manoj@gmail.com','072664165');

INSERT INTO Customers(Name, Email, Phone)
VALUES ('Rajeev','rajeev@gmail.com','0714625665');

INSERT INTO Customers(Name, Email, Phone)
VALUES ('Thanu','haran@gmail.com','0744589621');

INSERT INTO Customers(Name, Email, Phone)
VALUES('Kabijake','kabikuddi@gmail.com','0765428452');

INSERT INTO Customers(Name, Email, Phone)
VALUES('Ragul','ragul@gmail.com','0745166532');


INSERT INTO Vehicles(Brand, Model, Year)
VALUES ('BMW','X5','2020');

