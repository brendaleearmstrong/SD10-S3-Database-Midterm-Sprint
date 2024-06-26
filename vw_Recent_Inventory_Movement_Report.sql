-- Create the view for recent inventory movement report
CREATE VIEW vw_Recent_Inventory_Movement_Report AS
SELECT 
    il.Log_ID,
    s.Supplement_Name,
    il.Change_Amount,
    il.New_Stock_Amount,
    il.Log_Date,
    pi.First_Name || ' ' || pi.Last_Name AS Staff_Name,
    il.Log_Type,
    il.Notes
FROM 
    Inventory_Log il
JOIN 
    Supplements s ON il.Supplement_ID = s.Supplement_ID
LEFT JOIN 
    Staff st ON il.Staff_ID = st.Staff_ID
LEFT JOIN 
    Person_Information pi ON st.Person_ID = pi.Person_ID
ORDER BY 
    il.Log_Date DESC
LIMIT 50;

-- Select from the view to see the report
SELECT * FROM vw_Recent_Inventory_Movement_Report;
