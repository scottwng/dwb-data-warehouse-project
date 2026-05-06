USE DataWarehouse;
GO

---------------------
---- CRM Dataset ----
---------------------

-- FULL LOAD operation: TRUNCATE -> BULK INSERT 
TRUNCATE TABLE bronze.crm_cust_info; -- first empty table

BULK INSERT bronze.crm_cust_info
FROM 'C:\Users\Scott\Documents\Projects\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE [bronze].[crm_prd_info]; 
BULK INSERT [bronze].[crm_prd_info]
FROM 'C:\Users\Scott\source\repos\dwb-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE [bronze].[crm_sales_details]; -- first empty 
BULK INSERT [bronze].[crm_sales_details]
FROM 'C:\Users\Scott\source\repos\dwb-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

---------------------
---- ERP Dataset ----
---------------------

TRUNCATE TABLE [bronze].[erp_cust_az12]; -- first empty 

BULK INSERT [bronze].[erp_cust_az12]
FROM 'C:\Users\Scott\source\repos\dwb-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE [bronze].[erp_loc_a101]; -- first empty 
BULK INSERT [bronze].[erp_loc_a101]
FROM 'C:\Users\Scott\source\repos\dwb-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);

TRUNCATE TABLE [bronze].[erp_px_cat_g1v2]; -- first empty 
BULK INSERT [bronze].[erp_px_cat_g1v2]
FROM 'C:\Users\Scott\source\repos\dwb-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	TABLOCK
);