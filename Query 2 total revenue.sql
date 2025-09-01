-- Calculate the total revenue generated from pizza sales.
-- To calculate the total revenue we have to multiply quantity of pizzas with the amount of that pizza
-- so here we have to use joins and aggregate function SUM
SELECT ROUND(SUM(od.quantity * p.price ),2) AS total_revenue
FROM pizzas p
JOIN order_details od
USING (pizza_id);