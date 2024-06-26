-- Equipment_Maintenance table
CREATE TABLE Equipment_Maintenance (
    Maintenance_ID SERIAL PRIMARY KEY,
    Equipment_ID INT NOT NULL,
    Maintenance_Date DATE NOT NULL,
    Description TEXT,
    Performed_By INT,
    FOREIGN KEY (Equipment_ID) REFERENCES Equipment(Equipment_ID),
    FOREIGN KEY (Performed_By) REFERENCES Staff(Staff_ID)
);






