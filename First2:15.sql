USE bakery;
SELECT * 
FROM bakery.customers; 

SELECT customer_id,first_name
FROM customers;

SELECT *
FROM customer_orders
WHERE product_id=1001;

SELECT DISTINCT city,state
FROM customers;

#WHERE caluse
SELECT *
FROM customers
WHERE total_money_spent>3000;

SELECT *
FROM customers
WHERE city="Scranton";

SELECT *
FROM customers
WHERE birth_date > '1985-01-01';

SELECT *
FROM products
WHERE units_in_stock<30;

#Comparision Operators:- =,<>,<,>
SELECT *
FROM customer_orders
WHERE tip!=1;

#Logical Operators
SELECT *
FROM customers
WHERE state='PA' AND total_money_spent>1000;

SELECT *
FROM customers
WHERE state='PA' OR total_money_spent>1000;

SELECT *
FROM customers
WHERE (state='PA' OR city="Dallas") AND total_money_spent>1000;

SELECT *
FROM customers
WHERE state='PA' OR city="Dallas" AND total_money_spent>1000;
##gives same result reason:left to right associativity

SELECT *
FROM customers
WHERE NOT state='PA';

#BETWEEN
SELECT *
FROM customers
WHERE total_money_spent BETWEEN 534 AND 1009;

#If we reverse the range it wont give us any output always range should be lower to higher.
SELECT *
FROM customers
WHERE total_money_spent BETWEEN 1009 AND 534;

#LIKE Operator-Searching for pattern
#ORDER BY clause
SELECT *
FROM customers
ORDER BY state DESC,total_money_spent DESC;

#The below query is same as above but instead of column names we are using Column numbers
SELECT *
FROM customers
ORDER BY 8 DESC,9 ASC;

#LIMIT clause:(2 ARGUMENTS)Number of rowa of data to be returned, written very end of the query
SELECT *
FROM customers
WHERE total_money_spent>10000
ORDER BY total_money_spent DESC
LIMIT 5;
# If we write LIIMIT 5,2(Starting at position 5 and the next 2 records are considered

SELECT *
FROM customers
WHERE total_money_spent<10000
ORDER BY total_money_spent DESC
LIMIT 5,2;

#ALAIASING changing the name of the Columns in the output.But the column name in the table remains same
SELECT *
FROM products;

SELECT product_name AS 'Goodies', units_in_stock 'uis'
FROM products;

SELECT units_in_stock * sale_price AS Potential_Revenue
FROM products;
#Selecting from Tables by creating alias for the entire table
SELECT p.units_in_stock, p.product_name
FROM products p;






