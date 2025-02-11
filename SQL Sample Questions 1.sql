/*1. Delete table EMployee, Department and company.*/

DROP TABLE IF  EXISTS Employee
DROP TABLE IF  EXISTS Department
DROP TABLE IF  EXISTS Company

/*
2.Create Tables:

Employee with attributes (id, name, city, department, salary)
Department with attributes (id, name)
Company with attributes (id, name, revenue)
*/

CREATE TABLE department(
	id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(50) NOT NULL
);

create table company(
	id INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(100) NOT NULL,
	revenue INT
	);

CREATE TABLE Employee(
	id INT PRIMARY KEY IDENTITY(101,1),
	name VARCHAR(150),
	city VARCHAR(150),
	department_id INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (department_id) REFERENCES department(id)
	);

	/*
	4. Add rows into Department Table*/

	INSERT INTO department(name)
	VALUES
	('IT'),
	('Management'),
	('IT'),
	('Support');

	/*
5. Add rows into Company table
(1, 'IBM', 2000000),
(2, 'GOOGLE', 9000000),
(3, 'Apple', 10000000);
*/
INSERT INTO company(name,revenue)
VALUES
('IBM', 2000000),
('GOOGLE', 9000000),
('Apple', 10000000);

/*
3.Add rows into employee table:
*/
INSERT INTO employee (name,city,department_id,salary)
VALUES
('David', 'London', 3, 80000),
('Emily', 'London', 3, 70000),
('Peter', 'Paris', 3, 60000),
('Ava', 'Paris', 3, 50000),
('Penny', 'London', 2, 110000),
('Jim', 'London', 2, 90000),
('Amy', 'Rome', 4, 30000),
('Cloe', 'London', 3, 110000);

/*
6. Query all rows from Department table
*/
SELECT * FROM department;

/*
7. Change the name of department with id = 1 to 'Management'
*/
UPDATE department 
SET name = 'Management'
where id =1 ;

/*
8. Delete employees with salary greater than 100 000
*/
DELETE FROM employee
WHERE salary > 100000;

/*
9. Query the names of companies
*/
SELECT name FROM company;

/*
10. Query the name and city of every employee
*/
SELECT name, city
FROM employee;

/*
11. Query all companies with revenue greater than 5 000 000
*/
SELECT * FROM company
WHERE revenue > 5000000;

/*
12. Query all companies with revenue smaller than 5 000 000
*/
SELECT * FROM company
WHERE revenue < 5000000;

/*
13. Query all companies with revenue smaller than 5 000 000, but you cannot use the '<' operator
*/
SELECT * FROM company
ORDER BY revenue
LIMIT 1;

/*version 2*/
SELECT * FROM company
WHERE NOT revenue >= 5000000;

/*
14. Query all employees with salary greater than 50 000 and smaller than 70 000
*/
SELECT * FROM employee
WHERE salary BETWEEN 50000 AND 70000;

