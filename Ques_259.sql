

-- Create table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT,
    salary INT
);

-- Insert sample data
INSERT INTO employees (emp_id, emp_name, department_id, salary) VALUES
(1, 'Amit', 10, 70000),
(2, 'Neha', 10, 65000),
(3, 'Raj', 10, 50000),

(4, 'John', 20, 80000),
(5, 'Sara', 20, 90000),
(6, 'Mike', 20, 40000),

(7, 'Anu', 30, 30000),
(8, 'Kiran', 30, 35000),
(9, 'Ravi', 30, 70000);

-- Query

select * from employees

--Find departments where more than 50% of employees have a salary above $60,000



SELECT department_id
FROM employees
GROUP BY department_id
HAVING AVG(CASE 
            WHEN salary > 60000 THEN 1 
            ELSE 0 
          END) > 0.5