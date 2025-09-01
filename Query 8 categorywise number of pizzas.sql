-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT COUNT(name),
       category
FROM pizza_types
GROUP BY category