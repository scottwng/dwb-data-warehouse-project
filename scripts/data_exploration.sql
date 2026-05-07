

SELECT *
FROM bronze.crm_cust_info 

-- Check for Nulls or Duplicates in Primary Key
SELECT 
cst_id,
COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL 

/*
Problems:  
	29449
	29473
	29433
	NULL (appears 3 times)
	29483
	29466
*/