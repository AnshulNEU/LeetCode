
Select distinct(num) ConsecutiveNums from 
(
select num, lead(num) Over (order by id) as next_num, lag(num) over (order by id) as prev_num
from logs) as p
where num=next_num and num=prev_num

/* SELECT DISTINCT num as ConsecutiveNums
FROM (
    SELECT num, LEAD(num) OVER (ORDER BY id) as next_num, LAG(num) OVER (ORDER BY id) as prev_num
    FROM Logs
) temp
WHERE num = next_num AND num = prev_num; */
