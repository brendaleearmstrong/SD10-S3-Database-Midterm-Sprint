/* Member Overview View */

CREATE VIEW vw_member_overview AS
SELECT 
    m.Member_ID,
    pi.First_Name,
    pi.Last_Name,
    pi.Email,
    mt.Type_Name AS Membership_Type,
    m.Date_Joined,
    m.Expiration_Date,
    a.City,
    p.Province_Name
FROM 
    Membership m
JOIN 
    Person_Information pi ON m.Person_ID = pi.Person_ID
JOIN 
    Membership_Type mt ON m.Membership_Type_ID = mt.Membership_Type_ID
JOIN 
    Address a ON m.Address_ID = a.Address_ID
JOIN 
    Province p ON a.Province_ID = p.Province_ID;