CREATE TABLE Numbers (
    id INT IDENTITY(1,1),
    num INT
);

INSERT INTO Numbers (num)
VALUES
(2),
(2),
(NULL),
(NULL),
(3),
(4),
(NULL),
(5),
(NULL),
(NULL),
(NULL);

select * from Numbers

with cte as(
	select 
		id, 
		num,
		MAX(case when num is not null then id end)
		over (order by id rows unbounded preceding) as grp
	from Numbers
)
select num,
	max(num) over (partition by grp) as filled_num
from cte
order by id


--or--

SELECT 
    num,
    LAST_VALUE(num) IGNORE NULLS OVER (
        ORDER BY id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS filled_num
FROM Numbers;