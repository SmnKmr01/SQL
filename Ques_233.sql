drop table employees

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    birth_date DATE
);

-- Insert Sample Data
INSERT INTO employees (employee_id, employee_name, department_id, birth_date)
VALUES
(1, 'Amit', 101, '1990-05-10'),
(2, 'Priya', 101, '1992-08-15'),
(3, 'Rahul', 102, '1998-03-20'),
(4, 'Sneha', 102, '2000-07-12'),
(5, 'Karan', 103, '1985-11-25'),
(6, 'Neha', 103, '1987-09-18'),
(7, 'Arjun', 104, '2001-01-05'),
(8, 'Pooja', 104, '2002-06-22');

select * from employees

--Find the department with the youngest average employee age.

SELECT TOP 1
       department_id,
       AVG(DATEDIFF(YEAR, birth_date, GETDATE())) AS avg_age
FROM employees
GROUP BY department_id
ORDER BY avg_age