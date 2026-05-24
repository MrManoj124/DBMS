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

create table Orders(
	OrderID int primary key auto_increment,
    CustomerID int,
    OrderDate date,
    TotalAmount decimal(10, 2),
    
    foreign key(CustomerID) references Customers(CustomerID)
);

create table Order_Items(
	OrderItemID int primary key auto_increment,
    OrderID int,
    ProductID int,
    Quantity int check (Quantity >= 0),
    subTotal decimal(10, 2),
    
    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(30),

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID)
);