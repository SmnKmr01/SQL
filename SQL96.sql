--Find duplicate records in a table
select col1, col2, count(*)
from tbl
group by col1, col2
having count(*) > 1

--Get the top 3 highest paid employees

select top 3 *
from employee
order by salary desc

--2nd highest salary

select max(salary) as secondhighestsalary
from employee
where salary < (salary max(salary from employee)
