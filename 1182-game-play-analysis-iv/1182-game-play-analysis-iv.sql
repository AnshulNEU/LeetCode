# Write your MySQL query statement below

with p_data as (
select *, row_number() over (partition by player_id order by event_date asc) as rn
from Activity
)

select round(count(distinct p.player_id)/(select count(distinct player_id) from Activity),2) as fraction
from p_data p join Activity a on p.player_id = a.player_id
where 
p.rn=1 and a.event_date = date_add(p.event_date,interval 1 day)