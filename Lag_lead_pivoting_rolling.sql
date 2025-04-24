

--1-> top 3 products by sales, top 3 employees by salaries, within cat/dept

 select * from emp
 order by department_id, salary desc

 select * from (
 select * ,
 ROW_NUMBER() over (partition by department_id order by salary desc) as rn
 , DENSE_RANK() over (partition by department_id order by salary desc) as rn_dense
 from emp) a
 where rn_dense <=2

 select * from superstore_orders$


 --top 5 products by sales
 with cte as(
 select category,Product_ID, sum(sales) as sales from superstore_orders$
 group by category,Product_ID
 )
 select * from(
 select *,
 row_number() over(partition by category order by sales desc) as rn 
 from cte ) a
 where rn <=5

 --2-yoy growth/products with current month sales more than previous months sales
 --lead/lag function
  

  with cte as (
  select category,year(order_date) as year_order, sum(sales) as sales
  from superstore_orders$
  group by category,year(order_date)
  )
  , cte2 as( select *,
  lag(sales, 1, sales) over (partition by category order by year_order) as previous_year_sales
  from cte)
  select *,
  (sales- previous_year_sales)*100/Previous_year_sales as yoy
  from cte2

  --3-> running/cumulative sales/rolling n months sales

  select order_id, order_date, product_id, sales from superstore_orders$

  with cte as (
  select category, year(order_date) as year_order, sum(sales) as sales
  from superstore_orders$
  group by category, year(order_date)
  )
  select * ,
  sum(sales) over(partition by category order by year_order) as cumulative_sales
  from cte


  --rolling 3 months sales, previous 2 months + current month
  jan 100, 100
  feb 200, 300
  mar 300, 600
  april 400, 900


  with cte as ( 
  select year(order_date) as year_order, month(order_date) as month_order_date , sum(sales) as sales
  from superstore_orders$
  group by year(order_date) , month(Order_Date)
  )
  select *,
  sum(sales) over(order by year_order, month_order_date rows between 2 preceding and current row) as cumulative_sales
  from cte

  --4-> pivoting -> convert rows into column -- year wise each category sales

  select year(order_date) as year_order
  , sum(case when category='Furniture' then sales else 0 end) as fur_sales
  , sum(case when category='Office Supplies' then sales else 0 end) as os_sales
  , sum(case when category='Technology' then sales else 0 end) as Technology_sales
  from superstore_orders$
  group by year(order_date)