
-- Certifications table
CREATE TABLE Certifications (
    Certification_ID SERIAL PRIMARY KEY,
    Certification_Name VARCHAR(100) UNIQUE NOT NULL,
    Certification_Description TEXT,
    Issuing_Organization VARCHAR(100) NOT NULL,
    Certification_Level VARCHAR(50) CHECK (Certification_Level IN ('Certificate', 'Degree', 'Masters Degree', 'Micro-credential', 'Certification'))
);







