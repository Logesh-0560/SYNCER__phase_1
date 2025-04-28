use industry_2;
INSERT INTO employees (id,name_employee,department,salary) VALUES (6, 'Fiona', 'Sales', 50000), (7, 'George', 'Sales', 48000);
SELECT*FROM employees
  SELECT department, AVG(salary) AS avg_salary FROM employees WHERE department = 'Engineering' GROUP BY department;
    SELECT department, AVG(salary) AS avg_salary FROM employees GROUP BY department HAVING AVG(salary) > 60000;

