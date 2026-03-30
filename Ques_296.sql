CREATE TABLE work_logs (
    log_id INT PRIMARY KEY,
    employee_id INT,
    work_date DATE,
    hours_worked DECIMAL(5,2)
);

INSERT INTO work_logs (log_id, employee_id, work_date, hours_worked) VALUES
(1, 101, '2026-03-23', 8),
(2, 101, '2026-03-24', 7.5),
(3, 101, '2026-03-25', 8),
(4, 101, '2026-03-27', 6),

(5, 102, '2026-03-23', 9),
(6, 102, '2026-03-24', 8),
(7, 102, '2026-03-26', 7),

(8, 101, '2026-03-30', 8),
(9, 101, '2026-03-31', 8),
(10, 102, '2026-03-30', 7.5),
(11, 102, '2026-04-01', 8);

--Get total working hours per employee per week



SELECT 
    employee_id,
    DATEADD(WEEK, DATEDIFF(WEEK, 0, work_date), 0) AS week_start,
    SUM(hours_worked) AS total_hours
FROM work_logs
GROUP BY 
    employee_id,
    DATEADD(WEEK, DATEDIFF(WEEK, 0, work_date), 0)
ORDER BY employee_id, week_start;