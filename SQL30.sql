--Write a solution to find the percentage of the users registered in each contest rounded to two decimals.

--Return the result table ordered by percentage in descending order. In case of a tie, order it by contest_id in ascending order.


SELECT
contest_id,
ROUND(
(COUNT( r.user_id) * 100)*1.0 / (SELECT COUNT(*) FROM Users),
2
) AS percentage
FROM
Users AS u
INNER JOIN
register r ON u.user_id = r.user_id
GROUP BY
contest_id
ORDER BY
percentage DESC, contest_id;