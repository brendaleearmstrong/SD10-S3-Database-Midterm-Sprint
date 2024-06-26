-- Receipt Table
CREATE TABLE Receipt (
    Receipt_ID SERIAL PRIMARY KEY,
    Member_ID INT NOT NULL,
    Payment_Method VARCHAR(50) NOT NULL,
    Tax_ID INT NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL CHECK (Subtotal >= 0),
    Tax_Amount DECIMAL(10, 2) NOT NULL CHECK (Tax_Amount >= 0),
    Total_Amount DECIMAL(10, 2) NOT NULL CHECK (Total_Amount >= 0),
    Receipt_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Member_ID) REFERENCES Membership(Member_ID),
    FOREIGN KEY (Tax_ID) REFERENCES Tax(Tax_ID)
);


