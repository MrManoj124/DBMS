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


