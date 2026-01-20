-- How do you calculate the number of levels in an organizational hierarchy?


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



with hierarchy as(
select id, name,manager_id,1 as level from employees where manager_id is null

union all

select e.id, e.name, e.manager_id, h.level + 1
from employees e join Hierarchy h on e.manager_id = h.id
)
select max(level) as max_levels from Hierarchy


select * from employees