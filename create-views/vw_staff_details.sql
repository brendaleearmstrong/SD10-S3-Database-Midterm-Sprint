/* Staff Details View */

CREATE VIEW vw_staff_details AS
SELECT 
    s.Staff_ID,
    pi.First_Name,
    pi.Last_Name,
    pi.Email,
    a.City,
    p.Province_Name,
    sa.Salary_Amount,
    COUNT(DISTINCT ec.Certification_ID) AS Certification_Count
FROM 
    Staff s
JOIN 
    Person_Information pi ON s.Person_ID = pi.Person_ID
JOIN 
    Salary sa ON s.Salary_ID = sa.Salary_ID
LEFT JOIN 
    Employee_Certifications ec ON s.Staff_ID = ec.Staff_ID
JOIN 
    Staff_Address a ON s.Staff_Address_ID = a.Staff_Address_ID
JOIN 
    Province p ON a.Province_ID = p.Province_ID
GROUP BY 
    s.Staff_ID, pi.First_Name, pi.Last_Name, pi.Email, a.City, p.Province_Name, sa.Salary_Amount;

-- View All Staff Details
SELECT * FROM vw_staff_details;
