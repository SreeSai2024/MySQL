SELECT * 
FROM USHouseholdIncome;

SELECT *
FROM ushouseholdincome_statistics;

SELECT COUNT(id)
FROM USHouseholdIncome;

SELECT COUNT(id)
FROM ushouseholdincome_statistics;

#finding duplicates in the id's
SELECT id, COUNT(id)
FROM USHouseholdIncome
GROUP BY id
HAVING COUNT(id)>1
;

#deleting the duplicate rows from the table:
DELETE FROM USHouseholdIncome
WHERE row_id IN (
SELECT row_id
FROM 
(SELECT row_id, 
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM USHouseholdIncome) AS duplicates
WHERE row_num >1)
;

#Finding the duplicates in the other table
SELECT id, COUNT(id)
FROM ushouseholdincome_statistics
GROUP BY id
HAVING COUNT(id)>1
;

SELECT State_Name, COUNT(State_Name)
FROM USHouseholdIncome
GROUP BY State_Name;
#it is considering the same state names with different caps lock as diff states

UPDATE USHouseholdIncome
SET State_Name ="Georgia"
WHERE State_Name ="georgia";

UPDATE USHouseholdIncome
SET State_Name ="Alabama"
WHERE State_Name ="alabama";

SELECT DISTINCT State_ab
FROM USHouseholdIncome
ORDER BY 1
;

SELECT *
FROM USHouseholdIncome
WHERE County='Autauga County'
ORDER BY 1
;

UPDATE USHouseholdIncome
SET Place = 'Autaugaville'
WHERE City='Vinemont'
AND County='Autauga County'
;

SELECT Type, COUNT(Type)
FROM USHouseholdIncome
GROUP BY Type
;

UPDATE USHouseholdIncome
SET Type = 'Borough'
WHERE Type = 'Boroughs'
;

SELECT ALand, AWater
FROM USHouseholdIncome
WHERE AWater = 0 OR AWater = '' OR AWater IS NULL  OR ALand = 0 OR ALand = '' OR ALand IS NULL
;











