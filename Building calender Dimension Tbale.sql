/*
The stored procedure sp_create_calendar_dim_table is 
to generate a calendar dimension table (cal_dim_new) containing a range of dates between the specified start and end dates
as parameters.
*/

-- Creation of Sp : sp_create_calender_dim_table
CREATE PROCEDURE sp_create_calender_dim_table
	@start_date date,
	@end_date date
as
BEGIN
	with recursive_cte as (
		Select @start_date as cal_date

		union all

		Select dateadd(dd,1,cal_date) as cal_date
		from recursive_cte
		where cal_date < @end_date
	)
	Select row_number() over(order by (select null)) as id, cal_date,
	datepart(year,cal_date) as cal_year,
	datepart(dayofyear,cal_date) as cal_year_day,
	datepart(quarter,cal_date) as cal_quarter, 
	datepart(month,cal_date) as cal_month,
	datename(month,cal_date) as cal_month_name,
	datepart(day,cal_date) as cal_month_day,
	datepart(week,cal_date) as cal_week,
	datepart(weekday,cal_date) as cal_week_day,
	datename(weekday,cal_date) as cal_day_name
	into cal_dim_new
	from recursive_cte 
	option (maxrecursion 0)
END;

-- Execute Sp : sp_create_calender_dim_table
EXEC sp_create_calender_dim_table @start_date = '2000-01-01', @end_date = '2050-12-31' 

-- Check the cal_dim_new table
Select * from cal_dim_new

WITH cte AS (
-- Anchor member
SELECT
CAST('2022-01-01' AS DATE) AS cal_date,
Datepart(YEAR(CAST('2022-01-01' AS DATE))) AS cal_year,
Datepart(DAYOFYEAR(CAST('2022-01-01' AS DATE))) AS cal_year_day,
Datepart(QUARTER(CAST('2022-01-01' AS DATE))) AS cal_quarter,
Datepart(MONTH(CAST('2022-01-01' AS DATE))) AS cal_month,
Datepart(MONTHNAME(CAST('2022-01-01' AS DATE))) AS cal_month_name,
Datepart(DAY(CAST('2022-01-01' AS DATE))) AS cal_month_day,
Datepart(WEEK(CAST('2022-01-01' AS DATE))) AS cal_week,
Datepart(DAYOFWEEK(CAST('2022-01-01' AS DATE))) AS cal_week_day,
Datepart(DAYNAME(CAST('2022-01-01' AS DATE))) AS cal_day_name
UNION ALL
-- Recursive member
SELECT
datepart(day,1,cal_date) as cal_year,
datepart(year,1, cal_date) as cal_year,
	datepart(dayofyear,1, cal_date) as cal_year_day,
	datepart(quarter,1, cal_date) as cal_quarter, 
	datepart(month,1,cal_date) as cal_month,
	datename(month,1,cal_date) as cal_month_name,
	datepart(day,1,cal_date) as cal_month_day,
	datepart(week,1,cal_date) as cal_week,
	datepart(weekday,1,cal_date) as cal_week_day,
	datename(weekday,1,cal_date) as cal_day_name
FROM cte
WHERE cal_date < CAST('2025-01-10' AS DATE)
)
select * from calender_dim;