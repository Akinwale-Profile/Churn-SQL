## Purpose of the Script
The SQL script performs analysis on a dataset stored in a table named stg_Churn. 
The script aims to:
- 	Understand demographic distributions (e.g., gender, state).
-	Analyze customer contract preferences and statuses.
-	Assess revenue contributions by customer segments.
-	Identify data quality issues by counting missing values.
Here's a detailed breakdown of its operations:
1.	Gender Distribution Analysis:
-	Counts the occurrences of each gender.
-	Calculates the percentage of each gender relative to the total number of records in the stg_Churn table.

SELECT Gender,
       Count(Gender) as TotalCount,
       Count(Gender) * 1.0 / (SELECT Count(*) FROM stg_Churn) as Percentage
FROM stg_Churn

GROUP BY Gender;

-	Contract Type Distribution Analysis:
-	Counts the occurrences of each contract type.
-	Calculates the percentage of each contract type relative to the total records.

SELECT Contract,
       Count(Contract) as TotalCount,
       Count(Contract) * 1.0 / (SELECT Count(*) FROM stg_Churn) as Percentage
FROM stg_Churn

GROUP BY Contract;
-	Customer Status and Revenue Analysis:
-	Counts the occurrences of each customer status.
-	Sums up the total revenue for each customer status.
-	Calculates the percentage of revenue contributed by each customer status relative to the total revenue.

SELECT Customer_Status,
       Count(Customer_Status) as TotalCount,
       Sum(Total_Revenue) as TotalRev,
       Sum(Total_Revenue) / (SELECT Sum(Total_Revenue) FROM stg_Churn) * 100 as RevPercentage
FROM stg_Churn

GROUP BY Customer_Status;
-	State-wise Distribution Analysis:
-	Counts the occurrences of each state.
-	Calculates the percentage of records for each state relative to the total records.
-	Orders the results by the percentage in descending order.

SELECT State,
       Count(State) as TotalCount,
       Count(State) * 1.0 / (SELECT Count(*) FROM stg_Churn) as Percentage
FROM stg_Churn
GROUP BY State
ORDER BY Percentage DESC;

-	Null Values Count Analysis:
-	Counts the number of NULL values for each significant column (e.g., Customer_ID, Gender, Age, Married, and State) in the dataset.

SELECT SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
       SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_Null_Count,
       SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age_Null_Count,
       SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END) AS Married_Null_Count,
       SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END) AS State_Null_Count
FROM stg_Churn;

