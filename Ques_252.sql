

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    department_id INT,
    status VARCHAR(20),
    completion_date DATE
);

INSERT INTO projects VALUES
-- Dept 1
(1, 1, 'Completed', '2024-01-15'),
(2, 1, 'Completed', '2024-03-10'),
(3, 1, 'Completed', '2024-05-20'),

-- Dept 2
(4, 2, 'Completed', '2024-02-11'),
(5, 2, 'Completed', '2024-04-01'),

-- Dept 3 (highest completed)
(6, 3, 'Completed', '2024-01-05'),
(7, 3, 'Completed', '2024-02-07'),
(8, 3, 'Completed', '2024-06-12'),
(9, 3, 'Completed', '2024-09-18'),

-- Not completed / different year
(10, 3, 'In Progress', '2024-10-10'),
(11, 2, 'Completed', '2025-01-01');


select * from projects

--Find the department with the most projects completed last year.




SELECT TOP 1 WITH TIES 
    department_id,
    COUNT(*) AS completed_projects
FROM projects
WHERE status = 'Completed'
  AND completion_date >= DATEFROMPARTS(YEAR(GETDATE()) - 1, 1, 1)
  AND completion_date <  DATEFROMPARTS(YEAR(GETDATE()), 1, 1)
GROUP BY department_id
ORDER BY completed_projects DESC