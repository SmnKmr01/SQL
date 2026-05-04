

CREATE TABLE work_logs (
    id INT IDENTITY(1,1) PRIMARY KEY,
    employee_id INT,
    work_date DATE,
    hours_worked DECIMAL(5,2)
);

INSERT INTO work_logs (employee_id, work_date, hours_worked) VALUES
-- Employee 1 (worked > 40 hours)
(1, '2026-04-01', 8),
(1, '2026-04-02', 9),
(1, '2026-04-03', 8),
(1, '2026-04-04', 10),
(1, '2026-04-05', 7),

-- Employee 2 (worked <= 40 hours)
(2, '2026-04-01', 6),
(2, '2026-04-02', 7),
(2, '2026-04-03', 8),
(2, '2026-04-04', 5),
(2, '2026-04-05', 6),

-- Employee 3 (worked > 40 hours)
(3, '2026-04-01', 9),
(3, '2026-04-02', 9),
(3, '2026-04-03', 9),
(3, '2026-04-04', 8),
(3, '2026-04-05', 7);


select * from work_logs

--Find employees who have worked more than 40 hours in a week.


WITH weekly_hours AS (
    SELECT 
        employee_id,
        DATEADD(WEEK, DATEDIFF(WEEK, 0, work_date), 0) AS week_start,
        SUM(hours_worked) AS total_hours
    FROM work_logs
    GROUP BY 
        employee_id,
        DATEADD(WEEK, DATEDIFF(WEEK, 0, work_date), 0)
)
SELECT employee_id, week_start, total_hours
FROM weekly_hours
WHERE total_hours > 40;