# Write your MySQL query statement below

(Select  u.name as results
from users u join MovieRating m
on u.user_id = m.user_id
group by u.user_id
order by count(m.user_id) desc, name asc
limit 1)

Union all

(Select m.title as results
from movies m join MovieRating mr
on m.movie_id = mr.movie_id
where date_format(created_at,'%Y-%m')='2020-02'
group by m.movie_id
order by AVG(rating)desc, m.title asc
limit 1)