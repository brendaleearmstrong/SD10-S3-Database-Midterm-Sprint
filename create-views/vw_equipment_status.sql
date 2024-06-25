/* Equipment Status View */

CREATE VIEW vw_equipment_status AS
SELECT 
    e.Equipment_ID,
    e.Equipment_Name,
    e.Purchase_Date,
    e.Availability_Status,
    COALESCE(MAX(em.Maintenance_Date), e.Purchase_Date) AS Last_Maintenance_Date,
    COALESCE(MAX(em.Maintenance_Date), e.Purchase_Date) + INTERVAL '90 days' AS Next_Scheduled_Maintenance
FROM 
    Equipment e
LEFT JOIN 
    Equipment_Maintenance em ON e.Equipment_ID = em.Equipment_ID
GROUP BY 
    e.Equipment_ID, e.Equipment_Name, e.Purchase_Date, e.Availability_Status;
	
select * from vw_equipment_status;