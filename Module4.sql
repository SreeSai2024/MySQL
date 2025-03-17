#Subquery:cannot have more than 1 column,readability
SELECT *
FROM customers
WHERE customer_id IN
	(SELECT customer_id
	FROM customer_orders)
;

SELECT *
FROM customers
WHERE total_money_spent > (SELECT AVG(total_money_spent)
							FROM customers);
                            
#ANy and ALL statements
