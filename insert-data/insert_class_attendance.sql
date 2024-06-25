-- Insert sample data into Class_Attendance
INSERT INTO Class_Attendance (Class_ID, Person_ID, Attendance_Date)
SELECT
  (SELECT Class_ID FROM Fitness_Class ORDER BY RANDOM() LIMIT 1),
  Person_ID,
  NOW() - INTERVAL '1 day' * ROUND(RANDOM() * 365)
FROM
  Person_Information
ORDER BY
  RANDOM()
LIMIT 100;

select * from class_attendance;
