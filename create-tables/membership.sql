-- Membership table
CREATE TABLE Membership (
    Member_ID SERIAL PRIMARY KEY,
    Person_ID INT NOT NULL,
    Address_ID INT NOT NULL,
    Price_ID INT NOT NULL,
    Membership_Type_ID INT NOT NULL,
    Membership_Length INT NOT NULL,
    Date_Joined DATE NOT NULL,
    Expiration_Date DATE NOT NULL,
    FOREIGN KEY (Person_ID) REFERENCES Person_Information(Person_ID),
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID),
    FOREIGN KEY (Price_ID) REFERENCES Price(Price_ID),
    FOREIGN KEY (Membership_Type_ID) REFERENCES Membership_Type(Membership_Type_ID)
);
