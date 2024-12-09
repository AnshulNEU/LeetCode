# Write your MySQL query statement below

With Cust as 
    (select customer_id, count(distinct product_key) num from customer group by customer_id),
    Prod_count as (select count(distinct product_key) num from product)

select customer_id from cust c join prod_count pc
    on c.num=pc.num
