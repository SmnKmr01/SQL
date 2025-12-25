--Write a query to find employees with the second highest salary

select MAX(Salary) AS second_highest_salary
from employees
where salary < (select max(salary) from employees)