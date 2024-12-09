# Write your MySQL query statement below
select ifnull(max(num),null) num from (
Select num, count(num)
    From MyNumbers
Group by num
    having count(num)=1
    order by num desc ) p;



