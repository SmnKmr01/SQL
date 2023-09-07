Create Table Departments
(
	DepartmentID int primary key,
	DepartmentName nvarchar(50)
)
Drop table employees
Create Table Employees
(
	EmployeeID int primary Key,
	EmployeeName nvarchar(50),
	DepartmentID int foreign key references Departments(DepartmentID)
)

Insert into Departments values (1, 'IT')
Insert into Departments values (2, 'HR')
Insert into Departments values (3, 'Payroll')

Insert into Employees values (1, 'Mark', 1)
Insert into Employees values (2, 'John', 1)
Insert into Employees values (3, 'Mike', 1)
Insert into Employees values (4, 'Mary', 2)
Insert into Employees values (5, 'Stacy', 3)

Select * from Departments
Select * from Employees
 
 select Top 1 DepartmentName, COUNT(*) as EmployeeCount
 from Employees
 JOIN Departments
on Employees.DepartmentID = Departments.DepartmentID
Group by DepartmentName
order by EmployeeCount DESC