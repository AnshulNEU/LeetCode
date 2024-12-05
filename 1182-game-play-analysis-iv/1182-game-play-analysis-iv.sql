# Write your MySQL query statement below


/*select Round(count(player_id)/(select count(distinct(player_id)) from activity),2) as fraction
from activity # a join (select player_id, event_date as date_id from activity where event_date = date_add(event_date,INTERVAL 1 DAY)) as b 
where event_date = date_add(event_date,Interval 1 day)
#on a.player_id = b.player_id and a.event_date = b.date_id */

SELECT
  ROUND(COUNT(DISTINCT player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM
  Activity
WHERE
  (player_id, DATE_SUB(event_date, INTERVAL 1 DAY))
  IN (
    SELECT player_id, MIN(event_date) AS first_login FROM Activity GROUP BY player_id
  )
