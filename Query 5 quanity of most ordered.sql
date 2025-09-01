-- List the top 5 most ordered pizza types along with their quantities.
SELECT  name,
        SUM(quantity) AS quantity 
FROM pizzas
JOIN pizza_types
USING (pizza_type_id)
JOIN order_details
USING (pizza_id) 
GROUP BY name
ORDER BY COUNT(*) DESC
lIMIT 5;