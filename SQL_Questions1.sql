 create table emp1(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);

insert into emp1
values
(1, 'Ankit', 100,10000, 4, 39);
insert into emp1
values (2, 'Mohit', 100, 15000, 5, 48);
insert into emp1
values (3, 'Vikas', 100, 10000,4,37);
insert into emp1
values (4, 'Rohit', 100, 5000, 2, 16);
insert into emp1
values (5, 'Mudit', 200, 12000, 6,55);
insert into emp1
values (6, 'Agam', 200, 12000,2, 14);
insert into emp1
values (7, 'Sanjay', 200, 9000, 2,13);
insert into emp1
values (8, 'Ashish', 200,5000,2,12);
insert into emp1
values (9, 'Mukesh',300,6000,6,51);
insert into emp1
values (10, 'Rakesh',300,7000,6,50);

select * from emp
select * from emp1

update emp
set emp_id =1 where emp_name = 'Rakesh'

-- Q1 -> How to find duplicates in a given table
select emp_id, count(emp_id) from emp group by emp_id having count(emp_id)>1
select emp_id, count(1) from emp group by emp_id having count(1)>1

---Q2 -> How to delet duplicates
with cte as (select *, ROW_NUMBER() over(partition by emp_id order by emp_id) as rn from emp)
delete from cte where rn>1

---Q3 -> difference between union and union all

SELECT manager_id from emp
union all
select  manager_id from emp1

SELECT manager_id from emp
union
select  manager_id from emp1


