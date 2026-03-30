drop table employees
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT,
    hire_date DATE
);

INSERT INTO employees (id, name, manager_id, hire_date) VALUES
-- Managers
(1, 'Amit', NULL, '2020-01-06'),   -- Monday
(2, 'Neha', NULL, '2020-01-07'),   -- Tuesday

-- Employees reporting to Amit
(3, 'Rahul', 1, '2021-03-01'),     -- Monday (same weekday as Amit)
(4, 'Priya', 1, '2022-05-03'),     -- Tuesday (different weekday)

-- Employees reporting to Neha
(5, 'Karan', 2, '2021-06-08'),     -- Tuesday (same weekday as Neha)
(6, 'Pooja', 2, '2023-07-09');     -- Sunday (different weekday)

--Find employees whose hire date is the same weekday as their manager’s

select * from employees

SELECT 
    e.id,
    e.name AS EmployeeName,
    m.id AS ManagerId,
    m.name AS ManagerName
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.id
WHERE DATEPART(WEEKDAY, e.hire_date) =
      DATEPART(WEEKDAY, m.hire_date);