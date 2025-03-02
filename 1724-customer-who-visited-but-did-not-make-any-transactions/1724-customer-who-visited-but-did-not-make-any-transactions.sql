# Write your MySQL query statement below

select customer_id, count(v.visit_id) count_no_trans
from Transactions t right join visits v
on v.visit_id = t.visit_id
where transaction_id is null
group by customer_id