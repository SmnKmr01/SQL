

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    sales_rep_id INT,
    amount DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO Sales (sale_id, sales_rep_id, amount, sale_date) VALUES
(1, 101, 5000, '2025-01-10'),
(2, 102, 7000, '2025-01-12'),
(3, 101, 3000, '2025-02-05'),
(4, 103, 8000, '2025-02-10'),
(5, 102, 2000, '2025-03-01'),
(6, 101, 4000, '2025-03-15');

select * from sales

--Find the total revenue generated per sales representative.

select sales_rep_id,
sum(amount) as total_revenue
from sales 
group by sales_rep_id
