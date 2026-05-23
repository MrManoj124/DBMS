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

INSERT INTO Products(ProductID, ProductName, Price) VALUES
(1,'Laptop',150000),
(2,'Mouse',2000),
(3,'Keyboard',5000),
(4,'Monitor',30000),
(5,'Printer',25000),
(6,'Tablet',80000),
(7,'Phone',120000),
(8,'Speaker',7000),
(9,'Camera',90000),
(10,'Router',6000),
(11,'SSD',20000);

INSERT INTO Orders(OrderID, CustomerID, OrderDate) VALUES
(1,1,'2024-01-01'),
(2,2,'2024-01-02'),
(3,3,'2024-01-03'),
(4,4,'2024-01-04'),
(5,5,'2024-01-05'),
(6,6,'2024-01-06'),
(7,7,'2024-01-07'),
(8,8,'2024-01-08'),
(9,9,'2024-01-09'),
(10,10,'2024-01-10'),
(11,1,'2024-01-11');


INSERT INTO OrderDetails(OrderDetailID, OrderID, ProductID, Quantity) VALUES
(1,1,1,1),
(2,1,2,2),
(3,2,3,1),
(4,3,4,1),
(5,4,5,1),
(6,5,6,1),
(7,6,7,1),
(8,7,8,2),
(9,8,9,1),
(10,9,10,3),
(11,10,11,2);

INSERT INTO Payments(PaymentID, OrderID, AmountPaid) VALUES
(1,1,152000),
(2,2,5000),
(3,3,30000),
(4,4,25000),
(5,5,80000),
(6,6,120000),
(7,7,14000),
(8,8,90000),
(9,9,18000),
(10,10,6000),
(11,11,20000);


-- 1.Get Customer details for a given customer ID
DELIMITER //
create procedure GetCustomerDetails(IN custID int)
begin
    select * from Customers where CustomerID = custID;
end // 


-- 2.Get Orders by customer ID
create procedure GetOrdersByCustomerID(IN custID int)
begin 
    select * from Orders where CustomerID = custID;
end //

-- 3.Get Order details by order ID
create procedure GetOrderDetailsByOrderID(IN orderID int)
begin
    select * from OrderDetails where OrderId = orderID;
end //


-- 4. Get total amount paid for a given order ID
create procedure GetTotalAmountPaidByOrderID(IN orderID int)
begin
    select sum(AmountPaid) as TotalAmountPaid from Payments where OrderID = orderID;
end //

-- 5. Get product details for a given productID
create procedure GetProductByID(IN prodID int)
begin
    select * from Products where ProductID = prodID;
end //


-- 6. Get all orders along with customer names
create procedure GetAllOrdersWithCustomerNames()
begin
    select o.OrderID, c.Name as CustomerName, o.OrderDate
    from Orders o
    join Customers c on o.CustomerID = c.CustomerID;
end //

-- 7. Get customer details by city
DELIMITER $$
CREATE PROCEDURE GetCustomersByCity(IN cityName VARCHAR(50))
BEGIN
    SELECT * FROM Customers WHERE City = cityName;
END$$

-- 8. Get products above a given price
DELIMITER $$
CREATE PROCEDURE GetProductsAbovePrice(IN minPrice DECIMAL(10,2))
BEGIN
    SELECT * FROM Products WHERE Price > minPrice;
END$$