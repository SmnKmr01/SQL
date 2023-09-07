--Employees hired in last n months

Create table Employees
(
	ID int primary Key identity,
	FirstName nvarchar(50),
	LastName nvarchar(50),
	Gender nvarchar(50),
	Salary int,
	HireDate DateTime
)
Go
truncate  table EMployees
Insert into Employees values('Mark', 'Hastings', 'Male', 60000, '5/10/2023')
Insert into Employees values ('Steve', 'Pound', 'Male', 45000, '4/20/2023')
Insert into Employees values ('Ben', 'Hoskins', 'Male', 70000, '4/5/2023')
Insert into Employees values ('Philip', 'Hastings', 'Male', 45000, '3/11/2023')
Insert into Employees values ('Mary', 'Lambeth', 'Female', 30000, '3/10/2023')
Insert into Employees values ('Valarie', 'Vikings', 'Female', 35000, '12/9/2022')
Insert into Employees values ('John', 'Stanmore', 'Male', 80000, '2/22/2022')
Insert into Employees values ('Able', 'Edward', 'Male', 5000, '1/22/2023')
Insert into Employees values ('Emma', 'Nan', 'Female', 5000, '1/14/2022')
Insert into Employees values ('Jd', 'Nosin', 'Male', 6000, '1/10/2023')
Insert into Employees values ('Todd', 'Heir', 'Male', 7000, '2/14/2023')
Insert into Employees values ('San', 'Hughes', 'Male', 7000, '3/15/2023') 
Insert into Employees values ('Nico', 'Night', 'Male', 6500, '4/19/2023')
Insert into Employees values ('Martin', 'Jany', 'Male', 5500, '5/23/2023') 
Insert into Employees values ('Mathew', 'Mann', 'Male', 4500, '6/23/2023')
Insert into Employees values ('Baker', 'Barn', 'Male', 3500, '7/23/2023')

select * from Employees

select * , DATEDIFF(MONTH, HireDate, GETDATE()) as Diff
from Employees
where DATEDIFF(MONTH, HireDate , GETDATE()) between 1 and 3
order by HireDate desc