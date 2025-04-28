# Write your MySQL query statement below

-- Select user_id and confirmation rate rounded to two decimal places.
SELECT s.user_id,
       -- Calculate confirmed actions divided by total actions, handling division by zero.
       ROUND(
           IFNULL(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.action), 0),
           2
       ) AS confirmation_rate
-- From the Signups table.
FROM Signups s
-- Left join with the Confirmations table on user_id.
LEFT JOIN Confirmations c
ON s.user_id = c.user_id
-- Group the result by user_id.
GROUP BY s.user_id;
