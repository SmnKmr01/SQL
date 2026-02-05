SELECT *
FROM dbo.Employees
WHERE JoinDate >= DATEADD(DAY, -30, GETDATE());