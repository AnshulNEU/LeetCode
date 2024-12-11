# Write your MySQL query statement below

select person_name from (
select person_id, person_name, sum(weight) over (order by turn) as 'cum', turn from Queue) q
where cum<=1000
order by q.turn desc
limit 1;



