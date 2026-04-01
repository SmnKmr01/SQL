
CREATE TABLE project_assignments (
    assignment_id INT PRIMARY KEY,
    employee_id INT,
    project_name VARCHAR(100),
    assignment_start_date DATE,
    assignment_end_date DATE
);

INSERT INTO project_assignments VALUES
(1, 101, 'Project Alpha', '2020-01-10', '2021-02-15'),
(2, 101, 'Project Beta',  '2021-03-01', '2023-05-20'),

(3, 102, 'Project Gamma', '2022-01-01', '2023-01-01'),

(4, 103, 'Project Delta', '2019-06-01', '2020-06-01'),
(5, 103, 'Project Omega', '2020-07-01', '2022-08-01'),

(6, 104, 'Project Zeta',  '2023-01-01', '2023-12-01');


select * from project_assignments

--Find employees who have worked on projects for more than 2 years.


select * from (
select *
from project_assignments
where DATEDIFF(year,assignment_start_date, assignment_end_date) >=2) a

-- or --
SELECT employee_id
FROM project_assignments
GROUP BY employee_id
HAVING DATEDIFF(YEAR, 
        MIN(assignment_start_date), 
        MAX(assignment_end_date)) > 2;