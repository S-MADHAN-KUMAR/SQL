CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);
CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;


CREATE TABLE client(
    client_id INT PRIMARY KEY,
    client_name varchar(40),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with(
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY (emp_id,client_id),
    FOREIGN KEY ( emp_id ) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY ( client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier(
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id,supplier_name),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
    
);

DESCRIBE TABLE employee;
DESCRIBE TABLE branch;
SELECT * FROM employee;
SELECT * FROM branch;


INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id=1
WHERE emp_id=100;

INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);
INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');


UPDATE employee
SET branch_id=2
WHERE emp_id=102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);


SELECT * FROM employee;

INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3,'Stamford',106,'1998-02-13');


UPDATE employee
SET branch_id=3
WHERE emp_id=106;
INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

INSERT INTO branch VALUES(4,'buffollo',NULL,NULL);

SELECT first_name AS FORENAME, last_name AS SURNAME 
FROM employee
LIMIT 5  ;

SELECT DISTINCT branch_id
FROM employee;
SELECT  COUNT(emp_id)
from employee
WHERE sex='F' AND birth_day>'1970-01-01';

SELECT SUM(salary)
FROM employee
WHERE sex='M';

SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

SELECT SUM(total_sales), client_id
FROM works_with
GROUP BY client_id;

SELECT * FROM client;

SELECT * FROM branch;
SELECT * FROM works_with;
SELECT * FROM branch_supplier;


--WILDCARDS
SELECT *
FROM branch_supplier
WHERE supplier_name LIKE '%LABELS';
SELECT *
FROM client
WHERE client_name LIKE '%SCHOOL%';



--UNION---

SELECT first_name AS NAMES
FROM employee
UNION
SELECT branch_name
FROM branch
UNION
SELECT client_name
FROM client;

SELECT client_name  AS LIST, client.branch_id AS BRANCH
FROM client
UNION
SELECT supplier_name,branch_id
FROM branch_supplier;

SELECT total_sales AS EARNINGS
FROM works_with
UNION
SELECT salary
FROM employee;

--JOIN--
-- (NORMAL JOIN ,LEFT , RIGHT , FULL OUTER JOIN)

SELECT emp_id,first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON emp_id=mgr_id;

------------------NESTED QUERIES----------------------


SELECT client_name
FROM client
WHERE branch_id = (
    SELECT branch_id
    FROM branch
    WHERE mgr_id=102
    LIMIT 1
);
SELECT branch_id
FROM branch
WHERE mgr_id=102;
SELECT first_name,last_name
FROM employee
WHERE emp_id IN (    --USE 'IN' NOT 'AS'
    SELECT emp_id
    FROM works_with
    WHERE total_sales>30000
);



SELECT * FROM client;


---------TRIGGERS---------

DELIMIT;

select * from employee;

select first_name from employee
where salary in (
SELECT MAX(salary)  
from employee
group by (sex)
)
;

SELECT DISTINCT sex, salary 
FROM employee
ORDER BY salary DESC 
LIMIT 1 OFFSET 1;


CREATE TABLE teacher(
    teacher_id INT AUTO_INCREMENT,
    teacher_name varchar(50),
    primary key (teacher_id)
);
drop table teacher;
drop table students;

CREATE TABLE students(
    student_id INT AUTO_INCREMENT,
    teacher_id INT,
    student_name varchar(50),
    primary key(student_id),
    foreign key(teacher_id) references teacher(teacher_id) on delete set NULL

);

insert into teacher VALUES("Vignesh");
INSERT INTO teacher (teacher_name) VALUES ('Logesh');
select * from teacher;
select * from students;
INSERT into students(teacher_id,student_name)  VALUES(2,"Harish");
INSERT into students(teacher_id,student_name)  VALUES(1,"sathish");
INSERT into students(teacher_id,student_name)  VALUES(3,"Basha");

delete from teacher
where teacher_id=1;

select teacher_name
from teacher
union
select student_name 
from students;

select teacher_name as teacher, student_name as students
from teacher
right join
students on teacher.teacher_id=students.teacher_id;

select * from employee;`

select AVG(salary) as average,sex
from employee
group by sex
having average>100000;

select first_name , last_name 
from employee
where branch_id in (
    select branch_id 
from branch
    
);

select branch_id 
from branch;


select employee.first_name , employee.branch_id, branch_name
from employee
left join
branch on employee.branch_id=branch.branch_id;

select * 
from employee
order by emp_id asc
limit 5;




select first_name ,salary
from employee
where salary in(
    select max(salary)
from employee
UNION
select min(salary)
from employee

);

select max(salary)
from employee
;