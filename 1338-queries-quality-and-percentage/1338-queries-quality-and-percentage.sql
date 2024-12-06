# Write your MySQL query statement below


select query_name, Round(sum(rating/position)/count(query_name),2) as quality,
        round((sum(case when rating<3 then 1 else 0 end )/count(query_name))*100,2) as poor_query_percentage
from queries 
where query_name in (select distinct query_name from queries)
group by query_name