SELECT *
FROM USHouseholdIncome;

#Top 10 states with the highest land area
SELECT State_Name,SUM(ALand), SUM(AWater)
FROM USHouseholdIncome
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

SELECT u.State_Name, County, Type, `Primary`, Mean, Median
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
ON u.id=us.id
WHERE Mean <> 0;

#Working on the Categorical Data
SELECT u.State_Name,ROUND(AVG(Mean),1),ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
ON u.id=us.id
GROUP BY u.State_Name
ORDER BY 2;

#finding the 10 highest earning states in USA
SELECT u.State_Name,ROUND(AVG(Mean),1),ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
ON u.id=us.id
GROUP BY u.State_Name
ORDER BY 2 DESC
LIMIT 10;

#finding the 10 highest median incomes in the USA
SELECT u.State_Name,ROUND(AVG(Mean),1),ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
ON u.id=us.id
GROUP BY u.State_Name
ORDER BY 3 DESC
LIMIT 10;

#finding the lowest and highest salaries based on county's
SELECT Type,COUNT(Type), ROUND(AVG(Mean),1),ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
ON u.id=us.id
WHERE Mean <> 0
GROUP BY Type
ORDER BY 3 DESC
LIMIT 20
;

#finding the state with the lowest income, based on the type found in the previous snippet
SELECT *
FROM USHouseholdIncome
WHERE Type='Community';

#finding the outliers:
SELECT Type,COUNT(Type), ROUND(AVG(Mean),1),ROUND(AVG(Median),1)
FROM USHouseholdIncome u
INNER JOIN ushouseholdincome_statistics us
ON u.id=us.id
WHERE Mean <> 0
GROUP BY Type
HAVING COUNT(Type) > 100
ORDER BY 3 DESC
LIMIT 20
;


#finding the highest incomes cities in the states 
SELECT u.State_Name, City, ROUND(AVG(Mean),1)
FROM USHouseholdIncome u
JOIN ushouseholdincome_statistics us
	ON u.id=us.id
GROUP BY u.State_Name, City
ORDER BY 3 DESC
LIMIT 10;











