-- How do you find all employees who are managers
-- use self join

select e.name, m.name 
from employee e join employee m
on e.mgr_id  = m.emp_id


--using sub query

select name from employee
where emp_id in (select mgr_id from employee)

--How to create empty tables with the same structure as another table

select * into students_copy
from students where 1 = 2


-- Max salary from each department

select DeptID, MAX(salary) from employee
group by DeptID