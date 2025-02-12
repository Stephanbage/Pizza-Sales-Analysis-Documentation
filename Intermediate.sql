-- Join the necessary tables to find the total quantity of each pizza category ordered

SELECT 
    pizza_types.category,
    SUM(orders_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.﻿pizza_type_id = pizzas.pizza_type_id
        JOIN
    orders_details ON orders_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY quantity DESC;


-- Determine the distribution of orders by hour of the day

SELECT 
    HOUR(order_time) AS hour, COUNT(order_id) AS order_count
FROM
    orders
GROUP BY HOUR(order_time);



-- Join relevant tables to find the category-wise distribution of pizzas

select pizza_types.category, count(pizza_types.category) as order_no from pizza_types
group by pizza_types.category order by order_no  ;
--                 OR     you can write thus way too
select category , count(name) from pizza_types
group by category;




-- Group the orders by date and calculate the average number of pizzas ordered per day

select order_date,sum(quantity) as sum_order
from orders join orders_details 
on orders_details.order_id = orders.order_id
group by order_date;
--                           OR 
SELECT 
    AVG(quantity)
FROM
# we make here sub quary
    (SELECT 
        orders.order_date, SUM(quantity) AS quantity
    FROM
        orders
    JOIN orders_details ON orders.order_id = orders_details.order_id
    GROUP BY orders.order_date) AS order_quantity;



-- Determine the top 3 most ordered pizza types based on revenue

select pizza_types.name,
sum(orders_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.﻿pizza_type_id
join orders_details
on orders_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by revenue desc limit 3; 














