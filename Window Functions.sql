---Q4-> difference between rank, row_number and dense rank

select * from employees

select emp_id, emp_name, department_id, salary
,RANK() over (partition by department_id order by salary desc) as rnk
,DENSE_RANK() OVER(PARTITION BY department_id order by salary desc) as dense_rnk
,ROW_NUMBER() over(partition by department_id order by salary desc) as rn
from employees

select * from(
select emp_id, emp_name, department_id, salary
,RANK() over(partition by department_id order by salary desc) as rnk
from employees) a
where rnk =1