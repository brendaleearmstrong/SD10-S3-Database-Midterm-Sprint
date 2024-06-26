-- Staff table
CREATE TABLE Staff (
    Staff_ID SERIAL PRIMARY KEY,
    Person_ID INT NOT NULL,
    Address_ID INT NOT NULL,
    Salary_ID INT NOT NULL,
    FOREIGN KEY (Person_ID) REFERENCES Person_Information(Person_ID),
    FOREIGN KEY (Staff_Address_ID) REFERENCES Staff_Address(Staff_Address_ID),
    FOREIGN KEY (Salary_ID) REFERENCES Salary(Salary_ID)
);

