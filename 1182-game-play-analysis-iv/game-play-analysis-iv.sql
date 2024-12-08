
select Round(count(a1.player_id)/(select count(distinct(player_id)) from activity),2) fraction
from activity a1 
where (player_id, event_date)
in (select player_id, date_add(min(event_date), interval 1 day) from activity group by player_id)
