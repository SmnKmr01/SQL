--Nth Highest

Create table Employees
(
 ID int primary key identity,
 FirstName nvarchar(50),
 LastName nvarchar(50),
 Gender nvarchar(50),
 Salary int
)


Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values ('Mark', 'Hastings', 'Male', 60000)
Insert into Employees values ('Steve', 'Pound', 'Male', 45000)
Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000)
Insert into Employees values ('Philip', 'Hastings', 'Male', 45000)
Insert into Employees values ('Mary', 'Lambeth', 'Female', 30000)
Insert into Employees values ('Valarie', 'Vikings', 'Female', 35000)
Insert into Employees values ('John', 'Stanmore', 'Male', 80000)

--Simply using MAX() function
select MAX(Salary) from EMployees

--Sub-query along with MAX Function
select MAX(Salary) from Employees
where Salary < (select MAX(Salary) from Employees)

--TO find nth highest salary using Sub-Query
Select TOP 1 Salary from
(Select DISTINCT TOP 3 Salary
From EMployees
Order BY Salary Desc)
Result
Order By Salary

--TO find nth highest salary using CTE
With Result as(
	select Salary, 
		DENSE_RANK() OVER (Order by salary DESC) as DENSERANK
	From Employees
)
Select Top 1 Salary 
From Result
Where DENSERANK = 3

