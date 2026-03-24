--Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null
drop table emp
create table Emp(
id int Primary Key,
salary int)

insert into Emp (id, salary)
VALUES(1, 100),
(2, 200),
(3, 300)

select * from Emp


select  max(salary) as secondHighestSalary
from Emp
where salary < (select max(salary) from Emp)


--or--

SELECT salary AS SecondHighestSalary
FROM (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
) t
WHERE rnk = 2;