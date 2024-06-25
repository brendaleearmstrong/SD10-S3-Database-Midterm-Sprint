/* Sales Summary View */

CREATE VIEW vw_sales_summary AS
SELECT 
    DATE_TRUNC('day', r.Receipt_Date) AS Sale_Date,
    COUNT(DISTINCT r.Receipt_ID) AS Total_Transactions,
    SUM(r.Total_Amount) AS Total_Revenue,
    SUM(CASE WHEN ri.Supplement_ID IS NOT NULL THEN ri.Item_Total ELSE 0 END) AS Supplement_Revenue,
    SUM(CASE WHEN ri.Fitness_Class_ID IS NOT NULL THEN ri.Item_Total ELSE 0 END) AS Class_Revenue,
    SUM(CASE WHEN ri.Service_ID IS NOT NULL THEN ri.Item_Total ELSE 0 END) AS Service_Revenue
FROM 
    Receipt r
JOIN 
    Receipt_Item ri ON r.Receipt_ID = ri.Receipt_ID
GROUP BY 
    DATE_TRUNC('day', r.Receipt_Date);
	
select * from vw_sales_summary;