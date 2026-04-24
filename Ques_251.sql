

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE leaves (
    leave_id INT PRIMARY KEY,
    employee_id INT,
    leave_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

-- Employees
INSERT INTO employees (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva');

-- Leaves
INSERT INTO leaves (leave_id, employee_id, leave_date) VALUES
-- Alice (recent leave → should NOT appear)
(101, 1, DATEADD(MONTH, -2, GETDATE())),

-- Bob (old leave → should appear)
(102, 2, DATEADD(MONTH, -8, GETDATE())),

-- Charlie (no leave → should appear)

-- David (multiple leaves, one recent → should NOT appear)
(103, 4, DATEADD(MONTH, -7, GETDATE())),
(104, 4, DATEADD(MONTH, -1, GETDATE())),

-- Eva (only old leaves → should appear)
(105, 5, DATEADD(MONTH, -10, GETDATE()));

select * from employees
select * from leaves


--Find employees who have not taken any leave in the last 6 months.




SELECT e.id, e.name
FROM employees e
LEFT JOIN leaves l 
    ON e.id = l.employee_id
   AND l.leave_date >= DATEADD(MONTH, -6, GETDATE())
WHERE l.leave_id IS NULL