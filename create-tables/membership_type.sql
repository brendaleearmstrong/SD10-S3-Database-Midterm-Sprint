-- Membership_Type table
CREATE TABLE Membership_Type (
    Membership_Type_ID SERIAL PRIMARY KEY,
    Type_Name VARCHAR(50) UNIQUE NOT NULL,
    Description TEXT
);
