

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);

INSERT INTO employees (id, name, department_id, salary) VALUES
(1, 'Amit', 101, 50000),
(2, 'Ravi', 101, 60000),
(3, 'Sita', 102, 70000),
(4, 'Neha', 102, 80000),
(5, 'John', 103, 40000),
(6, 'Sara', 103, 45000),
(7, 'Kiran', 104, 90000),
(8, 'Priya', 104, 95000);


select * from employees

----Find departments where average salary is higher than the company average.



WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary 
    FROM employees
)
SELECT department_id, AVG(salary) AS dept_avg
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (SELECT avg_salary FROM company_avg)
