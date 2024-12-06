# Write your MySQL query statement below

with min_order_date as 
(select min(order_date) as order_date, customer_id from delivery group by customer_id)

select Round((count(d.delivery_id)/(select count(*) from min_order_date))*100, 2) as immediate_percentage
from delivery d left join min_order_date m 
on d.order_date=m.order_date and d.customer_id=m.customer_id
where m.order_date=d.customer_pref_delivery_date
