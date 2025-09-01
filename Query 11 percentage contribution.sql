-- Calculate the percentage contribution of each pizza type to total revenue.
-- Here we used subquery in our expression to find the percentage and the subquery we are using 
-- is to find the total_sale by all the pizzas and we have used that to divide it with per category sales
-- to find the percentage .
-- Here we find out that our top selleing pizza category is classic pizza with around 27% of total sales
-- and we also deduced that almost each category is doing well and contributing gud in the sales
SELECT pt.category,
	ROUND(  (SUM(od.quantity * p.price) / (SELECT SUM(od_1.quantity * p_1.price) AS total_sales
									  FROM order_details od_1
									  JOIN pizzas p_1 USING (pizza_id))) * 100 , 2) AS percentage_sales
FROM order_details od
JOIN pizzas p
USING (pizza_id)
JOIN pizza_types pt
USING (pizza_type_id)
GROUP BY pt.category
ORDER BY percentage_sales DESC

