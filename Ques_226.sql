--Find employees who have not been assigned to any project in the last year.
SELECT e.*
FROM employees e
LEFT JOIN project_assignments pa ON e.id =
pa.employee_id AND pa.assignment_date >=
CURRENT_DATE - INTERVAL '1 year'
WHERE pa.project_id IS NULL