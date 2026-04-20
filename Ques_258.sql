

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    amount INT
);

INSERT INTO sales (sale_id, product_id, amount) VALUES
(1, 101, 100),
(2, 101, 200),

(3, 102, 300),
(4, 102, 400),

(5, 103, 150),

(6, 104, 500),
(7, 104, 600),

(8, 105, 50);

select * from sales

--Find products with sales revenue above the average revenue per product





WITH avg_revenue AS (
    SELECT AVG(total_revenue) AS avg_rev
    FROM (
        SELECT product_id, SUM(amount) AS total_revenue
        FROM sales
        GROUP BY product_id
    ) sub
)
SELECT product_id, SUM(amount) AS total_revenue
FROM sales
GROUP BY product_id
HAVING SUM(amount) > (SELECT avg_rev FROM avg_revenue)


-- 

SELECT product_id, SUM(amount) AS total_revenue
FROM sales
GROUP BY product_id
HAVING SUM(amount) > (
    SELECT AVG(total_revenue)
    FROM (
        SELECT SUM(amount) AS total_revenue
        FROM sales
        GROUP BY product_id
    ) t
)