#World Life Expectancy Exploratory Data Analysis EDA:
SELECT *
FROM worldlifexpectancy;

SELECT Country, 
MIN(`Lifeexpectancy`),
MAX(`Lifeexpectancy`),
ROUND(MAX(`Lifeexpectancy`)-MIN(`Lifeexpectancy`),1) AS  Life_Increase_15years
FROM worldlifexpectancy
GROUP BY Country
HAVING MIN(`Lifeexpectancy`)<>0 AND MAX(`Lifeexpectancy`)<>0
ORDER BY Life_Increase_15years ASC
;

SELECT Year, ROUND(AVG(`Lifeexpectancy`),2)
FROM worldlifexpectancy
WHERE `Lifeexpectancy`<>0 
GROUP BY Year
ORDER BY Year
;

#Finding correlation between GDP and Life expectancy
SELECT Country,ROUND(AVG(`Lifeexpectancy`),2) AS Life_exp , ROUND(AVG(GDP),2) AS GDP
FROM worldlifexpectancy
GROUP BY Country
;
# there are few zeros in the GDP, Life expect columns
SELECT Country,ROUND(AVG(`Lifeexpectancy`),2) AS Life_exp , ROUND(AVG(GDP),2) AS GDP
FROM worldlifexpectancy
GROUP BY Country
HAVING Life_exp >0 AND GDP >0
ORDER BY GDP DESC
;
#CONCLUSION: we can see that the GDP and Life_Exp are highly co-related and they are dependent
#for tagging the countries with HIGH GDP and their life-expectancies
SELECT 
SUM(CASE WHEN GDP >=1500 THEN 1 ELSE 0 END) High_GDP_Count,
ROUND(AVG(CASE WHEN GDP >=1500 THEN `Lifeexpectancy` ELSE NULL END),2) High_GDP_Lifeexpectancy,
SUM(CASE WHEN GDP <=1500 THEN 1 ELSE 0 END) Low_GDP_Count,
ROUND(AVG(CASE WHEN GDP <=1500 THEN `Lifeexpectancy` ELSE NULL END),2) Low_GDP_Lifeexpectancy
FROM worldlifexpectancy
ORDER BY GDP
# Low GDP countries have less life-expectnacy when compared with High GDP having High Life-expectancy
;
#Now, lets find the co-relation between Status and life expectancy.
SELECT Status, ROUND(AVG(`Lifeexpectancy`),2) AS avg_life_exp
FROM worldlifexpectancy
GROUP BY Status;

SELECT Country,ROUND(AVG(`Lifeexpectancy`),2) AS Life_Exp,ROUND(AVG(BMI),1) AS BMI
FROM worldlifexpectancy
GROUP BY Country
HAVING Life_Exp>0
AND BMI>0
ORDER BY BMI 
;
#CONCLUSION: Low BMI is seen in more low GDP Countries.alter
#Let's look at the Adult Mortality, rolling total is like cummulative addition of adult mortality
SELECT Country,
Year,
 `Lifeexpectancy`, 
 `AdultMortality`,
 SUM(`AdultMortality`) OVER(PARTITION BY Country ORDER BY Year) AS Rolling_Total 
FROM worldlifexpectancy
;























