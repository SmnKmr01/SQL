SELECT * from(
	select department, employee, salary
	from employees
)source_table
PIVOT(
	SUM(salary)
	For department IN (Sales, IT, HR)
) AS PivotTable


----or---

Select 
	Employees,
	SUM(CASE WHEN department = 'Sales' THEN Salary Else 0 END) AS Sales,
	SUM(CASE WHEN department = 'IT' THEN Salary Else 0 END) AS IT,
	SUM(CASE WHEN department = 'HR' THEN Salary Else 0 END) AS HR
FROM Employees
Group by Employees