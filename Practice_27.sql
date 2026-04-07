CREATE TABLE Logs (
    id INT,
    num INT
);

INSERT INTO Logs (id, num) VALUES
(1,1),
(2,1),
(3,1),
(4,2),
(5,1),
(6,2),
(7,2);


--Find all numbers that appear at least three times consecutively

SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        LAG(num,1) OVER (ORDER BY id) AS prev1,
        LAG(num,2) OVER (ORDER BY id) AS prev2
    FROM Logs
) t
WHERE num = prev1 
  AND num = prev2;