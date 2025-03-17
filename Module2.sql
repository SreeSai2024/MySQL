#Numeric Function
SELECT * FROM Products;

SELECT ROUND(1234.57980,2);
#OUTPUT:1234.58

SELECT sale_price,ROUND(sale_price,2)
FROM products;

SELECT CEILING(1234.56798);
#output:1235

SELECT FLOOR(1234.56798);
#output:1234

SELECT sale_price,CEILING(sale_price),FLOOR(sale_price)
FROM products;

#String Functions
SELECT LENGTH('sky');

SELECT first_name,LENGTH(first_name) AS len_first
FROM customers
ORDER BY len_first;

#TRIM (only removes space in the bwginning or endings.)
SELECT TRIM('    sky   '),LTRIM('    sky     '),RTRIM('    sky     ');

#left(),right(),substring()
SELECT LEFT('Adusumilli',4);
SELECT RIGHT('Adusumilli',4);
SELECT substring('Adusumilli',2,8);#second letter till 8 letters

#Replace 
SELECT REPLACE(first_name,'a','c')
FROM customers;

#LOCATE
SELECT LOCATE('x','Alexander');

SELECT CONCAT('Alex','Freeberg');

# Data and Date format functions
SELECT NOW(),
curdate(),
curtime()
;
#For findings all the orders from the last year
SELECT *
FROM customer_orders
WHERE YEAR(order_date)=YEAR(NOW())-1;

SELECT order_date,dayname(order_date),monthname(order_date)
FROM customer_orders;

SELECT birth_date
FROM customers;
#formatting the date of birth column
SELECT birth_date,DATE_FORMAT(birth_date,'%M %D %Y')
FROM customers;

#IF FUNCTION
SELECT tip,
IF(tip>1,'Amazing','Cheap..')
FROM customer_orders;

SELECT order_total,
tip,
IF(tip>1,order_total*0.75,order_total*1.1) AS new_total
FROM customer_orders;
# CASE Statement
SELECT units_in_stock,
CASE
	WHEN units_in_stock < 20 THEN 'Stock it!'
    WHEN units_in_stock BETWEEN 21 AND 50 THEN 'Stock in next 3 days!'
    WHEN units_in_stock > 51 THEN 'In_stock' #can also use ELSE
END AS 'Order_status'
FROM products;

SELECT order_id,
order_date,
CASE
	WHEN YEAR(order_date)=YEAR(NOW()) THEN 'Active'
    WHEN YEAR(order_date)=YEAR(NOW())-1 THEN 'Previous'
    ELSE 'Archived'
    END AS 'Years'
FROM customer_orders;

#Cast and Convert Functions
SELECT CAST("2022-01-01" AS DATETIME);
SELECT birth_date,
CAST(birth_date AS DATETIME),
CONVERT(birth_date,DATETIME)
FROM customers;

SELECT first_name,
CAST(first_name AS DECIMAl)
FROM customers;`














