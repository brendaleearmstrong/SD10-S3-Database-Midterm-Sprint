-- Tax table based on 15% tax
CREATE TABLE Tax (
    Tax_ID SERIAL PRIMARY KEY,
    Tax_Name VARCHAR(50) UNIQUE NOT NULL,
    Tax_Rate DECIMAL(5, 2) NOT NULL CHECK (Tax_Rate >= 0 AND Tax_Rate <= 100),
    Is_Active BOOLEAN DEFAULT TRUE,
    Effective_Date DATE NOT NULL,
    Description TEXT
);

