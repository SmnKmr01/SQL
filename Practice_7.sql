create table emp1(
emp_id int,
emp_name varchar(20),
department_id int,
salary int,
manager_id int,
emp_age int);
drop table orders
CREATE TABLE orders (
    customer_name VARCHAR(50),
    order_date DATE,
    order_amount INT,
    customer_gender VARCHAR(10)
);

INSERT INTO orders (customer_name, order_date, order_amount, customer_gender)
VALUES
('Shilpa', '2020-01-01', 10000, 'Male'),
('Rahul', '2020-01-02', 12000, 'Female'),
('SHILPA', '2020-01-02', 12000, 'Male'),
('Rohit', '2020-01-03', 15000, 'Female'),
('shilpa', '2020-01-03', 14000, 'Male');

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
insert into emp1
values (1, 'Saurabh',300,7000,6,50);

select * from emp
select * from emp1
select * from dept

--duplicates
select emp_id, count(1) from emp1 group by  emp_id having count(1) > 1

--delete duplicates
with cte as(select * , ROW_NUMBER() over (partition by emp_id order by emp_id) as rn from emp1)
delete from cte where rn > 1


--difference between union and union all
select manager_id from emp
union
select manager_id from emp1

select manager_id from emp
union all
select manager_id from emp1

--diff between rank, dense_rank, row_number

select *,
RANK() over (partition by department_id order by salary desc) as rnk,
DENSE_RANK() over (partition by department_id order by salary desc) as rnk,
ROW_NUMBER() over (partition by department_id order by salary desc) as rnk
from emp

--employees who are not present in department table

select * from emp e
where e.department_id not in (select dept_id from dept)

select e.*, d.dept_id, d.dep_name from emp e
left join dept d on e.department_id = d.dept_id
where d.dep_name is null


-- second highest salary in each dep
select * from(
select e.*,
dense_rank() over(partition by department_id order by salary desc) as rn from emp e)
a where rn =2 

--find all the transaction done by  shilpa
select * from orders where customer_name = 'Shilpa'


--self join, manager salary > emp salary
select * from emp

select e.*, m.salary as manager_salary
from emp e
join emp m on e.manager_id = m.emp_id
where m.salary > e.salary


--joins left join / inner join

--update query to swap gender

update orders set customer_gender = case when customer_gender = 'Male' then 'Female'
								 when customer_gender = 'Female' then 'Male' end

select emp_id,
sum(case when salary_component_type = 'salary' then val end) as salary
, sum(case when salary_component_type = 'bonus' then val end) as bonus
, sum(case when salary_component_type = 'hike_percent' then val end ) as hike_percent
into emp_compensation_pivot
from emp_compensation
group by emp_id


select * from emp


select e.emp_name as Employee_Name,e.department_id as Employee_deptId, e.salary as Employee_salary, m.emp_name as Manager_Name, m.department_id as Manager_deptId, e.salary as Manager_salary
from emp e
 join emp m 
 on e.manager_id = m.emp_id

