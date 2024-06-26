-- Create a view for sales trend report of all shakes
CREATE VIEW vw_Protein_Shake_Sales_Trend_Report AS
SELECT
    s.Supplement_ID,
    s.Supplement_Name,
    SUM(ri.Quantity) AS Total_Quantity_Sold,
    SUM(ri.Item_Total) AS Total_Revenue
FROM
    Receipt_Item ri
JOIN
    Supplements s ON ri.Supplement_ID = s.Supplement_ID
WHERE
    s.Supplement_Name LIKE '%Shake%'
GROUP BY
    s.Supplement_ID,
    s.Supplement_Name
ORDER BY
    s.Supplement_Name;

-- Select from the view to see the report
SELECT * FROM vw_Protein_Shake_Sales_Trend_Report ;
