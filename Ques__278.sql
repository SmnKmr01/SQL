---Find the average salary for each job title withineach department.
SELECT department_id, job_title, AVG(salary) AS
avg_salary
FROM employees
GROUP BY department_id, job_title