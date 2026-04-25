

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE
);

INSERT INTO projects (project_id, project_name, start_date, end_date) VALUES
(1, 'Project A', '2024-01-01', '2024-01-10'),  -- 9 days
(2, 'Project B', '2024-02-01', '2024-03-01'),  -- 29 days
(3, 'Project C', '2024-01-15', '2024-04-15'),  -- 91 days
(4, 'Project D', '2024-03-01', '2024-03-20'),  -- 19 days
(5, 'Project E', '2024-01-01', '2024-06-01'),  -- 152 days
(6, 'Project F', '2024-02-10', '2024-02-25'),  -- 15 days
(7, 'Project G', '2024-01-01', '2024-12-31'),  -- 365 days
(8, 'Project H', '2024-05-01', '2024-08-01'),  -- 92 days
(9, 'Project I', '2024-06-01', '2024-06-20'),  -- 19 days
(10, 'Project J', '2024-07-01', '2024-09-15'); -- 76 days

select * from projects

--Find the top 5 longest projects.

select top(5)
project_id,
project_name,
datediff(day, start_date, end_date) as duration
from projects
order by duration desc