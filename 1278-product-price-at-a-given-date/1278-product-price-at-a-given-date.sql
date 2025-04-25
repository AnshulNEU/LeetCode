

with dats as 
(select product_id, max(change_date) change_date
    from Products
    where change_date <= '2019-08-16'
    group by product_id),
latest_prices AS (
    SELECT p.product_id, p.new_price
    FROM Products p
    JOIN dats d 
      ON p.product_id = d.product_id AND p.change_date = d.change_date
),
prods as 
    (select distinct product_id from products)

select p.product_id, coalesce(lp.new_price,10) price from prods p left join latest_prices lp
on p.product_id = lp.product_id
    