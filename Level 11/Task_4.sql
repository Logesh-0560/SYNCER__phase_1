USE industry_2;
CREATE TABLE department_stats (department VARCHAR(100) PRIMARY KEY,avg_salary DECIMAL(10, 2));
DELIMITER //
CREATE PROCEDURE CalculateAvgSalary(IN department_name VARCHAR(100))
BEGIN
    DECLARE avgSal DECIMAL(10,2);
    SELECT AVG(salary) INTO avgSal
    FROM employees
    WHERE department = department_name;
    INSERT INTO department_stats (department, avg_salary)
    VALUES (department_name, avgSal)
    ON DUPLICATE KEY UPDATE avg_salary = avgSal;
END //

DELIMITER ;
CALL CalculateAvgSalary('Engineering');
SELECT * FROM department_stats;

