

-- Create Employees Table
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT,
    hire_date DATE
);

-- Insert Sample Data
INSERT INTO employees (id, name, manager_id, hire_date) VALUES
(1, 'John', NULL, '2018-01-10'),   -- Top manager
(2, 'David', 1, '2019-03-15'),
(3, 'Emma', 1, '2020-06-20'),
(4, 'Sophia', 2, '2021-02-12'),
(5, 'Michael', 2, '2018-12-01'),
(6, 'Chris', 3, '2022-08-18');

select * from Employees

--Find employees hired after their managers.


SELECT 
    e.name AS employee_name,
    m.name AS manager_name,
    e.hire_date,
    m.hire_date AS manager_hire_date
FROM employees e
JOIN employees m 
    ON e.manager_id = m.id
WHERE e.hire_date > m.hire_date