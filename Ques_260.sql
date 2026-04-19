
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);

CREATE TABLE project_assignments (
    assignment_id INT PRIMARY KEY,
    employee_id INT,
    project_id INT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO projects (project_id, project_name) VALUES
(1, 'Project A'),
(2, 'Project B'),
(3, 'Project C');

INSERT INTO project_assignments (assignment_id, employee_id, project_id) VALUES
-- Employee 1 → worked on ALL projects ✅
(1, 101, 1),
(2, 101, 2),
(3, 101, 3),

-- Employee 2 → only 2 projects ❌
(4, 102, 1),
(5, 102, 2),

-- Employee 3 → ALL projects (with duplicate) ✅
(6, 103, 1),
(7, 103, 2),
(8, 103, 3),
(9, 103, 1),

-- Employee 4 → only 1 project ❌
(10, 104, 2);


select * from projects
select * from project_assignments

--Find employees who worked on all projects in the company



select pa.employee_id
from projects p
left join project_assignments pa
on p.project_id = pa.project_id
group by pa.employee_id
HAVING COUNT(DISTINCT pa.project_id) = (select COUNT(distinct project_id) from projects)


