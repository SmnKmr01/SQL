--Write a SQL QUERY to find company name whose revenue increased every year



CREATE TABLE CompanyRevenue (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    CompanyName VARCHAR(100),
    Year INT,
    Revenue int
);

INSERT INTO CompanyRevenue (CompanyName, Year, Revenue) VALUES
('A', 2022, 100),
('A', 2023, 200),
('A', 2024, 150),
('B', 2022, 100),
('B', 2023, 200),
('B', 2024, 300),
('C', 2022, 200),
('C', 2023, 100),
('C', 2024, 300);

with cte as(
select *, lag(Revenue, 1, 0) over(partition by companyname order by companyname) as prev_year_revenue,
Revenue-lag(Revenue, 1, 0) over(partition by companyname order by companyname) as revenue_diff
from CompanyRevenue)
select COmpanyName, before_cntfrom cte where revenue_diff >0