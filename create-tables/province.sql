
-- Province table
CREATE TABLE Province (
    Province_ID SERIAL PRIMARY KEY,
    Province_Name VARCHAR(50) UNIQUE NOT NULL,
    Province_Code CHAR(2) UNIQUE NOT NULL
);

