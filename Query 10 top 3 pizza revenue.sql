-- Determine the top 3 most ordered pizza types based on revenue.
-- We have to find name of the pizza here and it will have various sizes like small medium and large each have different pizza id 
-- and also different cost so first from order_details we have to sum or add the no.of pizzas that have been ordered 
-- according to their pizza_id . 
-- Step-2 Then using that thing as a subquery and naming it as table_1 we can extract that sum(quantity) as total_pizzas 
-- according to pizza_id 
-- ALSO we have to tell according to the name of the pizzas so we have tp join order_details with pizzas first and then pizza to pizza_types
-- Step-3 Here select name and total_sale that is by adding all the sizes (small, medium, large) and group it by names


SELECT name,
       SUM(price * total_pizzas) AS total_revenue
FROM    (SELECT SUM(quantity) AS total_pizzas,
				pizza_id
		FROM order_details
		GROUP BY pizza_id) AS table_1
JOIN pizzas
USING (pizza_id)
JOIN pizza_types
ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY name
ORDER BY total_revenue DESC;

-- or another way of doing this is using sum function in whole let me show u how

SELECT pt.name,
       SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN pizzas p
USING (pizza_id)
JOIN pizza_types pt
USING (pizza_type_id)
GROUP BY pt.name
ORDER BY total_revenue DESC



