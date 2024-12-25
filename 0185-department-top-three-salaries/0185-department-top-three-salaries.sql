# Write your MySQL query statement below



WITH RankedSalaries AS (
    SELECT 
        e.id, 
        e.name, 
        e.salary, 
        e.departmentId, 
        DENSE_RANK() OVER (PARTITION BY e.departmentId ORDER BY e.salary DESC) AS top
    FROM 
        Employee e
)
SELECT 
    d.name department,
    rs.name employee, 
    rs.salary
FROM 
    RankedSalaries rs join Department d
    on rs.departmentId = d.id
WHERE 
    rs.top <= 3;


