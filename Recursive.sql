--write a recursive query or hierarchical query to show the entire organization chart.

WITH empdata AS (

(SELECT employee_id, first_name, manager_id, 1 AS level

FROM employee

WHERE employee_id = 1)

UNION ALL

(SELECT this.employee_id, this.first_name, this.manager_id, prior.level + 1

FROM empdata prior

INNER JOIN employee this ON this.manager_id = prior.employee_id)

)

SELECT e.employee_id, e.first_name, e.manager_id, e.level

FROM empdata e

ORDER BY e.level;