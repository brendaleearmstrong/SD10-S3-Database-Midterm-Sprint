-- Top 5 Selling Products by Quarter
-- This query identifies the top 5 selling products (supplements) for each quarter, including the quantity sold and total revenue generated.

WITH QuarterlySales AS (
    SELECT 
        DATE_TRUNC('quarter', r.Receipt_Date) AS Quarter,
        s.Supplement_Name,
        SUM(ri.Quantity) AS Total_Quantity,
        SUM(ri.Item_Total) AS Total_Revenue,
        ROW_NUMBER() OVER (PARTITION BY DATE_TRUNC('quarter', r.Receipt_Date) 
                           ORDER BY SUM(ri.Quantity) DESC) AS Rank
    FROM 
        Receipt_Item ri
    JOIN 
        Receipt r ON ri.Receipt_ID = r.Receipt_ID
    JOIN 
        Supplements s ON ri.Supplement_ID = s.Supplement_ID
    WHERE 
        ri.Supplement_ID IS NOT NULL
    GROUP BY 
        Quarter, s.Supplement_Name
)
SELECT 
    Quarter,
    Supplement_Name,
    Total_Quantity,
    Total_Revenue
FROM 
    QuarterlySales
WHERE 
    Rank <= 5
ORDER BY 
    Quarter, Rank;