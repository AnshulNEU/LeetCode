# Write your MySQL query statement below



select e.name
from employee e join employee em
on e.id = em.managerid
group by e.id
having count(em.managerid)>=5
