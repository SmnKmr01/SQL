
CREATE TABLE sales (
    sale_id INT,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO sales VALUES
(1, 101, '2026-01-05', 500),
(2, 101, '2026-01-15', 300),
(3, 101, '2026-02-10', 1200),
(4, 101, '2026-02-18', 200),

(5, 102, '2026-01-07', 400),
(6, 102, '2026-02-12', 900),

(7, 103, '2026-01-03', 700),
(8, 103, '2026-02-20', 650),

(9, 104, '2026-01-11', 200),
(10,104, '2026-02-25', 900);


select * from sales

--Find the products with the highest sales increase compared to the previous month


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

sales_diff AS (
    SELECT 
        product_id,
        month,
        total_sales,
        LAG(total_sales) OVER (
            PARTITION BY product_id 
            ORDER BY month
        ) AS prev_month_sales
    FROM monthly_sales
)

SELECT TOP 10
    product_id,
    month,
    total_sales - prev_month_sales AS increase
FROM sales_diff
WHERE prev_month_sales IS NOT NULL
ORDER BY increase DESC;
