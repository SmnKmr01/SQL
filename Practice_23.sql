--List departments with no open positions

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE job_openings (
    job_id INT PRIMARY KEY,
    department_id INT,
    job_title VARCHAR(50),
    status VARCHAR(20),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Sales'),
(5, 'Marketing');

INSERT INTO job_openings (job_id, department_id, job_title, status) VALUES
(101, 1, 'HR Executive', 'Closed'),
(102, 2, 'SQL Developer', 'Open'),
(103, 2, 'Data Engineer', 'Closed'),
(104, 3, 'Accountant', 'Closed'),
(105, 4, 'Sales Manager', 'Open');

select * from departments
Select * from job_openings



SELECT d.department_id
FROM departments d
LEFT JOIN job_openings j ON d.department_id =
j.department_id AND j.status = 'Open'
WHERE j.job_id IS NULL

--Retrieve employees with salary in top 5% company-wide.

select * from employee

WITH salary_ranks AS (
 SELECT salary, PERCENT_RANK() OVER
(ORDER BY salary DESC) AS pr
 FROM employee
)


INSERT INTO employees (emp_id, emp_name, department, salary) VALUES
(1, 'Amit', 'IT', 50000),
(2, 'Neha', 'HR', 60000),
(3, 'Rahul', 'Finance', 75000),
(4, 'Priya', 'IT', 90000),
(5, 'Karan', 'Sales', 120000),
(6, 'Sneha', 'HR', 45000),
(7, 'Vikas', 'IT', 150000),
(8, 'Anjali', 'Finance', 110000),
(9, 'Rohit', 'Sales', 130000),
(10, 'Meera', 'IT', 200000),
(11, 'Arjun', 'Finance', 175000),
(12, 'Pooja', 'HR', 30000),
(13, 'Nikhil', 'Sales', 95000),
(14, 'Kavya', 'IT', 85000),
(15, 'Manish', 'Finance', 140000),
(16, 'Divya', 'HR', 155000),
(17, 'Suresh', 'Sales', 40000),
(18, 'Deepa', 'IT', 210000),
(19, 'Ramesh', 'Finance', 220000),
(20, 'Alok', 'Sales', 250000);

select * from Employees


SELECT *
FROM (
    SELECT *,
           PERCENT_RANK() OVER (ORDER BY salary DESC) AS pct_rank
    FROM employees
) t
WHERE pct_rank <= 0.05;

--or--

select * from (
select *,
	NTILE(20) over (Order by salary desc) as bucket
from Employees
) t
where bucket  = 1

--or--

select TOP 5 PERCENT * FROM Employees
order by salary desc