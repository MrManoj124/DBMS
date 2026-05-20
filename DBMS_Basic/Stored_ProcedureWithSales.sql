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
