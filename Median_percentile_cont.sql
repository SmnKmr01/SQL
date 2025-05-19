--how to calculate  median(middle no.)

create table emp(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into emp
values
(1, 'Ankit', 100,10000, 4, 39),
(2, 'Mohit', 100, 15000, 5, 48),
(3, 'Vikas', 100, 10000,4,37),
(4, 'Rohit', 100, 5000, 2, 16),
(5, 'Mudit', 200, 12000, 6,55),
(6, 'Agam', 200, 12000,2, 14),
(7, 'Sanjay', 200, 9000, 2,13),
(8, 'Ashish', 200,5000,2,12),
(9, 'Mukesh',300,6000,6,51),
(10, 'Rakesh',300,7000,6,50);

select * from emp

 

--method 1: median using row_number
with cte as ( 
select *,
ROW_NUMBER() over(order by emp_age asc) as rn_asc,
ROW_NUMBER() over(order by emp_age desc) as rn_desc
from emp

)
select avg(emp_age) from cte
where abs(rn_asc - rn_desc) <= 1


--method 2 : median using percentile_count

select * ,
PERCENTILE_CONT(0.5) within group (order by emp_age) over(partition by department_id) as median
from emp
where emp_id < 10