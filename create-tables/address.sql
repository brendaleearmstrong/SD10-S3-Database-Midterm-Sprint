-- Address table
CREATE TABLE Address (
    Address_ID SERIAL PRIMARY KEY,
    Street_Name VARCHAR(100) NOT NULL,
    Street_Number VARCHAR(20) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Province_ID INT NOT NULL,
    Postal_Code VARCHAR(20) NOT NULL,
    FOREIGN KEY (Province_ID) REFERENCES Province(Province_ID)
);



