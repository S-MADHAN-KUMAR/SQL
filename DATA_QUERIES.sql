INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com');   "Insert Data"

SELECT * FROM users;                           "Select Data (Retrieve All Rows)"

SELECT name, email FROM users;                   "Select Specific Columns"

SELECT * FROM users WHERE email = 'john@example.com';       "Filter Data (WHERE Clause)"

UPDATE users SET name = 'Johnny Doe' WHERE email = 'john@example.com';       "Update Data"

DELETE FROM users WHERE email = 'john@example.com';                 "Delete Data"

SELECT * FROM users ORDER BY name ASC;            "Order Data (ASC/DESC)"

SELECT * FROM users LIMIT 5;                        "Limit the Number of Rows"

SELECT COUNT(*) FROM users;                         "Count Number of Rows"

SELECT DISTINCT email FROM users;                    "Find Unique Values (DISTINCT)"

SELECT COUNT(*) FROM users;   "Count total users"
SELECT AVG(salary) FROM users;  "Average salary "            "Aggregation Queries:"
SELECT MAX(salary) FROM users;  "Highest salary"
SELECT MIN(salary) FROM users;  "Lowest salary"

=============================================[ Modify the column ]==================================================================

ALTER TABLE Students 

MODIFY COLUMN age INT DEFAULT 20;

ALTER TABLE students ADD CONSTRAINT chk_age CHECK (age > 18);

ALTER TABLE students MODIFY COLUMN age INT;

ALTER TABLE students DROP CONSTRAINT students_chk_1;

=================================================================================================================
