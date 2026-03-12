CREATE TABLE Department (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    departmentId INT,
    FOREIGN KEY (departmentId) REFERENCES Department(id)
);

INSERT INTO Department (id, name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO Employee (id, name, salary, departmentId) VALUES
(1, 'Joe', 70000, 1),
(2, 'Jim', 90000, 1),
(3, 'Henry', 80000, 2),
(4, 'Sam', 60000, 2),
(5, 'Max', 90000, 1);

select * from Employee
select * from Department
with cte as(
select e.name as Employee, e.salary, d.name as department,
MAX(e.salary) OVER(PARTITION BY e.departmentId) AS max_salary
from employee e
left join department d
on e.departmentId = d.id
)
select Department, Employee, salary
from cte 
where salary = max_salary


--or--
with cte as(
select e.name as Employee, e.salary, d.name as department,
DENSE_RANK() over(PARTITION BY e.departmentId order by e.salary desc) AS rnk
from employee e
left join department d
on e.departmentId = d.id
)
select Department, Employee, salary
from cte
where rnk = 1