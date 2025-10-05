--How do you find the last ID in a SQL table?

Select MAX(id) AS last_id FROM your_table_name

--OR

Select  id
From your_table_name
order by id desc
LIMIT 1

--How do you remove duplicates from a table?

