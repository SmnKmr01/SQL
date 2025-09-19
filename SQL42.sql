--Second highest salary

select MAX(salary) from EMployees
where salary < (SELect MAX(salary) from employees


--Department wise avg salary (with >5 employees)

select dept_id, avg(salary) as avg_salary
from employees
group by dept_id
Having count(*) > 5 

--Customers with >3 orders in last 30days
select customer_id,count(order_id) as OrderCount from order 
where order_date >=DATEADD(DAY, -30, GETDATE())
Group by customer_id
HAVING COUNT(order_id) > 3


--FIND duplicates on multiple fields
select col1, col3, count(*)
from my_table
GROUP BY col1, col2
HAVING COUNT(*) >1


--Transpose rows into columns using CASE

select user_id,
MAX(CASE WHEN month = 'Jan' then spend END) as Jan,
MAX(CASE WHEN month = 'Feb' then spend END) as Feb
from user_spend
Group by user_id