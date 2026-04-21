CREATE OR REPLACE TABLE `FICA_Project.Fact_FICA_Alerts` AS
WITH Scored_Clients AS (
  SELECT ID_Number, Full_Name, Province, KYC_Status, Risk_Rating,
     CASE
       WHEN (KYC_Status = 'Expired' AND Risk_Rating > 8) THEN 'RED ALERT'
       WHEN (KYC_Status = 'Pending' OR Risk_Rating BETWEEN 5.0 AND 8.0) THEN 'AMBER WATCH'
       ELSE 'COMPLIANT'
       END AS FICA_Priority
  FROM `FICA_Project.Dim_Clients_Large`
)
SELECT
  *
FROM
  Scored_Clients
WHERE
  FICA_Priority != 'COMPLIANT'


CREATE OR REPLACE VIEW `FICA_Project.vw_Province_Risk_Summary` AS
SELECT
  Province, COUNT(ID_Number) AS Total_People, ROUND((((COUNTIF(FICA_Priority = 'RED ALERT') * 1.00) / COUNT(*)) * 100), 2) AS Red_Alert_Pct, ROUND(AVG(Risk_Rating), 2) AS Avg_Risk_Rating, MAX(Risk_Rating) AS Top_Rating
FROM
  `FICA_Project.Fact_FICA_Alerts`
GROUP BY
  Province


SELECT
  *
FROM
  `FICA_Project.Fact_FICA_Alerts`
WHERE
  (FICA_Priority = 'RED ALERT' AND Risk_Rating < 8.0)