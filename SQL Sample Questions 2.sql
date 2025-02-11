/*
15. Query all employees with salary greater than 50 000 and smaller than 70 000, but you cannot use BETWEEN
*/
SELECT * FROM Employee
WHERE salary >= 50000 AND salary <= 70000

/*
16. Query all employees with salary equal to 80 000
*/
SELECT * FROM employee
WHERE salary = 80000;

/*
17. Query all employees with salary not equal to 80 000
*/
SELECT * FROM employee
WHERE salary <> 80000;

/*
18. Query all names of employees with salary greater than 70 000 together with employees who work on the 'IT' department.
*/
SELECT * FROM Employee 
WHERE salary > 70000 
AND department_id = (SELECT id FROM department WHERE name = 'IT')

/*
19. Query all employees that work in city that starts with 'L'
*/
SELECT * FROM employee
WHERE city LIKE 'L%';

/*
20. Query all employees that work in city that starts with 'L' or ends with 's'
*/
SELECT * FROM Employee
where city LIKE 'L%' OR CITY LIKE '%s'

/*
21. Query all employees that  work in city with 'o' somewhere in the middle
*/
SELECT * FROM employee
WHERE city LIKE '%o%';

/*
22. Query all departments (each name only once)
*/
SELECT DISTINCT name FROM department;

/*
22. Query names of all employees together with id of department they work in, but you cannot use JOIN
*/
SELECT emp.name,dep.id,dep.name
FROM employee emp, department dep
WHERE emp.department_id = dep.id
ORDER BY emp.name, dep.id;

/*
23. Query names of all employees together with id of department they work in, using JOIN
*/
SELECT emp.name,dep.id,dep.name
FROM employee emp
JOIN department dep
ON emp.department_id = dep.id
ORDER BY emp.name, dep.id;

/*
24. Query name of every company together with every department
Personal thoughts: It is kinda weird question, as there is no relationship between company and departement
*/
SELECT com.name,dep.name
FROM company com, department dep
ORDER BY com.name;

/*
25. Query name of every company together with departments without the 'Support' department
*/
SELECT com.name,dep.name
FROM company com, department dep
WHERE dep.name NOT LIKE 'Support'
ORDER BY com.name;

/*
26. Query employee name together with the department name that they are not working in
*/
SELECT emp.name, dep.name
FROM employee emp, department dep
WHERE emp.department_id <> dep.id;

/*
27. Query company name together with other companies names
LIKE:
GOOGLE Apple
GOOGLE IBM
Apple IBM
...
*/
SELECT com1.name, com2.name
FROM company com1, company com2
WHERE com1.name <> com2.name
ORDER BY com1.name,com2.name;


/*
28. Query employee names with salary smaller than 80 000 without using NOT and <
NOTE: for POSTGRESQL only. Mysql doesn't support except
*/
SELECT e1.name FROM employee e1
EXCEPT
SELECT e2.name FROM employee e2 WHERE e2.salary >= 80000;


/*
29.Query names of every company and change the name of column to 'Company'
*/
SELECT name AS Company
FROM company;

/*
30. Query all employees that work in same department as Peter
*/
SELECT * FROM employee
WHERE department_id IN(
	SELECT department_id FROM employee
    WHERE name LIKE 'Peter'
)
AND name NOT LIKE 'Peter';