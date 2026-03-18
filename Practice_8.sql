 --yoy growth/products with current month sales more than previous month sales

 select * from orders


 with cte as(
 select category, year(order_date) as year_order, sum(sales) as sales
 from orders
 group by category,year(order_date)
 --order by category,year(order_date)
 )
 , cte2 as(select * 
 ,lag(sales,1, sales) over(partition by category order by year_order) as previous_year_sales
 from cte)
 select *,
 (sales - previous_year_sales)*100/previous_year_sales as yoy
 from cte2



  with cte as(
 select category, month(order_date) as month_order,year(order_date) as year, sum(sales) as sales
 from orders
 group by category,month(order_date), year(order_date)
 --order by category,year(order_date)
 )
 , cte2 as(select * 
 ,lag(sales,1, sales) over(partition by category order by year,month_order asc) as previous_month_sales
 from cte)
 select *,
 (sales - previous_month_sales)*100/previous_month_sales as mom
 from cte2