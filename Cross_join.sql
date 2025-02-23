---cross join 

select * from products
select * from colors
select * from sizes

select * from products, colors
---use case 1 : prepare master data 
select * from transactions

select product_name,color, size, sum(amount) as total_amount
from  transactions
group by product_name, color, size



WITH master_data AS (
    SELECT 
        p.name AS product_name, 
        c.color, 
        s.size 
    FROM 
        products p, 
        colors c, 
        sizes s
),
sales AS ( 
    SELECT 
        product_name, 
        color, 
        size, 
        SUM(amount) AS total_amount
    FROM 
        transactions
    GROUP BY 
        product_name, color, size
)
SELECT 
    md.product_name, 
    md.color, 
    md.size, 
    ISNULL(s.total_amount, 0) AS total_amount
FROM 
    master_data md
    LEFT JOIN sales s 
    ON md.product_name = s.product_name 
    AND md.color = s.color 
    AND md.size = s.size
ORDER BY 
    total_amount;

	---use case 2 : prepare large no of rows for performance testing

	select * into transactions_test from transactions where 1=2

	select ROW_NUMBER() over(order by t.order_id) as order_id,t.product_name, t.color
	, case when ROW_NUMBER() over(order by t.order_id)%3 =0 then 'L' else 'XL' end size
	,t.amount from transactions t, master..orders o, transactions t1