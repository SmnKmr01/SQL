--ROlling calculations SUM, AVG, MIN, MAX

select * from superstore_orders$

with year_month_sales as (
select datepart(year, order_date) as year_order, datepart(month, order_date) as month_order, sum(sales) as sales 
from superstore_orders$
group by datepart(year, order_date), datepart(month, order_date)
)
select* 
, sum(Sales) over(order by year_order asc, month_order asc rows between 1 preceding and 1 following) as rolling_sum
, sum(Sales) over(order by year_order asc, month_order  asc rows between 1 preceding and 1 following) as rolling_sum
, sum(Sales) over(order by year_order asc, month_order  asc rows between 1 preceding and 1 following) as rolling_sum
, sum(Sales) over(order by year_order asc, month_order asc rows  between 1 preceding and 1 following) as rolling_sum
from year_month_sales