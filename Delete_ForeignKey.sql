-- Write a SQl Query to Delete Parent Child Rows

create table Departments
(
	Id int primary key identity,
	[Name] nvarchar(50)
)
Go

Create table Employees
(
id int primary key identity,
[Name] nvarchar(50),
DeptId int foreign key references Departments(Id)
)
Go 

Insert into Departments values('IT')
Insert into Departments values('HR')
Go

Insert into Employees values('Mark', 1)
Insert into Employees values('Mary', 1)
Insert into Employees values('John', 2)
Insert into Employees values('Sara', 2)
Insert into Employees values('Steve', 2)
Go


select * from Departments
select * from Employees


Alter table Employees drop constraint PK__Employee__3213E83FB2F7A6B5

Alter table Employees
add constraint FK_Dept_Employees_Cascade_Delete
foreign key (DeptId) references Departments(Id) on delete cascade

delete  from Departments where Id = 1

--or

Begin Try
	Begin Tran

	Declare @DeptId int = 1


	--Delete First from Child Tables
	Delete from Employees where DeptId = @DeptId

	--Finally delete from parent table
	Delete from Departments where Id = @DeptId


	commit Tran
End Try

Begin Catch
	Rollback Tran
End Catch