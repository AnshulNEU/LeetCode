

(Select u.name results
From Users u join Movierating m
on u.user_id = m.user_id
group by u.user_id
order by count(m.user_id) desc, u.name
limit 1 )

Union all
(
Select m1.title as results
From movies m1 join Movierating m2
on m1.movie_id = m2.movie_id
where Date_format(created_at,'%Y%m') = '202002'
group by m2.movie_id
order by avg(m2.rating) desc, m1.title
limit 1
)


