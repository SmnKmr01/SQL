

CREATE TABLE sales (
    sale_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    amount DECIMAL(10,2)
);

CREATE TABLE holidays (
    holiday_date DATE PRIMARY KEY,
    holiday_name VARCHAR(100)
);

INSERT INTO holidays (holiday_date, holiday_name) VALUES
('2025-01-01','New Year'),
('2025-12-25','Christmas'),
('2025-11-27','Thanksgiving'),
('2025-08-15','Independence Day');

INSERT INTO sales (product_id, sale_date, amount) VALUES

-- Product 101 sold only on holidays
(101,'2025-01-01',500),
(101,'2025-12-25',600),

-- Product 102 sold on holiday + non-holiday (should NOT appear)
(102,'2025-01-01',200),
(102,'2025-01-10',300),

-- Product 103 sold only on holidays
(103,'2025-08-15',700),

-- Product 104 sold only non-holiday (should NOT appear)
(104,'2025-02-10',400),
(104,'2025-03-11',500);

select * from sales
select * from holidays

--Find products with sales only during holiday seasons.


SELECT product_id
FROM sales s
LEFT JOIN holidays h
    ON s.sale_date = h.holiday_date
GROUP BY product_id
HAVING COUNT(*) = COUNT(h.holiday_date);