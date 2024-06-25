-- Class Attendance Summary by Fitness Class with Age 
CREATE VIEW vw_Class_Attendance_Summary AS
SELECT
    fc.Class_ID,
    fc.Class_Name,
    pi.Person_ID,
    DATE_PART('year', AGE(pi.Date_of_Birth)) AS Age
FROM
    Fitness_Class fc
JOIN
    Class_Attendance ca ON fc.Class_ID = ca.Class_ID
JOIN
    Person_Information pi ON ca.Person_ID = pi.Person_ID;

-- Query the View
SELECT * FROM vw_Class_Attendance_Summary;