
select distinct l1.num ConsecutiveNums
from logs l1 join logs l2 join logs l3
on  l2.id+1 = l3.id and l2.id-1=l1.id
where l1.num = l2.num and l2.num = l3.num and l1.num = l3.num
