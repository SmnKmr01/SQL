


CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    manager_id INT
);

INSERT INTO projects (project_id, project_name, manager_id)
VALUES
(1, 'Sales Dashboard', 101),
(2, 'HR Analytics', 101),
(3, 'Finance Report', 101),
(4, 'Inventory System', 101),

(5, 'Customer Segmentation', 102),
(6, 'Marketing Analysis', 102),
(7, 'Campaign Dashboard', 102),

(8, 'Supply Chain Optimization', 103),
(9, 'Risk Analysis', 103),
(10, 'Forecast Model', 103),
(11, 'Data Warehouse', 103),
(12, 'ETL Optimization', 103);

select * from projects


--Find employees who manage more than 3 projects.


select manager_id, COUNT(distinct project_id) as no_of_projects
from projects
group by manager_id
Having COUNT(distinct project_id) > 3