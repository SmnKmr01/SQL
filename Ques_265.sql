
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE attendance (
    attendance_id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT,
    attendance_date DATE,
    scheduled_start_time TIME,
    arrival_time TIME
);

INSERT INTO attendance (employee_id, attendance_date, scheduled_start_time, arrival_time) VALUES

-- Suman (always on time)
(1,'2025-01-01','09:00','08:55'),
(1,'2025-01-02','09:00','08:59'),

-- Rahul (late once)
(2,'2025-01-01','09:00','09:10'),
(2,'2025-01-02','09:00','08:50'),

-- Priya (always on time)
(3,'2025-01-01','09:00','09:00'),
(3,'2025-01-02','09:00','08:45'),

-- Amit (no attendance record)
-- should still appear because never late
(4,NULL,NULL,NULL);

INSERT INTO employees (id, name) VALUES
(1,'Suman'),
(2,'Rahul'),
(3,'Priya'),
(4,'Amit');

select * from employees
select * from attendance

--Find the employees who have never been late to work.



select e.id
from employees e
left join attendance a
on e.id = a.employee_id
where a.scheduled_start_time <= a.arrival_time
group by e.id


SELECT e.id, e.name
FROM employees e
LEFT JOIN attendance a 
    ON e.id = a.employee_id
    AND a.arrival_time > a.scheduled_start_time
WHERE a.employee_id IS NULL;