
--Write a solution to find managers with at least five direct reports.

CREATE TABLE Employee_ (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(10),
    managerId INT
);


INSERT INTO Employee_ (id, name, department, managerId) VALUES
(101, 'John',  'A', NULL),
(102, 'Dan',   'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy',   'A', 101),
(105, 'Anne',  'A', 101),
(106, 'Ron',   'B', 101);

select * from employee_


select 
from Employee_ e
join Employee_ m
on e.managerId = m.id


select name from Employee_
where id = (select id from Employee_ where managerId is null)

--OR---

SELECT m.name AS ManagerName
FROM Employee_ e
JOIN Employee_ m
    ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(e.id) >= 5;