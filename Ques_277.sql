CREATE TABLE employee_department_history (
    history_id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT,
    department_id INT,
    change_date DATE
);

INSERT INTO employee_department_history (employee_id, department_id, change_date)
VALUES 
(101, 1, '2023-02-15'),
(101, 2, '2025-01-10'), -- changed within last year
(102, 1, '2022-05-20'),
(102, 3, '2024-06-01'), -- changed within last year
(103, 2, '2023-07-01'),
(104, 4, '2021-09-12'),
(104, 5, '2025-03-05'), -- changed within last year
(105, 3, '2023-12-25');


select * from employee_department_history


--Find the number of employees who changed departments in the last year


with cte as(
select *, 
row_number() over (partition by employee_id order by change_date) as rn
from employee_department_history
) 
select COUNT(employee_id) as no_of_employees
from cte
where change_date >= DATEADD(year,-1,GETDATE()) and rn > 1



SELECT COUNT(DISTINCT employee_id) AS employees_changed_department
FROM employee_department_history
WHERE change_date >= DATEADD(YEAR, -1, GETDATE());