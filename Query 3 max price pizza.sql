-- Identify the highest-priced pizza.
-- Here to get its name we have to join it with pizza_types table and after that using where condition 
-- we can use aggregate function
SELECT pizza_id,
	   pt.name,
       size,
       price AS max_price
FROM pizzas
JOIN pizza_types pt
USING (pizza_type_id)
WHERE price = (SELECT MAX(price)
               FROM pizzas)
;


-- OR WE CAN DO IT BY ORDERBY AND LIMIT CLAUSE
-- SELECT pizza_id, name, price
-- FROM pizzas JOIN pizza_types USING (pizza_type_id)
-- ORDER BY price DESC LIMIT 1