
Drop table Employees
Create Table Employees
(
	ID int identity primary key,
	Name nvarchar(50),
	DateOfBirth DateTIme
)
Go

Insert Into Employees values ('Tom', '2018-11-19 10:36:46.520')
Insert Into Employees values ('Sara', '2018-11-18 11:36:26.400')
Insert Into Employees values ('Bob', '2017-12-22 10:40:10.300')
Insert Into Employees values ('Alex', '2017-12-30 9:30:20.100')
Insert Into Employees values ('Charlie', '2017-11-25 7:25:14.700')
Insert Into Employees values ('David', '2017-10-09 8:26:14.800')
Insert Into Employees values ('Elsa', '2017-10-09 9:40:18.900')
Insert Into Employees values ('George', '2018-11-15 10:35:17.600')
Insert Into Employees values ('Mike', '2018-11-16 9:14:17.600')
Insert Into Employees values ('Nancy', '2018-11-17 11:16:18.600')

--Get all people who are born on a given date
Select Name, DateOfBirth, CAST(DateOfBirth as Date) as [Datepart]
from Employees
where CAST(DateOfBirth as Date)= '2017-10-09'

--Get all people who are borm between 2 given dates(Nov 1,2017 and Dec 31,2017)
Select Name, DateOfBirth, CAST(DateOfBirth as Date) as [Datepart]
from Employees
where CAST(DateOfBirth as Date) Between '2017-11-01' AND '2017-12-21'

--Get all people who are born on the same day & month excluding the year(9th October)
Select Name, DateOfBirth, CAST(DateOfBirth as Date) as [Datepart]
from Employees
where DAY(DateOfBirth)= 9 AND MONTH(DateOfBirth) =  10

--Get all people who are born yesterday
Select Name, DateOfBirth, CAST(DateOfBirth as Date) as [Datepart]
from Employees
where CAST(DateOfBirth as Date)= DATEADD(DAY, 1, CAST(GETDATE() AS DATE))

Select Name, DateOfBirth, CAST(DateOfBirth as Date) as [Datepart]
from Employees
where CAST(DateOfBirth as Date)
BETWEEN DATEADD(DAY, 7, CAST(GETDATE() AS DATE))
AND DATEADD(DAY, 1, CAST(GETDATE() AS DATE))