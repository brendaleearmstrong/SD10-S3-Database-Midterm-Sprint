/* Member Activity View */

CREATE VIEW vw_member_activity AS
SELECT 
    m.Member_ID,
    pi.First_Name || ' ' || pi.Last_Name AS Member_Name,
    COUNT(DISTINCT r.Receipt_ID) AS Total_Purchases,
    SUM(r.Total_Amount) AS Total_Spent,
    COUNT(DISTINCT CASE WHEN ri.Fitness_Class_ID IS NOT NULL THEN ri.Fitness_Class_ID END) AS Classes_Attended,
    COUNT(DISTINCT CASE WHEN ri.Service_ID IS NOT NULL THEN ri.Service_ID END) AS Services_Used,
    COUNT(DISTINCT CASE WHEN ri.Supplement_ID IS NOT NULL THEN ri.Supplement_ID END) AS Supplements_Purchased
FROM 
    Membership m
JOIN 
    Person_Information pi ON m.Person_ID = pi.Person_ID
LEFT JOIN 
    Receipt r ON m.Member_ID = r.Member_ID
LEFT JOIN 
    Receipt_Item ri ON r.Receipt_ID = ri.Receipt_ID
GROUP BY 
    m.Member_ID, pi.First_Name, pi.Last_Name;
	
select * from vw_member_activity;