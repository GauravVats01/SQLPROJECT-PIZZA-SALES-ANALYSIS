-- Group the orders by date and calculate the average number of pizzas ordered per day.
SELECT  ROUND(AVG(total_pizza)) AS pizza_per_day

FROM 
     (SELECT    order_date,
				SUM(quantity) AS total_pizza
	  FROM orders
	  JOIN order_details
	  USING (order_id)
      GROUP BY order_date) AS order_quantity