
-- Schedule table
CREATE TABLE Schedule (
    Schedule_ID SERIAL PRIMARY KEY,
    Fitness_Class_ID INT NOT NULL,
    Staff_ID INT NOT NULL,
    Start_Time TIMESTAMP NOT NULL,
    End_Time TIMESTAMP NOT NULL,
    FOREIGN KEY (Fitness_Class_ID) REFERENCES Fitness_Class(Class_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    CHECK (End_Time > Start_Time)
);







