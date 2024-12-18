# Write your MySQL query statement below

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM (
    SELECT 
        tiv_2016,
        COUNT(*) OVER (PARTITION BY tiv_2015) AS tiv_2015_count,
        COUNT(*) OVER (PARTITION BY lat, lon) AS location_count
    FROM Insurance
) AS filtered
WHERE tiv_2015_count > 1 AND location_count = 1;







