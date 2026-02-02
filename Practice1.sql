CREATE TABLE Employees (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,
    EmpName VARCHAR(50),
    Email VARCHAR(100),
    Salary INT,
    Gender CHAR(1),
    DeptID INT NULL,
    ManagerID INT NULL,
    JoinDate DATE,
    CONSTRAINT FK_Dept FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
)
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL
)

INSERT INTO dbo.Departments (DeptID, DeptName)
VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Finance'),
(40, 'Sales')

INSERT INTO dbo.Employees (EmpName, Email, Salary, Gender, DeptID, ManagerID, JoinDate)
VALUES
('Amit',  'amit@gmail.com',  80000, 'M', 10, NULL, '2020-01-10'),
('Ravi',  'ravi@gmail.com',  60000, 'M', 10, 1,    '2021-03-15'),
('Neha',  'neha@gmail.com',  60000, 'F', 10, 1,    '2022-06-01'),
('Priya', 'priya@gmail.com', 50000, 'F', 20, NULL,'2019-08-20'),
('Karan', 'karan@gmail.com', 70000, 'M', 20, 4,   '2023-02-01'),
('Rohit', 'rohit@gmail.com', 90000, 'M', 30, NULL,'2018-11-11'),
('Sneha', 'sneha@gmail.com', 90000, 'F', 30, 6,   '2022-09-09'),
('Amit',  'amit@gmail.com',  80000, 'M', 10, 1,   '2023-01-01'), -- duplicate
('Vikas', 'vikas@gmail.com', 55000, 'M', NULL, 1, '2024-01-05'), -- no dept
('Pooja', 'pooja@gmail.com', 75000, 'F', 40, NULL,'2023-12-10'),
('Rahul', 'rahul@gmail.com', 75000, 'M', 40, 10,  '2024-01-15')

--Find the 2nd highest 

select MAX(salary) AS SecondHighestSalary
FROM employees
WHERE salary < (select MAX(salary) FROM employees)

--OR--

select distinct salary
FROm (
	select salary, DENSE_RANK() over (ORDER BY salary DESC) AS rnk
	FROM Employees
) t
where rnk = 2