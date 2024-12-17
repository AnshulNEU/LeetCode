# Write your MySQL query statement below

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND NOT EXISTS (
    SELECT 1
    FROM Insurance AS i2
    WHERE Insurance.lat = i2.lat
      AND Insurance.lon = i2.lon
      AND Insurance.pid != i2.pid
);






