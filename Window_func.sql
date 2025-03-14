select emp_id, emp_name, department_id,salary, 
RANK() over(partition by department_id order by salary desc) as rnk 
, DENSE_RANK() over(partition by department_id order by salary desc) as dense_rnk
, ROW_NUMBER() over(partition by department_id order by salary desc) as row_num
from emp

select * from (
select emp_id,emp_name, department_id, salary,
RANK() over(partition by department_id order by salary desc) as rnk
from emp) a
where rnk = 1