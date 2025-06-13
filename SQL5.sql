CREATE TABLE sales (
    MonthName VARCHAR(20),
    Sales INT
);

-- Insert the data
INSERT INTO sales (MonthName, Sales) VALUES
('April', 2000),
('January', 3000),
('March', 5000),
('May', 2000),
('February', 2500),
('October', 2000),
('June', 3000),
('August', 5000),
('September', 2000),
('July', 2500),
('December', 2000);

select * from sales
order by case
when MonthName = 'January' then 1
when MonthName = 'February' then 2
when MonthName = 'March' then 3
when MonthName = 'April' then 4
when MonthName = 'May' then 5
when MonthName = 'June' then 6
when MonthName = 'July' then 7
when MonthName = 'August' then 8
when MonthName = 'September' then 9
when MonthName = 'October' then 10
when MonthName = 'November' then 11
when MonthName = 'December' then 12
else Null end

