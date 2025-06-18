CREATE TABLE emp(
name varchar(50),
dept varchar(50),
salary varchar(50))


INSERT INTO emp VALUES
('Virat','IT',8000),
('Rohit','IT',7500),
('Pant','Finance',7000),
('Rahul','Finance',6000),
('Rinku','HR',4000),
('Rinku','HR',4000),
('Bumrah','Admin',7000),
('Shami','Admin',6000)

select * from emp

-- Get the highest salary


select name, dept, max(salary) from emp
group by  name, dept

select * from(select emp.*, 
ROW_NUMBER() over(partition by dept order by salary desc) as rnk
from emp) e
where e.rnk = 1 

with cte as(
select *, 
ROW_NUMBER() over(partition by dept order by salary desc) rn
from emp) 
Select * from cte 
where rn =1

--WHat is the output of below mentioned code snippet
SELECT * from emp 
where 5=5 AND dept= 'IT'
order by 2 desc

-- delete the duplicate data from table which doesn't have any primary
with cte as(
select *,
ROW_NUMBER() over(partition by salary, dept, name order by name) as rnk from emp)
delete from cte
where rnk >1