select * from EmployeeDetails

select ID, [Name], [Gender], [Salary]
from
(select ID, Name as EName, Value
from EmployeeDetails) as source_table
PIVOT
(MAX(Value)
For
EName in ([Name],[Gender],[Salary]))
as PIVOT_TABLE
