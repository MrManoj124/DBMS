-- Continue the procedure with Customers_db; 

-- Syntax
DELIMITER $$
CREATE PROCEDURE procedure_name (parameter_1, datatype_1, parameter_2, datatype_2, ...)
BEGIN
-- SQL statements to be executed
END $$
DELIMITER;

To Execute the procedure;
CALL <Procedure name>;


-- Example 01 :
DELIMITER $$
CREATE PROCEDURE show_message()
BEGIN 
    SELECT 'Welcome to MySql Stored Procedures';
END $$
DELIMITER;

CALL show_message();


-- Example 02 :
Write a procedure to retrieve all the details of customers with the given age.
DELIMITER //
CREATE PROCEDURE GetCustomerInfo(IN CustomerAge INT)
BEGIN 
    SELECT * FROM CUSTOMERS WHERE AGE = CusomerAge;
END //

DELIMITER;


-- Execute the procedure by passing different values for the parameter.
CALL GetCustomerInfo(25);
CALL GetCustomerInfo(35);
CALL GetCustomerInfo(40);
CALL GetCustomerInfo(10);


-- Get Customers name and age by Id
DELIMITER $$
create procedure GetNameandAge(IN CustId INT)
begin 
    select name, age from Customers where Customer_Id = CustId;
END $$;
DELIMITER ;  


-- Get Age Salary by name
DELIMITER $$
create procedure GetSalaryandAgeByID(IN Custname VARCHAR(50))
begin 
    select age, salary from Customers where name = Custname;
end $$
DELIMITER ;


-- Get Customer age range
DELIMITER $$
create procedure GetCustomerAgeRange(IN minAge INT, IN maxAge INT)
begin 
    select * from Customers where age between minAge and maxAge;
end $$
DELIMITER ;


-- Get Minimum Salary
DELIMITER $$
create procedure GetMinSalary()
    select MIN(Salary) AS Min_Salary from Customers;
end $$
DELIMITER ;


-- Get Maximum Salary
DELIMITER $$
create procedure GetMaxSalary()
    select MAX(Salary) AS Max_Salary from Customers;
end $$
DELIMITER ;


-- Get total Salary of All customers
DELIMITER $$
create procedure GetTotalSalary()
begin 
    select SUM(Salary) AS Total_Salary from Customers;
end $$
DELIMITER ;


-- get Customers Average age
DELIMITER $$
create procedure GetAverageAge()
begin
    select AVG(age) AS Average_age from Customers;
end $$
DELIMITER;


-- # Get address by name (duplicate of earlier, still correct)
DELIMITER $$

CREATE PROCEDURE GetAddress(IN custName VARCHAR(100))
BEGIN
    SELECT address 
    FROM customers 
    WHERE name = custName;
END $$

DELIMITER ;


-- # Count customers in age range
DELIMITER $$

CREATE PROCEDURE CountCustomersByAgeRange(IN minAge INT, IN maxAge INT)
BEGIN
    SELECT COUNT(*) AS total_customers 
    FROM customers 
    WHERE age BETWEEN minAge AND maxAge;
END $$

DELIMITER ;


-- Get customers with salary above a certain amount
DELIMITER $$
create procedure GetCustomersWithHighSalary(IN minSalary DECIMAL(18, 2))
begin 
    select * from Customers where Salary > minSalary;
end $$
DELIMITER ;


-- Get customers with name starting with a certain letter
DELIMITER $$
create procedure GetCustomersWithNameStartingWith(IN prefix VARCHAR(50))
begin 
    select * from Customers where Name LIKE CONCAT(prefix, '%');
end $$
DELIMITER ;

call GetCustomersWithNameStartingWith('M');

