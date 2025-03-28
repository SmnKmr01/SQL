create table students  (
student_id int,
skill varchar(20)
);
delete from students;
insert into students values
(1,'sql'),(1,'python'),(1,'tableau'),(2,'sql'),(3,'sql'),(3,'python'),(4,'tableau'),(5,'python'),(5,'tableau');

SELECT student_id
FROM students
GROUP BY student_id
HAVING COUNT(DISTINCT skill) = 2
AND SUM(CASE WHEN skill = 'sql' OR skill = 'python' THEN 1 ELSE 0 END) = 2;


with cte as (
SELECT student_id AS student_id,
     [python], [sql], [tableau]
FROM (
    SELECT student_id,
        skill
    FROM students
) AS SourceTable
PIVOT (
    min(skill) FOR skill IN
    ([python], [sql], [tableau])
) AS PivotTable
)
select student_id from cte where tableau is null and python is not null and sql is not null