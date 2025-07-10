select ASCII('A')
select ASCII('a')
select ASCII('0')

select CHAR(65)

Declare @start int
set @start =65
while(@start <=90)
Begin
	Select char(@start)
	set @start = @start + 1
End

Declare @start int
set @start =97
while(@start <=122)
Begin
	Select char(@start)
	set @start = @start + 1
End

Declare @start int
Set @start = 48
WHile (@start <= 57)
Begin
	select char(@start)
	set @start = @start +1 
End

select '      Hello'

select RTRIM('Hello   ')

select * from Employees

select Upper(FirstName) as FirstName, MiddleName, LOWER(LastName) as LastName from Employees 

select LTRIM(FirstName) as FirstName, MiddleName, LastName,
FirstName + ' ' +MiddleName + ' '+ LastName
from Employees 

select Reverse(FirstName) as REverse from Employees

select Len(LastName) from Employees