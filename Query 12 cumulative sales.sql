-- Analyze the cumulative revenue generated over time.
SELECT order_date,
       SUM(revenue) OVER ( ORDER BY order_date) AS cumulative_revenue
FROM
	(SELECT    SUM(order_details.quantity * pizzas.price) AS revenue,
				orders.order_date
	 FROM order_details 
	 JOIN orders
	 ON order_details.order_id = orders.order_id
	 JOIN pizzas
	 ON pizzas.pizza_id = order_details.pizza_id
	 GROUP BY orders.order_date) AS table_1