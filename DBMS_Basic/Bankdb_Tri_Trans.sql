create database Bankdb;

use Bankdb;

create table Customers(
	CustomerID int primary key auto_increment,
    Name varchar(50),
    City Varchar(30)
);

create table Branches(
	BranchID int primary key auto_increment,
    BranchName varchar(50),
    Location varchar(50)
);

create table Accounts(
	AccountID int primary key,
    CustomerID int,
    BranchID int,
    Balance decimal(10, 2),
    
    foreign key(CustomerID) references Customers(CustomerID),
    
    foreign key(BranchID) references Branches(BranchID)
);


INSERT INTO Customers VALUES
(1, 'Alice', 'Colombo'),
(2, 'Bob', 'Kandy'),
(3, 'Charlie', 'Galle'),
(4, 'David', 'Jaffna'),
(5, 'Eva', 'Negombo'),
(6, 'Frank', 'Kurunegala'),
(7, 'Grace', 'Matara'),
(8, 'Hannah', 'Anuradhapura'),
(9, 'Ishan', 'Batticaloa'),
(10, 'Julia', 'Trincomalee'),
(11, 'Kevin', 'Ratnapura'),
(12, 'Lara', 'Badulla');

INSERT INTO Branches VALUES
(1, 'Main Branch', 'Colombo'),
(2, 'City Branch', 'Kandy'),
(3, 'Coastal Branch', 'Galle'),
(4, 'North Branch', 'Jaffna'),
(5, 'Airport Branch', 'Negombo'),
(6, 'Central Branch', 'Kurunegala'),
(7, 'South Branch', 'Matara'),
(8, 'Ancient Branch', 'Anuradhapura'),
(9, 'East Branch', 'Batticaloa'),
(10, 'Harbor Branch', 'Trincomalee'),
(11, 'Gem Branch', 'Ratnapura'),
(12, 'Hill Branch', 'Badulla');


INSERT INTO Accounts VALUES
(101, 1, 1, 50000),
(102, 2, 2, 30000),
(103, 3, 3, 45000),
(104, 4, 4, 20000),
(105, 5, 5, 35000),
(106, 6, 6, 60000),
(107, 7, 7, 15000),
(108, 8, 8, 25000),
(109, 9, 9, 40000),
(110, 10, 10, 55000),
(111, 11, 11, 70000),
(112, 12, 12, 80000),
(113, 1, 2, 22000),
(114, 3, 1, 33000),
(115, 5, 3, 27000);


-- create a trigger to prevent a negative balance before inserting a new record into the account relation
DELIMITER //
create trigger trg_negativebalance_before_insert
before insert on Accounts
for each row
begin 
	if Balance < 0 then
		signal sqlstate '45000'
		set message_text = "Balance cannot be negative";
	end if ;
end //
DELIMITER //

-- 2. Set default balance if NULL
CREATE TRIGGER trg_default_balance
BEFORE INSERT ON Accounts
FOR EACH ROW
BEGIN
    IF NEW.Balance IS NULL THEN
        SET NEW.Balance = 0;
    END IF;
END;


-- 3. Ensure CustomerID exists
CREATE TRIGGER trg_check_customer
BEFORE INSERT ON Accounts
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Customers WHERE CustomerID = NEW.CustomerID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Customer does not exist';
    END IF;
END;

-- 4. Ensure BranchID exists
CREATE TRIGGER trg_check_branch
BEFORE INSERT ON Accounts
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Branches WHERE BranchID = NEW.BranchID) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Branch does not exist';
    END IF;
END;


-- 5. Log new account creation
CREATE TABLE Account_Log (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    AccountID INT,
    Action VARCHAR(50),
    LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER trg_log_account_insert
AFTER INSERT ON Accounts
FOR EACH ROW
BEGIN
    INSERT INTO Account_Log(AccountID, Action)
    VALUES (NEW.AccountID, 'Account Created');
END;

-- 6. Log new customer
CREATE TABLE Customer_Log (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    Action VARCHAR(50),
    LogTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);