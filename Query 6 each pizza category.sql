-- Join the necessary tables to find the total quantity of each pizza category ordered.
SELECT category,
       SUM(quantity) AS quantity
FROM pizza_types pt
JOIN pizzas p
ON p.pizza_type_id = pt.pizza_type_id
JOIN order_details od
ON od.pizza_id = p.pizza_id
GROUP BY category
ORDER BY quantity ASC;