#World Life Expectancy Project (Data Cleaning)

SELECT *
FROM  World_Life_expectancy. worldlifexpectancy;

#1) removing duplicates:
#identifying duplicates
SELECT Country,Year, CONCAT(Country,Year), COUNT(CONCAT(Country,Year))
FROM  World_Life_expectancy. worldlifexpectancy
GROUP BY Country,Year, CONCAT(Country,Year)
HAVING COUNT(CONCAT(Country,Year)) > 1;

SELECT Row_ID,
CONCAT(Country,Year),
ROW_NUMBER() OVER(PARTITION BY CONCAT(Country,Year) ORDER BY CONCAT(Country,Year)) AS Row_Num
FROM worldlifexpectancy;

#cannot directly filter by the above SQL, so lets put the entire query in the FROM statement.
SELECT *
FROM (
	SELECT Row_ID,
CONCAT(Country,Year),
ROW_NUMBER() OVER(PARTITION BY CONCAT(Country,Year) ORDER BY CONCAT(Country,Year)) AS Row_Num
FROM worldlifexpectancy
) AS Row_Table
WHERE Row_Num > 1
;
# deleting the rows with duplicate values:
DELETE FROM worldlifexpectancy
WHERE Row_ID IN(
	SELECT Row_ID
FROM (
	SELECT Row_ID,
CONCAT(Country,Year),
ROW_NUMBER() OVER(PARTITION BY CONCAT(Country,Year) ORDER BY CONCAT(Country,Year)) AS Row_Num
FROM worldlifexpectancy
) AS Row_Table
WHERE Row_Num > 1
);

# 2) Null values

SELECT *
FROM  World_Life_expectancy. worldlifexpectancy
WHERE Status = '' 
;
#trying to pull the status column of different rows in here, find what kind of values it has 
SELECT DISTINCT(Status)
FROM  World_Life_expectancy. worldlifexpectancy
WHERE Status <> '' 
;
# it has either developed or developing columns:
SELECT DISTINCT(Country)
FROM  World_Life_expectancy. worldlifexpectancy
WHERE Status = 'Developing'
;
# so, if the above countries have no status , we can set it to developing
UPDATE worldlifexpectancy
SET Status='Developing'
WHERE Country IN(
	SELECT DISTINCT(Country)
FROM  World_Life_expectancy. worldlifexpectancy
WHERE Status = 'Developing');
#the above query did'nt work, so we gonna join the table to itself where 
UPDATE worldlifexpectancy t1
JOIN worldlifexpectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developing'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status ='Developing';

SELECT *
FROM  World_Life_expectancy. worldlifexpectancy
WHERE Country = 'United States of America';

UPDATE worldlifexpectancy t1
JOIN worldlifexpectancy t2
	ON t1.Country = t2.Country
SET t1.Status = 'Developed'
WHERE t1.Status = ''
AND t2.Status <> ''
AND t2.Status ='Developed';

#NUlls from 'Lifeexpectancy' column
SELECT *
FROM  World_Life_expectancy. worldlifexpectancy
WHERE `Lifeexpectancy` = '' ;
;
#averaging the columns above and below the column of the Null Value and replace the null with the result
SELECT Country, Year, `Lifeexpectancy`
FROM  World_Life_expectancy. worldlifexpectancy
;

SELECT t1.Country, t1.Year, t1.`Lifeexpectancy`,
t2.Country, t2.Year, t2.`Lifeexpectancy`,
t3.Country, t3.Year, t3.`Lifeexpectancy`,
ROUND((t2.`Lifeexpectancy`+ t3.`Lifeexpectancy`)/2,1)
FROM  World_Life_expectancy. worldlifexpectancy t1
JOIN World_Life_expectancy. worldlifexpectancy t2
	ON t1.Country = t2.Country
    AND t1.year=t2.year-1
JOIN World_Life_expectancy. worldlifexpectancy t3
	ON t1.Country = t3.Country
    AND t1.year=t3.year+1
WHERE t1.`Lifeexpectancy`=''
;

UPDATE World_Life_expectancy. worldlifexpectancy t1
JOIN World_Life_expectancy. worldlifexpectancy t2
	ON t1.Country = t2.Country
    AND t1.year=t2.year-1
JOIN World_Life_expectancy. worldlifexpectancy t3
	ON t1.Country = t3.Country
    AND t1.year=t3.year+1
SET t1.`Lifeexpectancy` = ROUND((t2.`Lifeexpectancy`+ t3.`Lifeexpectancy`)/2,1)
WHERE t1.`Lifeexpectancy`='';

#No more blanks












