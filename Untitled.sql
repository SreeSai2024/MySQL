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

SELECT *
FROM 
(SELECT row_id, 
id,
ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
FROM USHouseholdIncome) AS duplicates
WHERE row_num >1
;







