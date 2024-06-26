-- Services Table
CREATE TABLE Services (
    Service_ID SERIAL PRIMARY KEY,
    Service_Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Duration INT,
    Price_ID INT NOT NULL,
    Is_Taxable BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (Price_ID) REFERENCES Price(Price_ID)
);



