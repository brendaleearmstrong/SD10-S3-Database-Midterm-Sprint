-- Equipment table
CREATE TABLE Equipment (
    Equipment_ID SERIAL PRIMARY KEY,
    Equipment_Name VARCHAR(100) NOT NULL,
    Purchase_Date DATE NOT NULL,
    Availability_Status VARCHAR(20) NOT NULL CHECK (Availability_Status IN ('Available', 'In Use', 'Maintenance', 'Out of Order'))
);
