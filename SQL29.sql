--Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

select p.project_id, 
    ROUND(SUM(e.experience_years)*1.0/COUNT(p.employee_id),2) as average_years
from project p
left join Employee e
on p.employee_id = e.employee_id 
group by p.project_id


--OR--

SELECT project_id, ROUND(AVG(1.0 * experience_years), 2) AS average_years
FROM Project p
JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY project_id