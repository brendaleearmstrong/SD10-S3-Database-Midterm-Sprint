/* Query #4 - Equipment Maintence Schedule Report
This query shows upcoming and overdue equipment maintenance.*/

SELECT 
    e.Equipment_ID,
    e.Equipment_Name,
    e.Purchase_Date,
    e.Availability_Status,
    COALESCE(MAX(em.Maintenance_Date), e.Purchase_Date) AS Last_Maintenance_Date,
    COALESCE(MAX(em.Maintenance_Date), e.Purchase_Date) + INTERVAL '90 days' AS Next_Scheduled_Maintenance,
    CASE 
        WHEN COALESCE(MAX(em.Maintenance_Date), e.Purchase_Date) + INTERVAL '90 days' < CURRENT_DATE THEN 'Overdue'
        WHEN COALESCE(MAX(em.Maintenance_Date), e.Purchase_Date) + INTERVAL '90 days' <= CURRENT_DATE + INTERVAL '7 days' THEN 'Due Soon'
        ELSE 'Scheduled'
    END AS Maintenance_Status
FROM 
    Equipment e
LEFT JOIN 
    Equipment_Maintenance em ON e.Equipment_ID = em.Equipment_ID
GROUP BY 
    e.Equipment_ID, e.Equipment_Name, e.Purchase_Date, e.Availability_Status
ORDER BY 
    Maintenance_Status,
    Next_Scheduled_Maintenance;