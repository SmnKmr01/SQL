--Classify employees based on salary brackets

Select Name, Salary,
	Case when salary < 60000 Then 'Low'
		 when salary between 60000 and 100000 then 'medium'
		 else 'high'
	end as salarycategory
from employees

--check if employees are experienced or not

select Name, Experience,
	case
		when experience >= 10 then 'Senior'
		when experience between 5 and 9 then 'mid-level'
		else 'junior'
	end as experiencelevel
from employees

-- Assign Performance levels using case when
select Name, salary, experience,
	Case 
		when salary > 100000 or experience > 15 then 'Top-performer'
		when salary between 70000 and 100000 or experience between 7 and 15 then ' mid-performer'
		else 'Needs Improvement'
	end as performancelevel
from employees

--Identify employees in top 10% salary

select name, salary,
	case
		when salarybucket = 1 then 'top10%earner'
		else 'Below top 10%'
from ( select name, salary, NTILE(10) over (order by salary desc) as salarybucket
from employees) t