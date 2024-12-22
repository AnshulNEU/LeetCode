# Write your MySQL query statement below

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM
    Insurance
WHERE
    pid IN (
        SELECT
            a.pid
        FROM
            Insurance a
        JOIN
            (SELECT tiv_2015, COUNT(*) AS cnt
             FROM Insurance
             GROUP BY tiv_2015
             HAVING COUNT(*) > 1) b
        ON a.tiv_2015 = b.tiv_2015
    )
AND
    (lat, lon) IN (
        SELECT
            lat, lon
        FROM
            Insurance
        GROUP BY lat, lon
        HAVING COUNT(*) = 1
    );

