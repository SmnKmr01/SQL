Select department, category, salary
from (
	Select department, sales, IT, HR
	from Employees
) SourceTable
UNPIVOT(
	salary For category IN(Sales, IT, HR)
) AS UnpivotTable

----or-

SELECT department, 'Sales' AS category, Sales AS salary FROM employees
UNION ALL
SELECT department, 'IT', IT FROM employees
UNION ALL
SELECT department, 'HR', HR FROM employees;