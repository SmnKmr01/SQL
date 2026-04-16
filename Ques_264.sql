
CREATE TABLE orderz(
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(10,2),
    discount DECIMAL(10,2)
);	

INSERT INTO orderz (order_date, amount, discount) VALUES

-- January
('2025-01-05', 500, 50),
('2025-01-10', 300, 0),
('2025-01-15', 700, 70),

-- February
('2025-02-01', 400, 0),
('2025-02-08', 600, 60),
('2025-02-20', 200, 0),

-- March
('2025-03-02', 900, 100),
('2025-03-05', 250, 25),
('2025-03-15', 350, 0);

select * from orderz

--Find the percentage of orders with discounts per month.




SELECT 
    DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS month,
    
    100.0 * 
    SUM(CASE 
            WHEN discount > 0 THEN 1 
            ELSE 0 
        END) 
    / COUNT(*) AS discount_percentage

FROM orderz

GROUP BY 
    YEAR(order_date),
    MONTH(order_date)

ORDER BY month;

