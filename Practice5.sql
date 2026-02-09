--Find Duplicate EMails

select email from employees
Group by email
HAVING count(*) > 1


--Fetch 50% of Records

select * from employees
where empid <= (SELECT count(*)/2 FROM employees)

--Delete Records without using DELETE

TRUNCATE TABLE employees

--Find Employees Earning More Than Manager

select e.empname from employees e
join employees m
on e.ManagerID = m.EmpID
where e.salary > m.salary

--Find Running Total
Select empid, salary,
	sum(salary) over (ORDER by empid) as RunningTotal
from employees