

select * from employee

select value from string_split('Owens, Adam',',')

with Name_Cte as
(SELECT Employeeid, value,
ROW_NUMBER() over(partition by EmployeeID order by EmployeeID) as Rownum
from Employee
CROSS APPLY
string_split(Name,',')
)
SELECT EmployeeID, 
[1] AS LAST_NAME, [2] AS FIRST_NAME
FROM NAME_CTE
PIVOT
(MAX(VALUE)
For Rownum in ([1], [2])) as PVT