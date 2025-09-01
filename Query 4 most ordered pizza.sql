-- Identify the most common pizza size ordered.
SELECT COUNT(*) AS no_of_orders,
       size
FROM pizzas p
JOIN order_details
USING (pizza_id)
GROUP BY size
ORDER BY no_of_orders DESC LIMIT 1;