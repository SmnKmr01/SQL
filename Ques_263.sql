

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    amount DECIMAL(10,2)
);


INSERT INTO orders (order_id, customer_id, order_date, amount) VALUES
(1, 101, '2024-03-04 10:30:00', 250.00), -- Monday
(2, 102, '2024-03-05 11:15:00', 180.00), -- Tuesday
(3, 103, '2024-03-09 14:20:00', 300.00), -- Saturday
(4, 104, '2024-03-10 16:45:00', 150.00), -- Sunday
(5, 105, '2024-03-06 09:10:00', 220.00), -- Wednesday
(6, 106, '2024-03-07 13:50:00', 275.00), -- Thursday
(7, 107, '2024-03-08 18:30:00', 320.00), -- Friday
(8, 108, '2024-03-16 12:00:00', 410.00), -- Saturday
(9, 109, '2024-03-17 17:25:00', 500.00); -- Sunday

select * from orders

--Find the number of orders placed on weekends vs weekdays.

select
	case 
		when DATENAME(Weekday, order_date) IN ('Saturday', 'Sunday') then 'Weekend'
		else 'weekday'
		end as	date_type,
	COUNT(*) as no_of_orders
from orders
group by case 
		when DATENAME(Weekday, order_date) IN ('Saturday', 'Sunday') then 'Weekend'
		else 'weekday'
		end



SELECT 
    CASE 
        WHEN DATEPART(WEEKDAY, order_date) IN (1,7) 
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
    COUNT(*) AS order_count
FROM orders
GROUP BY 
    CASE 
        WHEN DATEPART(WEEKDAY, order_date) IN (1,7) 
            THEN 'Weekend'
        ELSE 'Weekday'
    END