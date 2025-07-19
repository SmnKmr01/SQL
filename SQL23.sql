/* Write your T-SQL query statement below */
/*The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.*/
select machine_id, 
    Round(
        AVG(CASE When activity_type = 'end' then timestamp else null end)-
        AVG(CASE When activity_type = 'start' then timestamp else null end),3
    ) as processing_time
from activity
group by machine_id    
