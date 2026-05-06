
-- Create Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

-- Insert Sample Data

-- Product 101 sold in all 4 quarters
INSERT INTO sales VALUES (1, 101, '2026-01-15', 500);
INSERT INTO sales VALUES (2, 101, '2026-04-10', 700);
INSERT INTO sales VALUES (3, 101, '2026-07-05', 650);
INSERT INTO sales VALUES (4, 101, '2026-10-20', 800);

-- Product 102 sold only in Q1, Q2, Q3
INSERT INTO sales VALUES (5, 102, '2026-02-12', 400);
INSERT INTO sales VALUES (6, 102, '2026-05-18', 550);
INSERT INTO sales VALUES (7, 102, '2026-08-22', 600);

-- Product 103 sold in all 4 quarters
INSERT INTO sales VALUES (8, 103, '2026-03-01', 300);
INSERT INTO sales VALUES (9, 103, '2026-06-11', 450);
INSERT INTO sales VALUES (10, 103, '2026-09-14', 500);
INSERT INTO sales VALUES (11, 103, '2026-12-02', 750);

-- Product 104 sold only in Q2 and Q4
INSERT INTO sales VALUES (12, 104, '2026-04-25', 900);
INSERT INTO sales VALUES (13, 104, '2026-11-19', 950);

select * from sales

--Find products that were sold in every quarter of the current year.

WITH quarterly_sales AS (
    SELECT 
        product_id,
        DATEFROMPARTS(YEAR(sale_date),
            ((DATEPART(QUARTER, sale_date)-1) * 3) + 1,
            1) AS quarter_start
    FROM sales
    WHERE YEAR(sale_date) = YEAR(GETDATE())
    GROUP BY product_id,
             DATEFROMPARTS(YEAR(sale_date),
             ((DATEPART(QUARTER, sale_date)-1) * 3) + 1,
             1)
)
SELECT product_id
FROM quarterly_sales
GROUP BY product_id
HAVING COUNT(DISTINCT quarter_start) = 4;