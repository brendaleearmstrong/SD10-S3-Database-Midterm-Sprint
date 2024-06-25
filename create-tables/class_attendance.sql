-- Create Class_Attendance table
CREATE TABLE Class_Attendance (
    Attendance_ID SERIAL PRIMARY KEY,
    Class_ID INT NOT NULL,
    Person_ID INT NOT NULL,
    Attendance_Date DATE,
    FOREIGN KEY (Class_ID) REFERENCES Fitness_Class(Class_ID),
    FOREIGN KEY (Person_ID) REFERENCES Person_Information(Person_ID)
);

select * from class_attendance;