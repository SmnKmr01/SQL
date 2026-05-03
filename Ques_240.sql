

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Customers
INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Suman'),
(2, 'Rahul'),
(3, 'Anita'),
(4, 'Vikram'),
(5, 'Priya');

-- Orders
INSERT INTO Orders (order_id, customer_id, order_date) VALUES
(101, 1, DATEADD(YEAR, -2, GETDATE())),  -- older than 1 year
(102, 2, DATEADD(MONTH, -6, GETDATE())), -- within last year
(103, 3, DATEADD(DAY, -200, GETDATE())), -- within last year
(104, 4, DATEADD(YEAR, -3, GETDATE()));  -- older than 1 year

select * from Customers
select * from orders


--Find customers with no orders in the last year.




SELECT customer_id
FROM Customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM Orders
    WHERE order_date >= DATEADD(YEAR, -1, GETDATE())
)