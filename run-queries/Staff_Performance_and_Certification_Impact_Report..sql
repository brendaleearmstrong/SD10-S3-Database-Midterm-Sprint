/* Query 9 - Staff Performance and Certification Impact Report
This report analyzes how staff certifications correlate with class popularity and revenue generation.*/

WITH StaffCertifications AS (
    SELECT 
        s.Staff_ID,
        pi.First_Name || ' ' || pi.Last_Name AS Staff_Name,
        COUNT(DISTINCT ec.Certification_ID) AS Certification_Count,
        STRING_AGG(c.Certification_Name, ', ') AS Certifications
    FROM 
        Staff s
    JOIN 
        Person_Information pi ON s.Person_ID = pi.Person_ID
    LEFT JOIN 
        Employee_Certifications ec ON s.Staff_ID = ec.Staff_ID
    LEFT JOIN 
        Certifications c ON ec.Certification_ID = c.Certification_ID
    GROUP BY 
        s.Staff_ID, pi.First_Name, pi.Last_Name
),
ClassPerformance AS (
    SELECT 
        fc.Staff_ID,
        COUNT(DISTINCT fc.Class_ID) AS Classes_Taught,
        COALESCE(SUM(ri.Quantity), 0) AS Total_Attendees,
        COALESCE(SUM(ri.Item_Total), 0) AS Total_Revenue
    FROM 
        Fitness_Class fc
    LEFT JOIN 
        Receipt_Item ri ON fc.Class_ID = ri.Fitness_Class_ID
    GROUP BY 
        fc.Staff_ID
)
SELECT 
    sc.Staff_Name,
    sc.Certification_Count,
    sc.Certifications,
    cp.Classes_Taught,
    cp.Total_Attendees,
    cp.Total_Revenue,
    ROUND(cp.Total_Attendees::DECIMAL / NULLIF(cp.Classes_Taught, 0), 2) AS Avg_Attendees_Per_Class,
    ROUND(cp.Total_Revenue::DECIMAL / NULLIF(cp.Classes_Taught, 0), 2) AS Avg_Revenue_Per_Class
FROM 
    StaffCertifications sc
LEFT JOIN 
    ClassPerformance cp ON sc.Staff_ID = cp.Staff_ID
ORDER BY 
    cp.Total_Revenue DESC NULLS LAST;