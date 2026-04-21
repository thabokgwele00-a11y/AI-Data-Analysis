CREATE OR REPLACE TABLE `FICA_Project.Dim_Clients_Large` AS
SELECT 
 
  GENERATE_UUID() as Unique_Entry_ID,
  Full_Name,
  ID_Number,
  Province,
  KYC_Status,
 
  ROUND(Risk_Rating + (RAND() * 2 - 1), 1) as Risk_Rating
FROM `FICA_Project.Dim_Clients`
CROSS JOIN UNNEST(GENERATE_ARRAY(0, 9999)) as multiplier