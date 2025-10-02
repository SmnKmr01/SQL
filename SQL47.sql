--Products never sold
SELECT product_id, product_name
From products
where product_id NOT IN(
	select distinct product_id FROM sales)