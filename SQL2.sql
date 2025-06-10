

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ManagerID INT NULL
);


INSERT INTO Employees (EmployeeID, FirstName, LastName, ManagerID) VALUES
(1, 'Adam', 'Owens', 3),
(2, 'Mark', 'Hopkins', NULL),
(3, 'Natasha', 'Lee', 2),
(4, 'Riley', 'Cooper', 5),
(5, 'Jennifer', 'Hudson', 2),
(6, 'David', 'Warner', 5);


select * from Employees

select Emp.FirstName + ' ' +Emp.LastName as Employee,
Mgr.FirstName +' ' + Mgr.LastName as Manager
from Employees Emp Inner JOin Employees Mgr
ON Emp.ManagerID = Mgr.EmployeeID