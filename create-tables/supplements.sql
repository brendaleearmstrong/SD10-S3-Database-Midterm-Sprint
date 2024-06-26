-- Supplements table
CREATE TABLE Supplements (
    Supplement_ID SERIAL PRIMARY KEY,
    Brand_ID INT NOT NULL,
    Price_ID INT NOT NULL,
    Supplement_Name VARCHAR(100) NOT NULL,
    Stock_Amount INT NOT NULL CHECK (Stock_Amount >= 0),
    Reorder_Number INT NOT NULL CHECK (Reorder_Number > 0),
    Min_Stock_Level INT NOT NULL DEFAULT 0,
    Max_Stock_Level INT NOT NULL DEFAULT 100,
    FOREIGN KEY (Brand_ID) REFERENCES Brands(Brand_ID),
    FOREIGN KEY (Price_ID) REFERENCES Price(Price_ID),
    CONSTRAINT check_stock_levels CHECK (Min_Stock_Level < Max_Stock_Level)
);





