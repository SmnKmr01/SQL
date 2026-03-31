
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO sales (sale_id, product_id, sale_date, amount) VALUES
-- January
(1, 101, '2024-01-02', 500),
(2, 101, '2024-01-10', 300),
(3, 102, '2024-01-05', 700),
(4, 102, '2024-01-15', 200),
(5, 103, '2024-01-20', 900),

-- February
(6, 101, '2024-02-02', 400),
(7, 101, '2024-02-05', 600),
(8, 102, '2024-02-07', 300),
(9, 103, '2024-02-10', 1200),

-- March
(10, 101, '2024-03-01', 800),
(11, 102, '2024-03-03', 200),
(12, 102, '2024-03-05', 500),
(13, 103, '2024-03-07', 1000);

select * from sales

--Find the product with the highest sales for each month.






WITH monthly_sales AS (
    SELECT 
        product_id,
        DATEFROMPARTS(YEAR(sale_date), MONTH(sale_date), 1) AS month,
        SUM(amount) AS total_sales
    FROM sales
    GROUP BY 
        product_id,
        DATEFROMPARTS(YEAR(sale_date), MONTH(sale_date), 1)
),
ranked_sales AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY month
               ORDER BY total_sales DESC
           ) rn
    FROM monthly_sales
)
SELECT *
FROM ranked_sales
WHERE rn = 1;