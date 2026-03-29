--This is only for table and table constraints and queries
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
    CustomerID INT NOT NULL,
    VehicleID INT NOT NULL,
    RentDate DATE NOT NULL,
    ReturnDate DATE,

    
    CONSTRAINT FK_customer
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
        ON DELETE CASCADE,

    CONSTRAINT fk_vehicle
        FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID)
        ON DELETE CASCADE
    );

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    RentalID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    CONSTRAINT fk_rental 
    FOREIGN KEY (RentalID) REFERENCES Rentals(RentalID) ON DELETE CASCADE
);



--Create(Insert Data)
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


INSERT INTO Vehicles (Brand, Model, Year, Status) VALUES
('Tata', 'Nexon', 2022, 'Available'),
('Mahindra', 'XUV700', 2023, 'Available'),
('Toyota', 'Corolla', 2021, 'Rented'),
('Honda', 'Civic', 2020, 'Available'),
('Suzuki', 'Swift', 2022, 'Maintenance'),
('Hyundai', 'Elantra', 2021, 'Available'),
('BMW', 'X5', 2023, 'Rented'),
('Audi', 'A4', 2022, 'Available'),
('Nissan', 'Altima', 2020, 'Available'),
('Ford', 'Mustang', 2021, 'Rented');

INSERT INTO Rentals(CustomerID, VehicleID, RentDate, ReturnDate) VALUES
(1, 3, '2026-01-15', '2026-02-02'),
(2, 4, '2026-03-16', NOT NULL),
(3, 6, '2026-03-18', NOT NULL),
(4, 7, '2026-02-14', '2026-02-24');

INSERT INTO Payments (RentID, Amount, PaymentDate) VALUES
(1, 25000.00, '2026-02-02'),
(2, 15000.00, '2026-03-16'),
(3, 20000.00, '2026-03-18'),
(4, 18000.00, '2026-03-14');


--CRUD Operations---
--Create (Insert opration)
INSERT INTO Vehicles(Brand, Model, Year)
VALUES ('Kia', 'Seltos', 2023);

--READ (Select) Operation
SELECT * FROM Vehicles;

--Filter for Vehicle Availability
SELECT * FROM Vehicle WHERE Status = 'Available';


--Get Specific Columns
SELECT Brand, Model FROM Vehicles;


