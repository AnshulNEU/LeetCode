# Write your MySQL query statement below

(select name as results from (
select u.name, count(mr.movie_id)
from movierating mr join users u 
on u.user_id = mr.user_id join movies m on m.movie_id=mr.movie_id
group by u.user_id
order by count(mr.movie_id) desc, u.name asc) d limit 1)

union all

(select title as results from 
(select m.title, AVG(mr.rating)
from movierating mr join users u 
on u.user_id = mr.user_id join movies m on m.movie_id=mr.movie_id
where date_format(created_at,"%M %Y")='February 2020'
group by m.movie_id
order by AVG(mr.rating) desc, m.title asc ) e limit 1)
