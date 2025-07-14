--Replicate Functions
select Replicate('Pragim', 3)
select FirstName, LastName,
	SUBSTRING(Email, 1,2) + REPLICATE('*',5) +
	SUBSTRING(Email,CHARINDEX('@', Email) +1,len(Email) - CHARINDEX('@', Email)+1) as Email
from Employees


--SPACE() function
select FirstName + SPACE(5) + LastName as FullName
from Employees

--PATINDEX Function
	select Email, PATINDEX('%@aaa.com', Email) as EMAIL_Pat
	from Employees
	where PATINDEX('%@aaa.com', Email) > 0

--REPLACE Func
select Email, REPLACE(Email, '.com', '.net') as convertedEmail
from Employees

--STUFF funct
select FirstName, LastName , Email,
	STUFF(Email, 2, 3, '*****') as StuffedEmail
from Employees
