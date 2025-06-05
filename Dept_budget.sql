CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50),
    Budget DECIMAL(10,2)
);


INSERT INTO Department (DeptID, DeptName, Budget) VALUES
(1, 'HR', 200000),
(2, 'IT', 500000),
(3, 'Finance', 300000);

SELECT e.Name, e.Department, d.Budget,
    CASE
        WHEN d.Budget > 400000 THEN 'Rich Department'
        WHEN d.Budget BETWEEN 200000 AND 400000 THEN 'Moderate'
        ELSE 'Low Budget'
    END AS BudgetCategory
FROM Employees e
JOIN Department d ON e.Department = d.DeptName;