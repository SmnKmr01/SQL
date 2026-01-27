--How can you identify employees without direct reports?

 drop table employees
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

SELECT * FROM employees

with EmployeeReport AS (
select e1.id, e1.name, COUNT(e2.id) AS report_count
from employees e1 left join employees e2 on e1.id = e2.manager_id
group by e1.id, e1.name
)
select * from EmployeeReport where report_count = 0