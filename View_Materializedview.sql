--Normal Views vs Materialized views

CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    product_name VARCHAR(20),
    sales INT
);

CREATE TABLE returns (
    order_id INT,
    return_date DATE
);

INSERT INTO orders (order_id, order_date, product_name, sales) VALUES 
(1, '2023-01-15', 'Laptop', 1200),
(2, '2023-01-17', 'Smartphone', 800),
(3, '2023-01-20', 'Tablet', 600),
(4, '2023-02-05', 'Smartwatch', 300),
(5, '2023-02-08', 'Headphones', 150),
(6, '2023-02-10', 'Monitor', 200),
(7, '2023-02-15', 'Keyboard', 80),
(8, '2023-02-20', 'Mouse', 50),
(9, '2023-03-01', 'Printer', 220),
(10, '2023-03-05', 'Camera', 500);

INSERT INTO returns (order_id, return_date) VALUES 
(1, '2023-01-20' ),
(5, '2023-02-10')

INSERT INTO orders values(11, '2023-01-21','Laptop',1500)
delete from orders where order_id = 11

select * from orders
select * from returns

create view vw_orders as
select o.*, r.return_date from orders o 
left join returns r on o.order_id = r.order_id

select * from vw_orders

create Indexed  view mvw_orders as
select o.*, r.return_date from orders o 
left join returns r on o.order_id = r.order_id

  