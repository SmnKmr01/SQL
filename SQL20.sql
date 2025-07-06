--FInd the top 2 highest-selling products for each category

tables: sales(Product_id, sale_amount), products(product_id, category)

with ranked_sales AS(
select 
p.category,
s.product_id,
SUM(s.sale_amount) AS total_sales,
RANK() OVER (Partition by p.category ORDER BY SUM(s.sale_amount) Desc) As rank
from sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category, s.product_id)
SELECT category, product_id, total_sales
FROM ranked_sales
WHERE rank <=2
