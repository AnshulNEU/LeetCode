# Write your MySQL query statement below

select w.id
from weather w join weather v
on w.recorddate = date_add(v.recorddate,interval 1 Day)
where w.temperature > v.temperature 
