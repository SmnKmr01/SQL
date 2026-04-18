--Find the average tenure of employees bydepartment.
SELECT department_id, AVG(DATE_PART('year',
CURRENT_DATE - hire_date)) AS avg_tenure_years
FROM employees
GROUP BY department_id;