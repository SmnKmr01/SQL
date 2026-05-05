

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    arrival_time TIME,
    scheduled_start_time TIME,
    attendance_date DATE
);

INSERT INTO Attendance (attendance_id, employee_id, arrival_time, scheduled_start_time, attendance_date) VALUES
(1, 101, '09:10:00', '09:00:00', '2025-01-01'), -- late
(2, 101, '09:05:00', '09:00:00', '2025-01-02'), -- late
(3, 102, '08:55:00', '09:00:00', '2025-01-01'), -- on time
(4, 102, '09:15:00', '09:00:00', '2025-01-02'), -- late
(5, 103, '09:30:00', '09:00:00', '2025-01-01'), -- late
(6, 103, '09:35:00', '09:00:00', '2025-01-02'), -- late
(7, 103, '09:40:00', '09:00:00', '2025-01-03'); -- late

select * from attendance

--Find the employee(s) with the highest number of late arrivals


SELECT TOP 1 employee_id, COUNT(*) AS late_count
FROM Attendance
WHERE arrival_time > scheduled_start_time
GROUP BY employee_id
ORDER BY late_count DESC;