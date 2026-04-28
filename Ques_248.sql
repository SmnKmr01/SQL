

-- Create employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2)
);


INSERT INTO employees (employee_id, employee_name, department_id, salary)
VALUES
(1, 'John', 101, 50000),
(2, 'Alice', 101, 55000),
(3, 'Bob', 101, 60000),

(4, 'David', 102, 70000),
(5, 'Emma', 102, 75000),
(6, 'Chris', 102, 90000),

(7, 'Sophia', 103, 40000),
(8, 'Michael', 103, 42000),
(9, 'Olivia', 103, 80000);

select * from employees

--Find employees whose salaries are within 10% of their department’s average salary


with dept_avg as(
select department_id,
avg(salary) as avg_salary
from employees
group by department_id
)
select e.*
from employees e
join dept_avg d
on e.department_id = d.department_id
where e.salary Between d.avg_salary * 0.9 and d.avg_salary *1.1