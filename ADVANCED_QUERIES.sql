1.INNER JOIN (Find common users in both tables with salary details) 

SELECT u.id, u.name, u.salary AS user_salary, e.salary AS employee_salary
FROM users u
INNER JOIN employees e ON u.name = e.name;

--==========================================================================================

2.LEFT JOIN (All users with employee salary, if exists)

SELECT u.id, u.name, u.salary AS user_salary, e.salary AS employee_salary
FROM users u
LEFT JOIN employees e ON u.name = e.name;

--==========================================================================================

3.RIGHT JOIN (All employees with user salary, if exists)

SELECT e.id, e.name, e.salary AS employee_salary, u.salary AS user_salary
FROM users u
RIGHT JOIN employees e ON u.name = e.name;

--==========================================================================================

4.UNION (Merge both tables into one list)

SELECT id, name, salary FROM users
UNION
SELECT id, name, salary FROM employees;

--==========================================================================================

5.UNION ALL (Include duplicates while merging)

SELECT id, name, salary FROM users
UNION ALL
SELECT id, name, salary FROM employees;

--==========================================================================================

6.Find Users with Higher Salary than Employees (Self-Comparison)

SELECT u.name, u.salary AS user_salary, e.salary AS employee_salary
FROM users u
JOIN employees e ON u.name = e.name
WHERE u.salary > e.salary;

--==========================================================================================



