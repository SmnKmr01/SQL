--Write a SQL query to find employee_ids who, in thw last 2 months, logged in at atleast 3 times within the same week


CREATE TABLE employee_login (
    employee_id INT,
    login_ts    DATETIME
);

INSERT INTO employee_login (employee_id, login_ts) VALUES
(1, '2025-06-18 08:00:00'),
(1, '2025-07-18 08:00:00'),
(1, '2025-07-20 09:00:00'),
(1, '2025-07-21 10:00:00'),
(1, '2025-12-14 08:00:00'),
(1, '2025-12-15 08:00:00'),
(1, '2025-12-16 08:00:00'),
(2, '2025-09-11 08:00:00'),
(2, '2025-09-12 09:00:00'),
(2, '2025-12-01 08:00:00');

select * from employee_login


select employee_id, week_no, count(*) as cnt
from (
select *,
DATEDIFF(month, login_ts, GETDATE()) as month_diff,
DATEPART(week, login_ts) as week_no
from employee_login) A
where DATEDIFF(month, login_ts, GETDATE()) <=2 
group by employee_id, week_no
Having count(*) >= 3