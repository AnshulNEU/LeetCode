# Write your MySQL query statement below


select Date_format(trans_date, '%Y-%m') as 'month', country,
        count(id) trans_count, sum(case when state='approved' then 1 else 0 end) approved_count,
        sum(amount) trans_total_amount, sum(case when state='approved' then amount else 0 end) as approved_total_amount
from transactions t
group by country, month
