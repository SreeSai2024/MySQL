#GroupByBasics
SELECT customer_id, SUM(tip)
FROM customer_orders
GROUP BY customer_id;

SELECT product_id,AVG(order_total) as Avg_order_total
FROM customer_orders
GROUP BY product_id
ORDER BY Avg_order_total;

#Aggregate Functions:
SELECT customer_id, SUM(tip) as total_tips
FROM customer_orders
GROUP BY customer_id;

SELECT customer_id, AVG(tip) as average_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY average_tips;

SELECT customer_id, MAX(tip) as largest_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY largest_tips;

SELECT customer_id, MIN(tip) as smallest_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY smallest_tips;

SELECT customer_id,COUNT(tip) as numberOf_tips
FROM customer_orders
GROUP BY customer_id
ORDER BY numberOf_tips;

SELECT first_name,last_name,COUNT(phone)
FROM customers
GROUP BY first_name,last_name;

SELECT customer_id,tip,COUNT(tip),COUNT(DISTINCT tip)
FROM customer_orders
GROUP BY customer_id,tip;

#Having clause, Where Clause
SELECT customer_id,SUM(tip) AS total_tips
FROM customer_orders
WHERE total_tips>5
GROUP BY customer_id;
#execution order is WHERE comes first before GROUP BY.Remedy is to use HAVING Clause
SELECT customer_id,SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id
HAVING total_tips>5
;
#ROLL UP
SELECT customer_id,SUM(tip) AS total_tips
FROM customer_orders
GROUP BY customer_id WITH ROLLUP;

#Joins
#inner joins:more straightforward, returns only commmon rows
SELECT product_name,SUM(order_total) as Total
FROM products p
INNER JOIN customer_orders co
	ON p.product_id = co.product_id
GROUP BY product_name
ORDER BY Total;

SELECT *
FROM Suppliers s
INNER JOIN ordered_items oi
	ON s.supplier_id = oi.shipper_id
;
#Joining Multiple Tables
SELECT product_name,order_total,first_name
FROM products p
JOIN customer_orders co
	ON p.product_id=co.product_id
JOIN customers c
	ON co.customer_id=c.customer_id;

SELECT p.product_id,co.product_id,co.customer_id,c.customer_id
FROM products p
JOIN customer_orders co
	ON p.product_id=co.product_id
JOIN customers c
	ON co.customer_id=c.customer_id;

#Joining on multiple conditions
SELECT * 
FROM customer_orders co
JOIN customer_orders_review cor
	ON co.order_id=cor.order_id
	AND co.customer_id=cor.customer_id;

#outer joins(returns all the columns from all the specified tables
#Left join(everything from left table and the contents that match from both the tables 
SELECT c.customer_id,first_name,co.order_id
FROM customers c
LEFT OUTER JOIN customer_orders co
	ON c.customer_id = co.customer_id
ORDER BY c.customer_id,co.order_id;

#Similar to Left Join we can perform Right Join
# SELF JOINS
SELECT *
FROM customers c
JOIN customers ss
	ON c.first_name=ss.first_name
;

SELECT c.customer_id,c.first_name,c.last_name,ss.customer_id,ss.first_name,ss.last_name
FROM customers c
JOIN customers ss
	ON c.customer_id+1 = ss.customer_id
;

#CROSS JOINS(mostly we won't use this kind of joins)
SELECT c.customer_id,c.first_name,co.customer_id,order_id
FROM customers c
CROSS JOIN customer_orders co
ORDER BY c.customer_id
;
#Natural JOINs
SELECT *
FROM products p
NATURAL JOIN customer_orders co
ORDER BY p.product_id
;

#USING Keyword:specifying the common column name from the both tables without using ON keyword
SELECT c.customer_id,first_name,co.order_id
FROM customers c
LEFT OUTER JOIN customer_orders co
	USING(customer_id)
ORDER BY c.customer_id,co.order_id;

#UNION(Combining the rows together)
SELECT *
FROM customers;

SELECT *
FROM products;

SELECT first_name,last_name
FROM customers
UNION 
SELECT product_id,product_name
FROM products;

SELECT first_name, last_name, 'Old'
FROM customers
WHERE YEAR(birth_date)<1950
UNION 
SELECT c.first_name, c.last_name, 'Good Tipper'
FROM customers c
JOIN customer_orders co
	ON c.customer_id=co.customer_id
WHERE tip>3
UNION 
SELECT first_name,last_name,'Big Spender'
FROM customers
WHERE total_money_spent > 1000
ORDER BY first_name, last_name
;

#UNION ALL(doesn't remove duplicates)
SELECT first_name, last_name, 'Old'
FROM customers
WHERE YEAR(birth_date)<1950
UNION ALL
SELECT first_name, last_name, 'Old'
FROM customers
WHERE YEAR(birth_date)<1950;

#JOIN USE CASES:
SELECT DISTINCT p.product_name,
oi.unit_price,
p.sale_price,
p.sale_price-oi.unit_price AS profit,
p.units_in_stock,
(p.sale_price-oi.unit_price)*p.units_in_stock AS potential_profit
FROM ordered_items oi
JOIN products p
	USING(product_id)
Order By potential_profit DESC
;

SELECT *
FROM products;
#reference tables are never considered as LEFT tables or main tables

SELECT DISTINCT p.product_name, 
oi.unit_price,
p.sale_price,
p.units_in_stock,
p.sale_price-oi.unit_price AS profit,
(p.sale_price-oi.unit_price)*p.units_in_stock AS potential_profit
FROM ordered_items oi
JOIN products p
	USING(product_id)
ORDER BY potential_profit DESC
;

SELECT *
FROM supplier_delivery_status; #reference table
SELECT *
FROM ordered_items;
SELECT *
FROM suppliers;


SELECT oi.order_id,sds.name,oi.shipped_date,s.name
FROM ordered_items oi
JOIN supplier_delivery_status sds
	ON oi.status=sds.order_status_id
JOIN suppliers s
	ON oi.shipper_id=s.supplier_id
WHERE sds.name <> 'Delivered'
AND YEAR(shipped_date) = YEAR(NOW())-4
;
	



























