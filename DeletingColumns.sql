#Deleting Unused columns

SELECT *
FROM customer_sweepstakes;

ALTER TABLE customer_sweepstakes
DROP COLUMN address;