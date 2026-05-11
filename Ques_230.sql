

-- Create Employees Table
CREATE TABLE Employees (
    Employee_ID INT PRIMARY KEY,
    Employee_Name VARCHAR(100),
    Manager_ID INT
);

-- Insert Sample Data
INSERT INTO Employees (Employee_ID, Employee_Name, Manager_ID)
VALUES
(1, 'John', NULL),      -- CEO
(2, 'Alice', 1),
(3, 'Bob', 1),
(4, 'David', 1),
(5, 'Emma', 2),
(6, 'Sophia', 2),
(7, 'Liam', 2),
(8, 'Noah', 3),
(9, 'Olivia', 3),
(10, 'James', 2);


select * from employees

--Find employees with the highest number of direct reports.

SELECT TOP 1
    Manager_ID,
    COUNT(*) AS Report_Count
FROM Employees
WHERE Manager_ID IS NOT NULL
GROUP BY Manager_ID
ORDER BY Report_Count DESC;