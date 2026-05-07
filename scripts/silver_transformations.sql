

--SELECT * 
--FROM bronze.crm_cust_info
--WHERE cst_id = 29466

-- Filter out duplicate customers/old data 

--SELECT 
--* 
--FROM(
--	SELECT 
--	*,
--	ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS cst_rn
--	FROM bronze.crm_cust_info
--)t
--WHERE cst_rn = 1

-- =============== Step 1 =================
-- Comment: Removed all duplicates 

-- Check for unwanted spaces 
SELECT cst_firstname
FROM bronze.crm_cust_info
WHERE cst_firstname != TRIM(cst_firstname)

-- Trim names
SELECT
    [cst_id]
    ,[cst_key]
    ,TRIM([cst_firstname]) AS cst_firstname
    ,TRIM([cst_lastname]) AS cst_firstname
    ,[cst_marital_status]
    ,[cst_gndr]
    ,[cst_create_date]
FROM(
	SELECT 
	*,
	ROW_NUMBER() OVER (PARTITION BY cst_id ORDER BY cst_create_date DESC) AS cst_rn
	FROM bronze.crm_cust_info
)t
WHERE cst_rn = 1

-- =============== Step 2 =================
-- Comment: Trimmed first and last names 

