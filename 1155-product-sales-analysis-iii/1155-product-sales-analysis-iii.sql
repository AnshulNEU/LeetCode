# Write your MySQL query statement below

select s.product_id, p.first_year, s.quantity, price
from sales s join (select product_id, min(year) first_year from sales group by product_id) p
on s.product_id=p.product_id and s.year=p.first_year


/*
select s.product_id, s.year as first_year, s.quantity, s.price
from sales s join (select product_id, min(year) as firstyear from sales group by product_id) as p2
on s.product_id = p2.product_id and s.year=p2.firstyear
*/




