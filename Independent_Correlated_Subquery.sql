 --independent vs correlated sub queries
 --why do w need sub queries
 --independent sub queries
 --correlated sub queries

 --Write a sql to print employee detals who's salary is more tham their department average salary


 select e.*,d.avg_dep_salary from employee e
 inner join 
 (SELECT dept_id, avg(salary) as avg_dep_salary
 from employee
 group by dept_id) d on e.dept_id = d.dept_id
 where e.salary>d.avg_dep_salary

 -- 1 we can run it independently
 --2 it runs only once

 select * from employee e1
 where salary > (select avg(e2.salary) from employee e2 where e1.dept_id = e2.dept_id)