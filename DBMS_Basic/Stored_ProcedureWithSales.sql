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

-- Orders table
create table Orders(
    OrderID int primary key,
    CustomerID int,
    OrderDate date,
    foreign key(CustomerID) references Custmomers(CustomerID)
);


-- OrderDetails table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT, 
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Payments table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY, 
    OrderID INT,
    AmountPaid DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert sample data
INSERT INTO Customers(CustomerID, Name, City) VALUES
(1,'Nimal','Colombo'),
(2,'Kamal','Kandy'),
(3,'Sunil','Galle'),
(4,'Amal','Jaffna'),
(5,'Ravi','Colombo'),
(6,'Saman','Kurunegala'),
(7,'Nadee','Matara'),
(8,'Kumari','Kandy'),
(9,'Rohan','Galle'),
(10,'Dilani','Colombo'),
(11,'Ishara','Colombo');