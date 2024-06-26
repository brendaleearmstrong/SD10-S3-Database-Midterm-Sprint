-- Employee_Certifications table
CREATE TABLE Employee_Certifications (
    Employee_Certification_ID SERIAL PRIMARY KEY,
    Staff_ID INT NOT NULL,
    Certification_ID INT NOT NULL,
    Date_Obtained DATE NOT NULL,
    Expiration_Date DATE,
    Certificate_Number VARCHAR(50),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Certification_ID) REFERENCES Certifications(Certification_ID),
    UNIQUE (Staff_ID, Certification_ID, Certificate_Number)
);









