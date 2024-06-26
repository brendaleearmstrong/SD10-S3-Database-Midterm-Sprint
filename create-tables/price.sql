
-- Price table
CREATE TABLE Price (
    Price_ID SERIAL PRIMARY KEY,
    Price_Amount DECIMAL(10, 2) NOT NULL CHECK (Price_Amount >= 0)
);


