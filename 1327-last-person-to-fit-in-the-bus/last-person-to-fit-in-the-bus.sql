# Write your MySQL query statement below

with max as
 (select turn, person_id,person_name, (sum(weight) over (order by turn)) as cum
from queue q 
order by person_id desc) 

select person_name
from max 
where cum <= 1000
order by turn desc
limit 1