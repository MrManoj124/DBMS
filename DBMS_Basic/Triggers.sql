create database Backery;

use Backery;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    City VARCHAR(50)
);


create table Products(
 ProductID INT primary key auto_increment,
 ProductName VARCHAR(100) NOT NULL,
 Category VARCHAR(50),
 Price DECIMAL (10, 2) NOT NULL CHECK (Price > 0),
 StockQuantity int not null check (StockQuantity >= 0)
);
