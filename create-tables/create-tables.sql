-- Person_Information table
CREATE TABLE Person_Information (
    Person_ID SERIAL PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone_Number VARCHAR(20)
);

-- Province table
CREATE TABLE Province (
    Province_ID SERIAL PRIMARY KEY,
    Province_Name VARCHAR(50) UNIQUE NOT NULL,
    Province_Code CHAR(2) UNIQUE NOT NULL
);

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

-- Price table
CREATE TABLE Price (
    Price_ID SERIAL PRIMARY KEY,
    Price_Amount DECIMAL(10, 2) NOT NULL CHECK (Price_Amount >= 0)
);

-- Salary table
CREATE TABLE Salary (
    Salary_ID SERIAL PRIMARY KEY,
    Salary_Amount DECIMAL(10, 2) NOT NULL CHECK (Salary_Amount >= 0)
);

-- Membership_Type table
CREATE TABLE Membership_Type (
    Membership_Type_ID SERIAL PRIMARY KEY,
    Type_Name VARCHAR(50) UNIQUE NOT NULL,
    Description TEXT
);

-- Membership table
CREATE TABLE Membership (
    Member_ID SERIAL PRIMARY KEY,
    Person_ID INT NOT NULL,
    Address_ID INT NOT NULL,
    Price_ID INT NOT NULL,
    Membership_Type_ID INT NOT NULL,
    Membership_Length INT NOT NULL,
    Date_Joined DATE NOT NULL,
    Expiration_Date DATE NOT NULL,
    FOREIGN KEY (Person_ID) REFERENCES Person_Information(Person_ID),
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID),
    FOREIGN KEY (Price_ID) REFERENCES Price(Price_ID),
    FOREIGN KEY (Membership_Type_ID) REFERENCES Membership_Type(Membership_Type_ID)
);

-- Equipment table
CREATE TABLE Equipment (
    Equipment_ID SERIAL PRIMARY KEY,
    Equipment_Name VARCHAR(100) NOT NULL,
    Purchase_Date DATE NOT NULL,
    Availability_Status VARCHAR(20) NOT NULL CHECK (Availability_Status IN ('Available', 'In Use', 'Maintenance', 'Out of Order'))
);

-- Staff table
CREATE TABLE Staff (
    Staff_ID SERIAL PRIMARY KEY,
    Person_ID INT NOT NULL,
    Address_ID INT NOT NULL,
    Salary_ID INT NOT NULL,
    FOREIGN KEY (Person_ID) REFERENCES Person_Information(Person_ID),
    FOREIGN KEY (Staff_Address_ID) REFERENCES Staff_Address(Staff_Address_ID),
    FOREIGN KEY (Salary_ID) REFERENCES Salary(Salary_ID)
);


-- Gym_Location table
CREATE TABLE Gym_Location (
    Gym_ID SERIAL PRIMARY KEY,
    Address_ID INT NOT NULL,
    Manager_ID INT NOT NULL,
    FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID),
    FOREIGN KEY (Manager_ID) REFERENCES Staff(Staff_ID)
);

-- Tax table based on 15% tax
CREATE TABLE Tax (
    Tax_ID SERIAL PRIMARY KEY,
    Tax_Name VARCHAR(50) UNIQUE NOT NULL,
    Tax_Rate DECIMAL(5, 2) NOT NULL CHECK (Tax_Rate >= 0 AND Tax_Rate <= 100),
    Is_Active BOOLEAN DEFAULT TRUE,
    Effective_Date DATE NOT NULL,
    Description TEXT
);

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

-- Fitness_Class table
CREATE TABLE Fitness_Class (
    Class_ID SERIAL PRIMARY KEY,
    Staff_ID INT NOT NULL,
    Price_ID INT NOT NULL,
    Maximum_Capacity INT NOT NULL CHECK (Maximum_Capacity > 0),
    Class_Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Duration INT NOT NULL CHECK (Duration > 0),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Price_ID) REFERENCES Price(Price_ID)
);

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

-- Brands table
CREATE TABLE Brands (
    Brand_ID SERIAL PRIMARY KEY,
    Brand_Name VARCHAR(100) UNIQUE NOT NULL,
    Brand_Description TEXT
);

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

-- Schedule table
CREATE TABLE Schedule (
    Schedule_ID SERIAL PRIMARY KEY,
    Fitness_Class_ID INT NOT NULL,
    Staff_ID INT NOT NULL,
    Start_Time TIMESTAMP NOT NULL,
    End_Time TIMESTAMP NOT NULL,
    FOREIGN KEY (Fitness_Class_ID) REFERENCES Fitness_Class(Class_ID),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    CHECK (End_Time > Start_Time)
);

-- Equipment_Maintenance table
CREATE TABLE Equipment_Maintenance (
    Maintenance_ID SERIAL PRIMARY KEY,
    Equipment_ID INT NOT NULL,
    Maintenance_Date DATE NOT NULL,
    Description TEXT,
    Performed_By INT,
    FOREIGN KEY (Equipment_ID) REFERENCES Equipment(Equipment_ID),
    FOREIGN KEY (Performed_By) REFERENCES Staff(Staff_ID)
);

-- Certifications table
CREATE TABLE Certifications (
    Certification_ID SERIAL PRIMARY KEY,
    Certification_Name VARCHAR(100) UNIQUE NOT NULL,
    Certification_Description TEXT,
    Issuing_Organization VARCHAR(100) NOT NULL,
    Certification_Level VARCHAR(50) CHECK (Certification_Level IN ('Certificate', 'Degree', 'Masters Degree', 'Micro-credential', 'Certification'))
);

-- Employee_Certifications table
CREATE TABLE Employee_Certifications (
    Employee_Certification_ID SERIAL PRIMARY KEY,
    Staff_ID INT NOT NULL,
    Certification_ID INT NOT NULL,
    Date_Obtained DATE NOT NULL,
    Expiration_Date DATE,
    Certificate_Number VARCHAR(50),
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
    FOREIGN KEY (Certification_ID) REFERENCES Certifications(Certification_ID),
    UNIQUE (Staff_ID, Certification_ID, Certificate_Number)
);

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