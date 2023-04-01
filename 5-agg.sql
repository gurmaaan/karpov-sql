-- 4
select count(*) dates,
count(birth_date) dates_not_null
from users

-- 5
select count(user_id) users,
count(distinct user_id) unique_users
from user_actions

-- 6
SELECT count(distinct courier_id) couriers_count
FROM   couriers
WHERE  sex = 'female'

-- 7
select min(time) first_delivery,
max(time) last_delivery
from courier_actions
where action = 'deliver_order'

-- 8
SELECT sum(case when name = 'сухарики' or
                     name = 'чипсы' or
                     name = 'энергетический напиток' then price end) as order_price
FROM   products

-- 14
select round(avg(array_length(product_ids, 1)),2) avg_order_size
from orders
where date_part('dow', creation_time) in (6, 0)

-- 15
SELECT count(distinct user_id) as unique_users,
       count(distinct order_id) as unique_orders,
       round(count(distinct order_id) / count(distinct user_id)::decimal,
             2) as orders_per_user
FROM   user_actions

-- 17
select count(distinct order_id) orders,
       count(distinct order_id) filter (where array_length(product_ids, 1) >=5 ) large_orders,
       round(count(distinct order_id) filter (where array_length(product_ids, 1) >=5 ) / count(distinct order_id)::decimal, 2) large_orders_share
from orders