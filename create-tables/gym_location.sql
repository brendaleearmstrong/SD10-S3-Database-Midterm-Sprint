-- Gym_Location table
CREATE TABLE Gym_Location (
    Gym_ID SERIAL PRIMARY KEY,
    Address_ID INT NOT NULL,
    Manager_ID INT NOT NULL,
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID),
    FOREIGN KEY (Manager_ID) REFERENCES Staff(Staff_ID)
);



