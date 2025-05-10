Declare @ID int;
Set @ID = 7;

with EmployeeCTE AS
(
	--Anchor
	Select EmployeeId, EmployeeName, ManagerID
	from Employees
	where EmployeeId = @ID

	UNION ALL

	-- REcursive member
	Select Employees.EmployeeId, Employees.EmployeeName, Employees.ManagerID
	from Employees
	JOIN EmployeeCTE
	ON Employees.EmployeeID = EmployeeCTE.ManagerID
)

select E1.EmployeeName, ISNULL(E2.EmployeeName, 'No Boss') as ManagerName
from EmployeeCTE E1
LEFT JOIN EmployeeCTE E2
ON E1.ManagerID = E2.ManagerID