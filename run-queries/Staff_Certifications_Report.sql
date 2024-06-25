/* Query 10 - List All Staff Members with Their Certifications
This query lists all staff members along with their certifications, including the staff member's name, position, and the certification details..*/

SELECT
    pi.First_Name,
    pi.Last_Name,
    s.Position,
    c.Certification_Name,
    c.Certification_Description,
    c.Issuing_Organization,
    c.Certification_Level
FROM
    Staff s
JOIN
    Person_Information pi ON s.Person_ID = pi.Person_ID
JOIN
    Employee_Certifications sc ON s.Staff_ID = sc.Staff_ID
JOIN
    Certifications c ON sc.Certification_ID = c.Certification_ID
ORDER BY
    pi.Last_Name, pi.First_Name;
