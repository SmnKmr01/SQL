--Write a solution to find managers with at least five direct reports.

select e.name
from Employee e
JOIN (
    select managerid, count(*) as directReports
    from Employee 
    Group by managerid
    Having count(*) >= 5
) E1 on e.id = e1.managerid


--or--
SELECT e.name
FROM Employee AS e 
INNER JOIN Employee AS m ON e.id=m.managerId 
GROUP BY m.managerId , e.name
HAVING COUNT(m.managerId) >= 5

--or- 

SELECT name 
FROM Employee 
WHERE id IN (
    SELECT managerId 
    FROM Employee 
    GROUP BY managerId 
    HAVING COUNT(*) >= 5)

--or--
SELECT a.name 
FROM Employee a 
JOIN Employee b ON a.id = b.managerId 
GROUP BY b.managerId 
HAVING COUNT(*) >= 5

--or--
SELECT e1.name
FROM employee e1
LEFT JOIN employee e2 ON e1.id=e2.managerId
GROUP BY e1.id
HAVING COUNT(e2.name) >= 5;
