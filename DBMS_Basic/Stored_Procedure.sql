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
