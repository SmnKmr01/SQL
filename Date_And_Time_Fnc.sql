CREATE TABLE date_functions_demo (
    id INT,
    start_date DATE,
    end_date DATE,
    created_at DATETIME,
    updated_at DATETIME,
    system_date VARCHAR(10)
);

INSERT INTO date_functions_demo (id,start_date, end_date, created_at, updated_at,system_date) VALUES 
(1,'2024-01-01', '2024-12-31', '2024-01-01 10:00:00', '2024-12-31 23:59:59','12/30/2024'),
(2,'2023-06-15', '2024-06-15', '2023-06-15 08:30:00', '2024-06-15 17:45:00','08/15/2024'),
(3,'2022-05-20', '2023-05-20', '2022-05-20 12:15:00', '2023-05-20 18:00:00','10/21/2024');


select * from date_functions_demo

1. GET Current Date and Time

select GETDATE() as CurrentDateTime
Select SYSDATETIME() as HighPrecisionDateTime
Select CURRENT_TIMESTAMP as ANSI_CurrentDateTime
Select GETUTCDATE() as UTCDateTime

2.Extract Parts of Date

SELEct
	YEAR(GETDATE())	AS YearPart,
	MONTH(GETDATE()) AS MonthPart,
	DAY(GETDATE()) AS DayPart,
	DATEPART(HOUR, GETDATE()) AS HourPart,
	DATEPART(MINUTE, GETDATE()) AS MinutePart

3.Add Or SUbtract Dates
SELECT
	DATEADD(DAY, 7, GETDATE()) as Add7days,
	DATEADD(MONTH, -1, GETDATE()) AS Subtract1Month

4.Difference between Two Dates
SELECT 
	DATEDIFF(DAY, '2025-01-01', GETDATE()) AS DaysDifference,
	DATEDIFF(YEAR, '2000-01-01', GETDATE()) AS YearsDifference

5.End of month
SELECT 
	EOMONTH(GETDATE()) AS EndOfThisMonth,
	EOMONTH(GETDATE(), 1) AS EndOfNextMonth

6.Format Date

SELECT FORMAT(GETDATE(), 'yyyy-MM-dd') as FormattedDate,
	FORMAT(GETDATE(),'dddd,MMMM dd, yyyy') as FullDateFormat

7.Convert DATE to String

SELECT
	CONVERT(VARCHAR, GETDATE(), 101) as MMDDYYYY_Format,
	CONVERT(VARCHAR, GETDATE(), 103) as DDMMYYYY_Format

8.CHECK Valid date
SELECT
	ISDATE('2025-05-05') as IsValidDate,
	ISDATE('InvalidDate') as IsInvalidDate