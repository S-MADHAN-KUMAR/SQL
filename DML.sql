-- DML Exercises: INSERT, UPDATE, DELETE, SELECT

-- 1. INSERT Queries
-- 1.1 Insert a Single Record
INSERT INTO students (id, name, age, grade) VALUES (1, 'John Doe', 20, 'A');

-- 1.2 Insert Multiple Records
INSERT INTO students (id, name, age, grade) VALUES 
(2, 'Alice', 19, 'B'),
(3, 'Bob', 21, 'A'),
(4, 'Charlie', 20, 'C');

-- 1.3 Insert Data from Another Table
INSERT INTO it_employees (id, name, department) 
SELECT id, name, department FROM employees WHERE department = 'IT';

-- 2. UPDATE Queries
-- 2.1 Update a Single Column
UPDATE students SET grade = 'A+' WHERE name = 'John Doe';

-- 2.2 Update Multiple Columns
UPDATE students SET grade = 'B', age = 22 WHERE name = 'Bob';

-- 2.3 Update Multiple Rows
UPDATE students SET age = age + 1;

-- 3. DELETE Queries
-- 3.1 Delete a Single Record
DELETE FROM students WHERE name = 'Charlie';

-- 3.2 Delete Multiple Records
DELETE FROM students WHERE grade = 'C';

-- 3.3 Delete All Records (Without Dropping Table)
DELETE FROM students;

-- 4. SELECT Queries
-- 4.1 Select All Columns
SELECT * FROM students;

-- 4.2 Select Specific Columns
SELECT name, grade FROM students;

-- 4.3 Select with WHERE Condition
SELECT * FROM students WHERE grade = 'A';

-- 4.4 Select with ORDER BY
SELECT * FROM students ORDER BY age DESC;

-- 4.5 Select with GROUP BY
SELECT grade, COUNT(*) FROM students GROUP BY grade;

-- 4.6 Select with HAVING
SELECT grade, COUNT(*) FROM students GROUP BY grade HAVING COUNT(*) > 1;

-- 4.7 Select with LIMIT
SELECT * FROM students ORDER BY age DESC LIMIT 3;

-- 4.8 Select with DISTINCT
SELECT DISTINCT grade FROM students;

-- 5. Combining DML Queries
-- 5.1 Insert, Update, and Select
INSERT INTO students (id, name, age, grade) VALUES (5, 'Emma', 18, 'B');
UPDATE students SET grade = 'A' WHERE name = 'Emma';
SELECT * FROM students;
