CREATE DATABASE industry_2;
USE industry_2;
CREATE table employees ( id int PRIMARY key , name_employee varchar(100) ,  department varchar(100) , salary decimal(10,2)) ;
INSERT INTO employees (id,name_employee,department,salary) VALUES (01, 'Alice', 'Engineering', 75000),(02, 'Bob', 'Marketing', 65000),(03, 'Charlie', 'Engineering', 80000);
CREATE TABLE departments (department_id INT PRIMARY KEY,department_name VARCHAR(100));
INSERT INTO departments (department_id,department_name) VALUES(1, 'Engineering'),(2, 'HR'),(3, 'Sales');
SELECT*FROM departments;
INSERT INTO employees (id,name_employee,department,salary) VALUES  (04, 'Diana', 'HR', 60000),(05, 'Evan', 'Engineering', 55000);
SELECT*FROM employees;
SELECT e.id, e.name_employee, e.department, e.salary, d.department_name FROM employees e INNER JOIN departments d ON e.department = d.department_name;
SELECT e.name_employee AS employee_name, d.department_name FROM employees e LEFT JOIN departments d ON e.department= d.department_id;
SELECT e.name_employee AS employee_name, d.department_name FROM employees e RIGHT JOIN departments d ON e.department = d.department_id;

SELECT e.name_employee AS employee_name, d.department_name FROM employees e
LEFT JOIN departments d ON e.department = d.department_id
UNION
SELECT e.name_employee AS employee_name, d.department_name FROM employees e
RIGHT JOIN departments d ON e.department = d.department_id;


