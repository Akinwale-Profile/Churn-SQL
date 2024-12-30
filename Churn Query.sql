SELECT Gender,Count(Gender)asTotalCount,
Count(Gender)* 1.0 /(Select Count(*)fromstg_Churn)as Percentage
from stg_Churn
Group by Gender

SELECT Contract,Count(Contract)asTotalCount,
Count(Contract)* 1.0 /(Select Count(*)fromstg_Churn)as Percentage
from stg_Churn
Group by Contract


SELECT Customer_Status,Count(Customer_Status)as TotalCount Sum(Total_Revenue)as TotalRev,
Sum(Total_Revenue)/(Select sum(Total_Revenue)from stg_Churn) *100  as RevPercentage
from stg_Churn
Group by Customer_Status

SELECT State,Count(State)as TotalCount,
Count(State)* 1.0 /(Select Count(*)from stg_Churn)as Percentage
from stg_Churn
Group by State
Order by Percentage desc


SELECT
SUM(CASE WHEN Customer_ID IS NULL THEN 1 ELSE 0 END)AS Customer_ID_Null_Count,
SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END)AS Gender_Null_Count,
SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END)AS Age_Null_Count,
SUM(CASE WHEN Married IS NULL THEN 1 ELSE 0 END)AS Married_Null_Count,
SUM(CASE WHEN State IS NULL THEN 1 ELSE 0 END)AS State_Null_Count,
SUM(CASE WHEN Number_of_Referrals IS NULL THEN 1 ELSE 0 END)AS Number_of_Referrals_Null_Count,
SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END)AS Tenure_in_Months_Null_Count,
SUM(CASE WHEN Value_Deal IS NULL THEN 1 ELSE 0 END)AS Value_Deal_Null_Count,
SUM(CASE WHEN Phone_Service IS NULL THEN 1 ELSE 0 END)AS Phone_Service_Null_Count,
SUM(CASE WHEN Multiple_Lines IS NULL THEN 1 ELSE 0 END)AS Multiple_Lines_Null_Count,
SUM(CASE WHEN Internet_Service IS NULL THEN 1 ELSE 0 END)AS Internet_Service_Null_Count,
SUM(CASE WHEN Internet_Type IS NULL THEN 1 ELSE 0 END)AS Internet_Type_Null_Count,
SUM(CASE WHEN Online_Security IS NULL THEN 1 ELSE 0 END)AS Online_Security_Null_Count,
SUM(CASE WHEN Online_Backup IS NULL THEN 1 ELSE 0 END)AS Online_Backup_Null_Count,
SUM(CASE WHEN Device_Protection_Plan IS NULL THEN 1 ELSE 0 END)AS Device_Protection_Plan_Null_Count,
SUM(CASE WHEN Premium_Support IS NULL THEN 1 ELSE 0 END)AS Premium_Support_Null_Count,
SUM(CASE WHEN Streaming_TV IS NULL THEN 1 ELSE 0 END)AS Streaming_TV_Null_Count,
SUM(CASE WHEN Streaming_Movies IS NULL THEN 1 ELSE 0 END)AS Streaming_Movies_Null_Count,
SUM(CASE WHEN Streaming_Music IS NULL THEN 1 ELSE 0 END)AS Streaming_Music_Null_Count,
SUM(CASE WHEN Unlimited_Data IS NULL THEN 1 ELSE 0 END)AS Unlimited_Data_Null_Count,
SUM(CASE WHEN Contract IS NULL THEN 1 ELSE 0 END)AS Contract_Null_Count,
SUM(CASE WHEN Paperless_Billing IS NULL THEN 1 ELSE 0 END)AS Paperless_Billing_Null_Count,
SUM(CASE WHEN Payment_Method IS NULL THEN 1 ELSE 0 END)AS Payment_Method_Null_Count,
SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END)AS Monthly_Charge_Null_Count,
SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END)AS Total_Charges_Null_Count,
SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END)AS Total_Refunds_Null_Count,
SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END)ASTotal_Extra_Data_Charges_Null_Count,
SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END)AS Total_Long_Distance_Charges_Null_Count,
SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END)AS Total_Revenue_Null_Count,
SUM(CASE WHEN Customer_Status IS NULL THEN 1 ELSE 0 END)AS Customer_Status_Null_Count,
SUM(CASE WHEN Churn_Category IS NULL THEN 1 ELSE 0 END)AS Churn_Category_Null_Count,
SUM(CASE WHEN Churn_Reason IS NULL THEN 1 ELSE 0 END)AS Churn_Reason_Null_Count
FROM stg_Churn;

SELECT
Customer_ID,
    Gender,
    Age,
    Married,
State,
Number_of_Referrals,
Tenure_in_Months,
ISNULL(Value_Deal,'None')ASValue_Deal,
Phone_Service,
ISNULL(Multiple_Lines,'No')AsMultiple_Lines,
Internet_Service,
ISNULL(Internet_Type,'None')ASInternet_Type,
ISNULL(Online_Security,'No')ASOnline_Security,
ISNULL(Online_Backup,'No')ASOnline_Backup,
ISNULL(Device_Protection_Plan,'No')ASDevice_Protection_Plan,
ISNULL(Premium_Support,'No')ASPremium_Support,
ISNULL(Streaming_TV,'No')ASStreaming_TV,
ISNULL(Streaming_Movies,'No')ASStreaming_Movies,
ISNULL(Streaming_Music,'No')ASStreaming_Music,
ISNULL(Unlimited_Data,'No')ASUnlimited_Data,
Contract,
Paperless_Billing,
Payment_Method,
Monthly_Charge,
Total_Charges,
Total_Refunds,
Total_Extra_Data_Charges,
Total_Long_Distance_Charges,
Total_Revenue,
Customer_Status,
IS NULL(Churn_Category,'Others')ASChurn_Category,
IS NULL(Churn_Reason,'Others')ASChurn_Reason

INTO [db_Churn].[dbo].[prod_Churn]
FROM [db_Churn].[dbo].[stg_Churn];

