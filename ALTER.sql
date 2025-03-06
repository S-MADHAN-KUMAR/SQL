-- ALTER TABLE Exercises
-- Modify the structure of an existing table

-- 1.1 Add a New Column
-- Add a column email of type VARCHAR(100) to the students table
ALTER TABLE students ADD email VARCHAR(100);

-- 1.2 Modify an Existing Column
-- Change the email column's data type from VARCHAR(100) to VARCHAR(255)
ALTER TABLE students MODIFY email VARCHAR(255);

-- 1.3 Rename a Column
-- Rename the email column to contact_email
ALTER TABLE students CHANGE email contact_email VARCHAR(255);

-- 1.4 Drop a Column
-- Remove the contact_email column from the students table
ALTER TABLE students DROP COLUMN contact_email;

-- 1.5 Add a Primary Key
-- Add a PRIMARY KEY to the id column of the students table
ALTER TABLE students ADD PRIMARY KEY (id);

-- 1.6 Add a Foreign Key
-- Create a foreign key in the orders table that references the customers table
ALTER TABLE orders ADD CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES customers(id);

-- 1.7 Remove a Foreign Key
-- Drop the foreign key constraint named fk_customer from the orders table
ALTER TABLE orders DROP FOREIGN KEY fk_customer;

-- 1.8 Rename a Table
-- Rename the students table to university_students
ALTER TABLE students RENAME TO university_students;

-- TRUNCATE TABLE Exercises
-- The TRUNCATE statement removes all rows from a table but retains its structure

-- 2.1 Truncate a Table
-- Remove all data from the employees table
TRUNCATE TABLE employees;

-- 2.2 Truncate and Check Table Data
-- Insert three records into the employees table, then truncate and check the data
INSERT INTO employees (id, name, department) VALUES 
(1, 'Alice', 'HR'),
(2, 'Bob', 'Finance'),
(3, 'Charlie', 'IT');

TRUNCATE TABLE employees;

SELECT * FROM employees;

-- 2.3 Difference Between DELETE and TRUNCATE
-- Use DELETE FROM employees and check if AUTO_INCREMENT is reset
DELETE FROM employees;
SELECT * FROM employees;  -- Check remaining rows

-- Use TRUNCATE TABLE employees and check if AUTO_INCREMENT is reset
TRUNCATE TABLE employees;
SELECT * FROM employees;  -- Check remaining rows
