

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE timesheets (
    timesheet_id INT PRIMARY KEY,
    employee_id INT,
    timesheet_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO employees (id, name) VALUES
(1, 'John'),
(2, 'Alice'),
(3, 'Bob'),
(4, 'Emma'),
(5, 'David');

INSERT INTO timesheets (timesheet_id, employee_id, timesheet_date) VALUES
(101, 1, '2026-04-20'),  -- submitted within last month
(102, 2, '2026-03-10'),  -- older than last month
(103, 3, '2026-04-15'),  -- submitted within last month
(104, 4, '2026-02-28');  -- older than last month

select * from employees
select * from timesheets

--Find employees who have not submitted their timesheets in the last month


SELECT e.id, e.name
FROM employees e
LEFT JOIN timesheets t 
    ON e.id = t.employee_id
    AND t.timesheet_date >= DATEADD(MONTH, -1, GETDATE())
WHERE t.timesheet_id IS NULL;