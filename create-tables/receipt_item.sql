-- Receipt_Item Table

CREATE TABLE Receipt_Item (
    Receipt_Item_ID SERIAL PRIMARY KEY,
    Receipt_ID INT NOT NULL,
    Supplement_ID INT,
    Fitness_Class_ID INT,
    Service_ID INT,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price_ID INT NOT NULL,
    Item_Subtotal DECIMAL(10, 2) NOT NULL CHECK (Item_Subtotal >= 0),
    Item_Tax_Amount DECIMAL(10, 2) NOT NULL CHECK (Item_Tax_Amount >= 0),
    Item_Total DECIMAL(10, 2) NOT NULL CHECK (Item_Total >= 0),
    FOREIGN KEY (Receipt_ID) REFERENCES Receipt(Receipt_ID),
    FOREIGN KEY (Supplement_ID) REFERENCES Supplements(Supplement_ID),
    FOREIGN KEY (Fitness_Class_ID) REFERENCES Fitness_Class(Class_ID),
    FOREIGN KEY (Service_ID) REFERENCES Services(Service_ID),
    FOREIGN KEY (Price_ID) REFERENCES Price(Price_ID),
    CHECK (
        (Supplement_ID IS NOT NULL AND Fitness_Class_ID IS NULL AND Service_ID IS NULL) OR
        (Supplement_ID IS NULL AND Fitness_Class_ID IS NOT NULL AND Service_ID IS NULL) OR
        (Supplement_ID IS NULL AND Fitness_Class_ID IS NULL AND Service_ID IS NOT NULL)
    )
);












