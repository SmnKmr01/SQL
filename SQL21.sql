--Detect anomalies where sales for a product are 50% lower than the average for that product

Tables : sales(product_id, sale_amount)

with product_stats as(
select product_id, AVG(sale_amount) as avg_sales
From sales
group by product_id
)
select s.product_id, s.sale_amount
from sales s
join product_stats ps on s.product_id = ps.product_id
where s.sale_amount < 0.5*ps.avg_sales