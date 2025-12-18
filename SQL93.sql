--Find the last ID in a sql table
SELECT MAX(id) as last_id from table_name

--Remove duplicates from a table

select distinct * from table

select col1, col2,...., colN
from tbl
group by col1, col2,...., colN
Having count(*) > 1

WITH CTE AS (
	SELECT *, ROW_NUMBER() OVER (PARTITION BY col1, col2, ....colN Order by (select 0)) as rn
	from tb
	)
delete from cte where rn > 1

delete t1
from tbl t1
inner join tbl t2
where t1.id > t2.id
and t1.col1 = t2.col1 and t1.col2 = t2.col2
and ...