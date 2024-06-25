/* Query #8 - Service Type Popularity and Profitability Analysis
This report examines the popularity and profitability of different service types offered by NewfoundFitness.*/

WITH ServicePerformance AS (
    SELECT 
        s.Service_ID,
        s.Service_Name,
        COUNT(ri.Receipt_Item_ID) AS Times_Booked,
        SUM(ri.Quantity) AS Total_Units_Sold,
        SUM(ri.Item_Total) AS Total_Revenue,
        AVG(ri.Item_Total / ri.Quantity) AS Avg_Price_Per_Unit
    FROM 
        Services s
    LEFT JOIN 
        Receipt_Item ri ON s.Service_ID = ri.Service_ID
    GROUP BY 
        s.Service_ID, s.Service_Name
),
ServiceRanking AS (
    SELECT 
        *,
        RANK() OVER (ORDER BY Total_Revenue DESC) AS Revenue_Rank,
        RANK() OVER (ORDER BY Times_Booked DESC) AS Popularity_Rank
    FROM 
        ServicePerformance
),
OverallRanking AS (
    SELECT 
        *,
        (Revenue_Rank + Popularity_Rank) / 2.0 AS Overall_Performance_Score
    FROM 
        ServiceRanking
)
SELECT 
    Service_Name,
    Times_Booked,
    Total_Units_Sold,
    ROUND(Total_Revenue, 2) AS Total_Revenue,
    ROUND(Avg_Price_Per_Unit, 2) AS Avg_Price_Per_Unit,
    Revenue_Rank,
    Popularity_Rank,
    ROUND(Overall_Performance_Score, 1) AS Overall_Performance_Score
FROM 
    OverallRanking
ORDER BY 
    Overall_Performance_Score DESC,
    Revenue_Rank DESC,
    Popularity_Rank DESC,
    Total_Revenue DESC,
    Times_Booked DESC,
    Total_Units_Sold DESC,
    Avg_Price_Per_Unit DESC;
