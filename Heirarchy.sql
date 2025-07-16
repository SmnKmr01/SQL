

Create table Employees
(
 EmployeeID int primary key identity,
 EmployeeName nvarchar(50),
 ManagerID int foreign key references Employees(EmployeeID)
)
GO

Insert into Employees values ('John', NULL)
Insert into Employees values ('Mark', NULL)
Insert into Employees values ('Steve', NULL)
Insert into Employees values ('Tom', NULL)
Insert into Employees values ('Lara', NULL)
Insert into Employees values ('Simon', NULL)
Insert into Employees values ('David', NULL)
Insert into Employees values ('Ben', NULL)
Insert into Employees values ('Stacy', NULL)
Insert into Employees values ('Sam', NULL)
GO

Update Employees Set ManagerID = 8 Where EmployeeName IN ('Mark', 'Steve', 'Lara')
Update Employees Set ManagerID = 2 Where EmployeeName IN ('Stacy', 'Simon')
Update Employees Set ManagerID = 3 Where EmployeeName IN ('Tom')
Update Employees Set ManagerID = 5 Where EmployeeName IN ('John', 'Sam')
Update Employees Set ManagerID = 4 Where EmployeeName IN ('David')
GO

select * from Employees

Declare @ID int;
Set @ID = 7;

With EmployeeCTE AS
(
	Select EmployeeID, EmployeeName, ManagerID
	From Employees
	Where EmployeeID = @ID

	UNION ALL

	Select Employees.EmployeeID, Employees.EmployeeName, Employees.ManagerID
	From Employees
	Join EmployeeCTE
	on Employees.EmployeeID = EmployeeCTE.ManagerID
)

select E1.EmployeeName, ISNULL(E2.EmployeeName , 'No Boss') as ManagerName from EmployeeCTE E1
Left Join EmployeeCTE E2
on E1.ManagerID = E2.EmployeeID
