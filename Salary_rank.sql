--How do you rank employees based on salary within each department

CREATE TABLE employees(
id int primary key,
name varchar(100),
department varchar(100),
manager_id int,
salary decimal(10,2),
hire_date date)


INSERT INTO employees(id, name, department, manager_id, salary, hire_date)
values
(1, 'Alice', 'HR', NULL, 70000,'2015-06-23'),
(2,'Bob', 'IT',1, 90000,'2016-09-17'),
(3,'Charlie','Finance',1,80000,'2017-02-01'),
(4,'David','IT',2,75000,'2018-02-01'),
(5, 'Eve','Finance', 3, 72000,'2019-04-30')


WITH SalaryRanking AS(
select id, name, department, salary,
 RANK() Over (Partition by department ORDER BY salary DESC) AS rank
from employees
)
SELECT * FROM SalaryRanking WHERE rank <=3