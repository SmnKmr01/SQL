CREATE TABLE Employees (
  id int PRIMARY KEY,
  name varchar(50) ,
  salary int ,
  managerid int 
);

INSERT INTO Employees (id,name, salary,managerid)
VALUES (1,'Joe', 70000,3),(2,'Henery',8000,4),(3,'Sam',60000,null),(4,'Max',90000,null);

select * from Employees

select e1.name as Employee
from Employees e1
LEFT JOIN Employees e2
ON e1.managerid = e2.id
where e1.salary > e2.salary

