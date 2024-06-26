-- Brands table
CREATE TABLE Brands (
    Brand_ID SERIAL PRIMARY KEY,
    Brand_Name VARCHAR(100) UNIQUE NOT NULL,
    Brand_Description TEXT
);





