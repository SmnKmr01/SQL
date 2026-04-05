
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    hire_date DATE,
    manager_id INT
);


INSERT INTO employees (id, name, hire_date, manager_id) VALUES
(1, 'Suman', '2020-01-15', NULL),     -- Top level manager
(2, 'Rahul', '2021-03-10', 1),
(3, 'Priya', '2019-07-20', 2),        -- Manager hired after employee
(4, 'Amit', '2022-05-01', 2),
(5, 'Neha', '2018-11-12', 3),         -- Manager hired after employee
(6, 'Vikram', '2023-02-18', 1),
(7, 'Kiran', '2017-09-25', 4);        -- Manager hired after employee




select * from employees

--Find employees who report to a manager hired after them


select e.name as EmployeeName ,e.hire_date as Employee_hire_dt , m.name as Manager_Name, m.hire_date as Manager_hire_dt

from employees e
left join employees m
on e.manager_id = m.id
where m.hire_date > e.hire_date