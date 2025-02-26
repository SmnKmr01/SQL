/* master SQl Update statement*/

select * from emp;
select * from dept

--update syntax for single value update
update emp set salary = 12000

--update with where clause
update emp set salary=12000 where emp_age >30

---update multiple values
update emp set salary = 12000, department_id = 200 where emp_id =2

--update column with constant values and derivations(col calculations / case when)
update emp set salary=case when department_id=100 then salary * 1.1 when department_id=200 then salary*1.2 else salary end 

--update using join
alter table emp add dep_name varchar(20)

update emp 
set dep_name =d.dep_name
from emp e
inner join dept d on e.department_id = d.dep_id

--interview question on update
alter table emp add gender varchar(10)
update emp set gender = case when  gender = 'Male' then 'Female' else 'Male' end

update emp set gender = case when department_id =100 then 'Male' else 'Female' end

--cautious before running update tips/tricks
select *, case when gender = 'Male' then 'Female' else 'Male' end from emp
where department_id = 200