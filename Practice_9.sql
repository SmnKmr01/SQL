

--running/cumulative sales month wise / rolling n months sales

select order_id, order_date, product_id, sales from orders

with cte as(
 select category, year(order_date) as year_order, sum(sales) as sales
 from orders
 group by year(order_date)
 --order by year(order_date)
 )
 select *,
 sum(sales) over(order by year_order) as running_sales
 from cte

 select * from orders

 --pivoting -> convert rows into column--year wise wach category sales

 select year(order_date) as year_order
 , sum(case when category = 'Furniture' then sales else 0 end) as fur_sales
  , sum(case when category = 'Office Supplies' then sales else 0 end) as fur_sales
  , sum(case when category = 'Technology' then sales else 0 end) as fur_sales
 from orders
 group by year(order_Date)

