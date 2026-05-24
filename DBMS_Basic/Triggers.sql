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

create table Inventory_Log(
	LogID int primary key auto_increment,
    ProductID int,
    OldStock int,
    NewStock int,
    ChangeDate timestamp default current_timestamp,
    
    foreign key(ProductID) references Products(ProductID)
);


INSERT INTO Customers (CustomerName, Phone, City) VALUES
('Manoj', '0771234567', 'Colombo'),
('Kamal', '0719876543', 'Kandy'),
('Nimal', '0754567890', 'Jaffna'),
('Suresh', '0761112233', 'Galle');

INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Chocolate Cake', 'Cake', 2500.00, 20),
('Butter Cake', 'Cake', 1800.00, 15),
('Chicken Bun', 'Snack', 250.00, 50),
('Fish Bun', 'Snack', 220.00, 40),
('Donut', 'Dessert', 150.00, 60),
('Cookies Pack', 'Biscuit', 500.00, 30);

INSERT INTO Order_Items (OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 1, 1, 2500.00),
(1, 5, 2, 300.00),
(2, 3, 5, 1250.00),
(3, 2, 2, 3600.00),
(3, 6, 2, 1000.00);

INSERT INTO Payments (OrderID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2026-05-20', 3000.00, 'Cash'),
(2, '2026-05-21', 1250.00, 'Card'),
(3, '2026-05-22', 5000.00, 'Online');


-- Syntax for triggers
-- create trigger delete_with_trigger
-- before | after
-- insert | update | delete
-- on table
-- for each row
-- begin 
	-- Query
-- end ;


-- Before update trigger
DELIMITER //
create trigger 	prevent_neg_stock
before update 
on Products 
for each row
begin 
	if NEW.StockQuantity < 0 then
		signal sqlstate '14000'
		set message_text = "Quantity cannot be negative";
    end if;
end //
DELIMITER ;

-- Test the updation with trigger
update Products set StockQuantity = -2 where ProductID = 1;

-- update the trigger with price
DELIMITER //
create trigger update_price_trigger
after update 
on Products
for each row
begin
	if NEW.Price < 0 then 
    signal sqlstate '13000'
    set message_text = "Price cannot be negative";
    end if;
end //
DELIMITER ;

-- test the price with update triggers
update Products set Price = -51000.00 where ProductID = 1;