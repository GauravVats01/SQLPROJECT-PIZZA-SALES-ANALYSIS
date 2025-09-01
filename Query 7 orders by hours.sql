-- Determine the distribution of orders by hour of the day.
SELECT HOUR(order_time) AS time_of_day,
	   COUNT(order_id) AS orders
                        
FROM orders

GROUP BY HOUR(order_time)
ORDER BY orders ASC