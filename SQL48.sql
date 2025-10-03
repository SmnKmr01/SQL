--Revenue by Region and Product Category

SELECT region, category, SUM(amount) AS revenue FROM sales
JOIN products ON sales.product_id = products.product_id
Group by region, category