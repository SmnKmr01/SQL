--Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".


SELECT * FROM Cinema
WHERE description != 'boring' AND id IN(
    SELECT id from Cinema
    where id % 2 = 1
)
ORDER BY rating DESC;