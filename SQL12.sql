
select FirstName, LastName, Birthdate,
Case
When DateAdd(Year, Datediff(YY,Birthdate, GetDate()), Birthdate) > Getdate()
Then DateDiff(YY, Birthdate, GetDate()) -1
else
DateDiff(YY, Birthdate, GetDate()) end as Age
from DimEMployee
where Month(Birthdate) =11