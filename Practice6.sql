--Write a Query to find Top N Highest Grossing Products per category

WITH ranked_products AS (
	SELECT 
		category_id,
		product_id,
		SUM(revenue) AS total_revenue,
		DENSE_RANK() OVER (PARTITION BY category_id ORDER BY SUM(revenue) DESC) AS rnk
	FROM sales
	Group BY category_id, product_id
	)
	SELECT category_id, product_id, total_revenue
	FROM ranked_products
	WHER rnk <= N