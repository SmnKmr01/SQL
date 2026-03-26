--Find employees hired last 30 days

SELECT *
FROM emp
WHERE hire_date>=
DATEADD(day,-30,GETDATE())