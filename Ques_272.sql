

CREATE TABLE salaries (
    employee_id INT,
    year INT,
    salary DECIMAL(10,2)
);


INSERT INTO salaries (employee_id, year, salary) VALUES
-- Employee 1 (increasing every year)
(101, 2021, 40000),
(101, 2022, 45000),
(101, 2023, 50000),

-- Employee 2 (not increasing)
(102, 2021, 30000),
(102, 2022, 28000),
(102, 2023, 35000),

-- Employee 3 (increasing)
(103, 2021, 55000),
(103, 2022, 60000),
(103, 2023, 70000),
(103, 2024, 90000),

-- Employee 4 (same salary one year → not strictly increasing)
(104, 2021, 45000),
(104, 2022, 45000),
(104, 2023, 47000);

select * from salaries

--Find employees whose salaries increased every year

WITH salary_diff AS (
    SELECT 
        employee_id,
        year,
        salary,
        LAG(salary) OVER (
            PARTITION BY employee_id 
            ORDER BY year
        ) AS prev_salary
    FROM salaries
)
SELECT employee_id
FROM salary_diff
GROUP BY employee_id
HAVING COUNT(*) = COUNT(
        CASE 
            WHEN prev_salary IS NULL 
                 OR salary > prev_salary 
            THEN 1
        END
);