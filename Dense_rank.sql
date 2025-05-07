 drop table employees

 Create table Employees
(
 ID int primary key identity,
 FirstName nvarchar(50),
 LastName nvarchar(50),
 Gender nvarchar(50),
 Salary int
)
GO

Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values ('Mark', 'Hastings', 'Male', 60000)
Insert into Employees values ('Steve', 'Pound', 'Male', 45000)
Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values ('Philip', 'Hastings', 'Male', 45000)
Insert into Employees values ('Mary', 'Lambeth', 'Female', 30000)
Insert into Employees values ('Valarie', 'Vikings', 'Female', 35000)
Insert into Employees values ('John', 'Stanmore', 'Male', 80000)

select * from employees order by salary desc


select max(salary) from employees
where salary < (select max(salary) from Employees)

-- How to find nth highest salary using a subquery

select top 1 salary from(
select distinct top 3 salary
from Employees
order by Salary desc)
Result
order by salary 

--How to find nth highest salary using a CTE

with result as (
select salary,
DENSE_RANK() over(order by salary desc) as DENSERANK
from Employees)
select top 1 salary
from result
where result.DENSERANK = 2