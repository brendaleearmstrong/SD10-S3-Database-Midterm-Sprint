-- Inventory_Log table
CREATE TABLE Inventory_Log (
    Log_ID SERIAL PRIMARY KEY,
    Supplement_ID INT NOT NULL,
    Change_Amount INT NOT NULL,
    New_Stock_Amount INT NOT NULL,
    Log_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Staff_ID INT,
    Log_Type VARCHAR(20) CHECK (Log_Type IN ('Restock', 'Sale', 'Adjustment', 'Expired')),
    Notes TEXT,
    FOREIGN KEY (Supplement_ID) REFERENCES Supplements(Supplement_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);






