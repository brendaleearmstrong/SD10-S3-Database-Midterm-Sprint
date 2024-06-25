-- Query #3 Monthly Revenue Analysis by Category
/* This query provides a comprehensive view of how different product categories are contributing to revenue over time. 
It can help identify trends in product popularity and overall revenue patterns. */

WITH SalesByCategory AS (
    SELECT 
        CASE
            WHEN ri.Supplement_ID IS NOT NULL THEN 'Supplements'
            WHEN ri.Fitness_Class_ID IS NOT NULL THEN 'Classes'
            WHEN ri.Service_ID IS NOT NULL THEN 'Services'
            ELSE 'Other'
        END AS Category,
        DATE_TRUNC('month', r.Receipt_Date) AS Month,
        SUM(ri.Item_Total) AS Category_Revenue
    FROM 
        Receipt_Item ri
    JOIN 
        Receipt r ON ri.Receipt_ID = r.Receipt_ID
    GROUP BY 
        Category, Month
),
TotalRevenue AS (
    SELECT 
        Month,
        SUM(Category_Revenue) AS Total_Revenue
    FROM 
        SalesByCategory
    GROUP BY 
        Month
)
SELECT 
    sbc.Month,
    sbc.Category,
    sbc.Category_Revenue,
    tr.Total_Revenue,
    ROUND((sbc.Category_Revenue / tr.Total_Revenue * 100), 2) AS Percentage_of_Total
FROM 
    SalesByCategory sbc
JOIN 
    TotalRevenue tr ON sbc.Month = tr.Month
ORDER BY 
    sbc.Month, sbc.Category_Revenue DESC;