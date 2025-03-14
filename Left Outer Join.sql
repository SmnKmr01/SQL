select * from emp left outer join
dept on emp.department_id = dept.dep_id

 

select * from emp
left join (select * from dept where dept.dep_name= 'Analysis' )dept on emp.department_id = dept.dep_id

select * from emp
left join dept on emp.department_id = dept.dep_id
where dept.dep_name is null and emp.salary = 12000