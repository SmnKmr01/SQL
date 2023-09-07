Create table Employee
(
 EmployeeID int primary key identity,
 EmployeeName nvarchar(50),
 ManagerID int foreign key references Employee(EmployeeID)
)
GO

Insert into Employee values ('John', NULL)
Insert into Employee values ('Mark', NULL)
Insert into Employee values ('Steve', NULL)
Insert into Employee values ('Tom', NULL)
Insert into Employee values ('Lara', NULL)
Insert into Employee values ('Simon', NULL)
Insert into Employee values ('David', NULL)
Insert into Employee values ('Ben', NULL)
Insert into Employee values ('Stacy', NULL)
Insert into Employee values ('Sam', NULL)
GO

Update Employee Set ManagerID = 8 Where EmployeeName IN ('Mark', 'Steve', 'Lara')
Update employee Set ManagerID = 2 Where EmployeeName IN ('Stacy', 'Simon')
Update Employee Set ManagerID = 3 Where EmployeeName IN ('Tom')
Update Employee Set ManagerID = 5 Where EmployeeName IN ('John', 'Sam')
Update Employee Set ManagerID = 4 Where EmployeeName IN ('David')

select * from Employee

Declare @ID int;
Set @ID = 7;

with EmployeeCTE as
(
	Select EmployeeID, EmployeeName, ManagerID
	From Employee
	Where EmployeeID = @ID

	Union All

	Select Employee.EmployeeID, Employee.EmployeeName, Employee.ManagerID
	From Employee
	Join EmployeeCTE
	on EMployee.EmployeeID = EmployeeCTE.ManagerID
)
select E1.EmployeeName, ISNULL(E2.EmployeeName, 'No Boss') as ManagerName
from EmployeeCTE E1
Left Join EmployeeCTE E2
on E1.ManagerID = E2.EmployeeID
	