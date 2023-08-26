-- Write a query to provide the data for nth occurrence of Sunday in future from given data
--datepart
--sunday-1
--monday-2
--friday-6
--saturday-7

declare @today_date  date;
declare @n int;
set @today_date = '2022-01-01'; --saturday
set @n = 3 

declare @day_week int;
set @day_week= (select datepart(weekday, @today_date))

declare @fisrtsunday date;
set @fisrtsunday = (select dateadd(day, 8 - @day_week, @today_date))

declare @nth_sunday date;
set @nth_sunday = (select dateadd(week, @n-1 , @fisrtsunday))
select @nth_sunday

--select dateadd(week,@n-1,dateadd(day, 8 - datepart(weekday, @today_date), @today_date))


