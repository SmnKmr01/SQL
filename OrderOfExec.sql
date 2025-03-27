--SQL Order of execution
select * from employee

select top 5 emp_id, emp_name, salary, salary*1.0/2 as half_salary
from employee
where salary>6000
order by half_salary desc

select top 1 e.dept_id,d.dep_name,sum(e.salary) as dep_salary
from employee e
inner join dept d on e.dept_id=d.dep_id
where e.salary>6000 and d.dep_id = 200
group by e.dept_id, d.dep_name
having sum(e.salary) >10000
order by dep_salary desc


from -> join -> where -> group by -> having -> select -> order by -> top 5