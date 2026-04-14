

CREATE TABLE sales (
    sale_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO sales (product_id, sale_date, amount) VALUES
(101, '2025-10-05', 200),
(102, '2025-10-10', 150),
(103, '2025-11-01', 300),
(101, '2025-11-15', 250),
(104, '2025-12-01', 400),
(105, '2025-12-10', 350),

(101, '2026-01-05', 500),
(106, '2026-01-15', 600),
(107, '2026-02-01', 200),
(102, '2026-02-10', 100),
(108, '2026-03-05', 900),
(109, '2026-03-20', 300),

(110, '2026-04-01', 700);


select * from sales


--Find the total number of unique products sold in the last quarter

select 
COUNT(distinct product_id) as total_unique
from sales
where sale_date >= dateadd(quarter , DATEDIFF(quarter,0,GETDATE())-1, 0) and sale_date <  DATEADD(QUARTER, DATEDIFF(QUARTER, 0, GETDATE()), 0)
