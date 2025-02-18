---WHERE--
select * from employees
where salary >10000

---HAVING--
select department_id, avg(salary) 
from employees group by department_id
having avg(salary) > 9500


select department_id, avg(salary) 
from employees 
WHERE salary >10000
group by department_id
having avg(salary) > 12000


create table emp_compensation (
emp_id int,
salary_component_type varchar(20),
val int
);
insert into emp_compensation
values (1,'salary',10000),(1,'bonus',5000),(1,'hike_percent',10)
, (2,'salary',15000),(2,'bonus',7000),(2,'hike_percent',8)
, (3,'salary',12000),(3,'bonus',6000),(3,'hike_percent',7);

 
 select * from emp_compensation

 ---CASE---

 select emp_id
 ,sum(case when salary_component_type = 'salary' then val end) as salary
 ,sum(case when salary_component_type = 'bonus' then val end) as bonus
 ,sum(case when salary_component_type = 'hike_percent' then val end) as hike_percent
 from emp_compensation
 group by emp_id

  select emp_id
 ,sum(case when salary_component_type = 'salary' then val end) as salary
 ,sum(case when salary_component_type = 'bonus' then val end) as bonus
 ,sum(case when salary_component_type = 'hike_percent' then val end) as hike_percent
 into emp_compensation_pivot
 from emp_compensation
 group by emp_id


 select * FROM emp_compensation_pivot

 select * from(
 select emp_id,'salary' as salary_component_type, salary as val from emp_compensation_pivot
 union all
 select emp_id,'bonus' as salary_component_type, bonus as val from emp_compensation_pivot
 union all
 select emp_id,'hike_percent' as salary_component_type, hike_percent as val from emp_compensation_pivot
 )a
 order by a.emp_id



