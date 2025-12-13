--How to remove duplicate rows in sql?
--If the SQL has duplicate rows, the duplicate rows must be removed

Delete from table
where id IN (
select ID, count(ID) from table
group by id
having count(id) >1)


--Highest salary
select * from (
select employee_name, salary, DENSE_RANK() over (order by salary desc) rnk
from employee)
where rnk = 2