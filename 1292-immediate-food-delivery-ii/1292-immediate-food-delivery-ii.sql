# Write your MySQL query statement below

select Round((sum(case when d.order_date=d.customer_pref_delivery_date then 1 else 0 end)/count(d.order_date))*100,2) as immediate_percentage
from delivery d
join (select customer_id, min(order_date) as date_id from delivery group by customer_id) as c on d.customer_id = c.customer_id 
and date_id= d.order_date


# having order_date in (select min(order_date) from delivery where group by customer_id);
