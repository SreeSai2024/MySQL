SELECT *
FROM customers
WHERE first_name LIKE '%k%';

SELECT *
FROM customers
WHERE first_name REGEXP 'k';

SELECT first_name, REGEXP_REPLACE(first_name,'a','b')
FROM customers;

SELECT first_name, REGEXP_LIKE(first_name,'a') #returns the number of a is found in the first_name
FROM customers;

SELECT first_name, REGEXP_INSTR(first_name,'a') #returns the index of 'a'
FROM customers;

SELECT first_name, REGEXP_SUBSTR(first_name,'char') #returns the char as substring if present in the string. 
FROM customers;

#Regualar Expression MetaCharacters [=,^$*+?}|
SELECT *
FROM customers
WHERE first_name REGEXP '[a-c]'; # returns the names which has letters within in the range of a-cache index

SELECT *
FROM customers
WHERE total_money_spent REGEXP '[0-9]'; #brackets are must and should while searching for particular pattern in the table

SELECT *
FROM customers
WHERE phone REGEXP '.';#returns the table which has something in the phone column and deleted the rows which doesn't have value in phone

SELECT *
FROM customers
WHERE phone REGEXP '6.';#returns the rows with 6 in phone column and not bothered about the characters followed by 6.

SELECT *
FROM customers
WHERE first_name REGEXP 'k...n'; #same like underscore in LIKE statements

SELECT *
FROM customers
WHERE first_name REGEXP '^k'; #returns the names with k in the beginning

SELECT *
FROM customers
WHERE first_name REGEXP 'n$'; #returns the names with n in the end.

SELECT *
FROM customers
WHERE first_name REGEXP 'Obi.*'; #returns the names with Obi may be 0 occurence or more,but(.)specifies that it has to have some character followed by that.

SELECT *
FROM customers
WHERE first_name REGEXP 'Obi.+';#returns the names with Obi may be 1 occurence or more,but(.)specifies that it has to have some character followed by that.

SELECT *
FROM customers
WHERE first_name REGEXP 'K.?n';#0/1 occurence after kill

SELECT *
FROM customers
WHERE first_name REGEXP 'K.{3}n'; #3 characters in between K and N

SELECT *
FROM customers
WHERE first_name REGEXP 'kev|fno';

#Regular Expression Examples and UseCasesgoogle
USE `bakery`;
CREATE TABLE `z_regular_expression` (
  `reg_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phrase` varchar(150) NOT NULL,
  PRIMARY KEY (`reg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `z_regular_expression` VALUES (1,'123-456-789', 'sqlisfun@gmail.com','I love SQL');
INSERT INTO `z_regular_expression` VALUES (2,'123\765\7565','mysqlpro@apple.com','I love MySQL');
INSERT INTO `z_regular_expression` VALUES (3,'123-846-6546','regxpress@yahoo.com','SQL is fun');
INSERT INTO `z_regular_expression` VALUES (4,'123 545 8657','sql4life@gmail.com','IlikeSQLForReal');

SELECT *
FROM z_regular_expression;

SELECT *
FROM z_regular_expression
WHERE email REGEXP '@gmail';

SELECT email,REGEXP_SUBSTR(email,'@.+') #returns the rows with @ in email, followed by (.) has to have character and + indicates as many as possible
FROM z_regular_expression;

SELECT phone
FROM z_regular_expression
WHERE phone REGEXP '[0-9]{3}-[0-9]{3}-[0-9]{4}';

SELECT *
FROM z_regular_expression
where phrase REGEXP '^SQL' #starts with SQL
;

SELECT *
FROM z_regular_expression
where phrase REGEXP '.+SQL.+' #with SQL must have 1 or more chars in before and after SQL
;








