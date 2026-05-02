drop table sales

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO sales (sale_id, product_id, sale_date, amount) VALUES
-- Product 1 (Increasing trend)
(1, 101, '2026-01-10', 100),
(2, 101, '2026-02-15', 200),
(3, 101, '2026-03-20', 300),

-- Product 2 (Not increasing)
(4, 102, '2026-01-05', 300),
(5, 102, '2026-02-10', 200),
(6, 102, '2026-03-12', 250),

-- Product 3 (Increasing trend)
(7, 103, '2026-01-08', 150),
(8, 103, '2026-02-18', 250),
(9, 103, '2026-03-25', 350);

select * from sales

--Find products with an increasing sales trend over the last 3 months

WITH monthly_sales AS (
    SELECT 
        product_id,
        DATEFROMPARTS(YEAR(sale_date), MONTH(sale_date), 1) AS month,
        SUM(amount) AS total_sales
    FROM sales
    WHERE sale_date >= DATEADD(MONTH, -3, GETDATE())
    GROUP BY product_id, YEAR(sale_date), MONTH(sale_date)
),
sales_ranked AS (
    SELECT 
        product_id,
        month,
        total_sales,
        LAG(total_sales) OVER (PARTITION BY product_id ORDER BY month) AS prev_month_sales,
        LAG(total_sales, 2) OVER (PARTITION BY product_id ORDER BY month) AS prev_2_month_sales
    FROM monthly_sales
)
SELECT DISTINCT product_id
FROM sales_ranked
WHERE total_sales > prev_month_sales 
  AND prev_month_sales > prev_2_month_sales;