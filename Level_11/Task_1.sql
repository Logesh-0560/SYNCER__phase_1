CREATE DATABASE industry;
USE industry;
CREATE table employees ( id int PRIMARY key , name_employee varchar(100) ,  department varchar(100) , salary decimal(50) )
INSERT INTO employees (id,name_employee,department,salary) VALUES (01, 'Alice', 'Engineering', 75000),(02, 'Bob', 'Marketing', 65000),(03, 'Charlie', 'Engineering', 80000);
SELECT*FROM employees;
UPDATE employees SET salary=70000 where id=02;
SELECT * FROM employees WHERE department = 'Engineering';
DELETE FROM employees WHERE id = 3;
ALTER TABLE employees ADD appraisal_percentage DECIMAL(5, 2);
SELECT*FROM employees;