--Write a sql query to report all customers who never order anything

--Using left Join

select c.name as customers
from customers c
left join orders o
on c.id = o.customerId
where o.id is null

--using subquery

select name from customers
where id not IN (select id from orders)


--Write a sql query to find the employees who are high earners in each of the departments

select Department. Employee, Salary 
from (
select d.name as department, e.name as employee, e.salary as salary,
DENSE_RANK() over (partition by d.name order by e.salary desc) as rnk
from employee e
join department d
on e.departmentid = d.id) a 
where a.rnk <= 3