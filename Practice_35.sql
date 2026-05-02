

--1.Second Highest Order Amount

select max(amount)
from orders
where amount < (select max(amount) from orders


--2 Nth Highest Salary

select distinct salary
from employee
order by salary desc
offset 2 rows fetch next 1 row only

---3.Top 3 Salaries per Department

select * 
from(
denserank() over(partition by dept order by salary desc) as rnk
from employee) t
where rnk = 3

-- 4. Employees > Manager Salary


select e.name
from employee e
join employee m on e.manager_id = m.id
where e.salary > m.salary

--5.Consecutive 3-Day Logins

select user_id
from(
select user_id, login_date,
login_date - row_number() over (partition by user_id order by login_date) grp
from logins) t
group by  user_id, grp
having count(*) >= 3


--6 . Find Duplicate Records

select col, count(*)
from table
group by col
having count(*) > 1


--7.Delete Duplicate Records


delete from table
where id not in(
select min(id)
from table
group by col)

--8.Running Total

select date,
sum(amount) over (order by date)
from sales

--9. Moving Average(7days)

select date,
avg(amount) over( order by date rows between 6 preceding and current row)
from sales

--10. First & Last Order

select customer_id, min(order_date), max(order_date)
from orders
group by customerid