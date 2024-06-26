-- Salary table
CREATE TABLE Salary (
    Salary_ID SERIAL PRIMARY KEY,
    Salary_Amount DECIMAL(10, 2) NOT NULL CHECK (Salary_Amount >= 0)
);


