-- Fitness_Class table
CREATE TABLE Fitness_Class (
    Class_ID SERIAL PRIMARY KEY,
    Staff_ID INT NOT NULL,
    Price_ID INT NOT NULL,
    Maximum_Capacity INT NOT NULL CHECK (Maximum_Capacity > 0),
    Class_Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Duration INT NOT NULL CHECK (Duration > 0),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Price_ID) REFERENCES Price(Price_ID)
);


