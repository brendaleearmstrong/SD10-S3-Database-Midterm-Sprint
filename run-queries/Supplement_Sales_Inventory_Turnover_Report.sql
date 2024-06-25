/* Query #5 - Supplement Sales and Inventory Turnover Trend Report 
This query analyzes the sales and inventory turnover of supplements. */

WITH SupplementSales AS (
    SELECT 
        s.Supplement_ID,
        s.Supplement_Name,
        SUM(ri.Quantity) AS Total_Sold,
        SUM(ri.Item_Total) AS Total_Revenue
    FROM 
        Supplements s
    LEFT JOIN 
        Receipt_Item ri ON s.Supplement_ID = ri.Supplement_ID
    GROUP BY 
        s.Supplement_ID, s.Supplement_Name
)
SELECT 
    ss.Supplement_ID,
    ss.Supplement_Name,
    s.Stock_Amount AS Current_Stock,
    ss.Total_Sold,
    ss.Total_Revenue,
    ROUND(ss.Total_Sold::DECIMAL / NULLIF(s.Stock_Amount, 0), 2) AS Turnover_Rate,
    CASE 
        WHEN s.Stock_Amount = 0 THEN 'Out of Stock'
        WHEN ss.Total_Sold = 0 THEN 'No Sales'
        ELSE (s.Stock_Amount::DECIMAL / ss.Total_Sold * 30)::INT || ' days'
    END AS Estimated_Stock_Duration
FROM 
    SupplementSales ss
JOIN 
    Supplements s ON ss.Supplement_ID = s.Supplement_ID
ORDER BY 
    Turnover_Rate DESC NULLS LAST;