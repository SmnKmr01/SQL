
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    hire_date DATE,
    termination_date DATE NULL
);

INSERT INTO employees (employee_id, employee_name, department_id, hire_date, termination_date)
VALUES
-- Department 1
(1, 'Amit', 1, '2022-01-10', NULL),
(2, 'Neha', 1, '2023-02-15', NULL),
(3, 'Raj', 1, '2024-03-01', NULL),

-- Department 2
(4, 'Priya', 2, '2022-05-20', NULL),
(5, 'Karan', 2, '2023-06-18', NULL),

-- Department 3
(6, 'Vikas', 3, '2023-01-01', NULL),
(7, 'Sneha', 3, '2023-04-10', '2025-01-01'),
(8, 'Rohit', 3, '2024-02-01', NULL),
(9, 'Anjali', 3, '2024-07-01', NULL),
(10, 'Pooja', 3, '2025-01-10', NULL);


select * from employees

--Find the department with the largest increase in employee count compared to last year.

with current_year as(
select
department_id,
count(*) as emp_count
from employees
where hire_date <= GETDATE() AND (Termination_date is null or termination_date >= GETDATE())
group by department_id
),
last_year as(
select 
department_id,
COUNT(*)  as emp_count
from employees
where hire_date <= DATEADD(year, -1, GETDATE()) and (Termination_date is null or termination_date >= DATEADD(year, -1, GETDATE()))
group by department_id
)
SELECT TOP 1
       c.department_id,
       c.emp_count - ISNULL(l.emp_count,0) AS increase_in_employees
FROM current_year c
LEFT JOIN last_year l
       ON c.department_id = l.department_id
ORDER BY increase_in_employees DESC


