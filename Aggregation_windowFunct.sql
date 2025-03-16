--how to use group by and rank(window function together)
--will understand with a question where we need to find top 5 products in each category by sales

select * from orders

with sales_value as (
select category, Product_name, sum(sales) as total_sales from orders
group by category, product_name)
select * from(
select * 
, rank() over(partition by category order by total_sales desc) as rn
from sales_value ) A
where rn <=5

selecT * from (
select category, prduct_name, sum(sales) by total_sales
, eank() over( partition by category order by sum(sales) desc) as rn 
from orders
group by category, product_name
) A
where rn<=5