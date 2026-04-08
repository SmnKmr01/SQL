
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE promotions (
    promotion_id INT PRIMARY KEY,
    employee_id INT,
    promotion_date DATE
);

INSERT INTO employees VALUES
(1, 'Suman'),
(2, 'Rahul'),
(3, 'Priya'),
(4, 'Amit');

INSERT INTO promotions VALUES
(101, 1, '2023-01-10'),
(102, 3, '2024-03-15');


select * from employees

select * from promotions

--Find employees who have never received a promotion





SELECT e.id, e.name
FROM employees e
LEFT JOIN promotions p 
    ON e.id = p.employee_id
WHERE p.promotion_id IS NULL;