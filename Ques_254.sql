
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT
);

CREATE TABLE projectss (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT
);

CREATE TABLE project_assignments (
    assignment_id INT PRIMARY KEY,
    employee_id INT,
    project_id INT
);

-- Employees
INSERT INTO employees (id, name, department_id) VALUES
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', 10),
(4, 'David', 30);

-- Projects
INSERT INTO projectss (project_id, project_name, department_id) VALUES
(101, 'Project A', 10),
(102, 'Project B', 20),
(103, 'Project C', 30),
(104, 'Project D', 40);

-- Project Assignments
INSERT INTO project_assignments (assignment_id, employee_id, project_id) VALUES
(1, 1, 101), -- same dept
(2, 1, 102), -- different dept
(3, 2, 102), -- same dept
(4, 3, 103), -- different dept
(5, 4, 101); -- different dept


Select * from employees
Select * from projectss
Select * from project_assignments


--Find employees who have been assigned projects outside their department.

SELECT DISTINCT e.id, e.name
FROM employees e
left JOIN project_assignments pa ON e.id = pa.employee_id
left JOIN projectss p ON pa.project_id = p.project_id
WHERE e.department_id <> p.department_id