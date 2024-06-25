-- Indexes for Person_Information
CREATE INDEX idx_person_email ON Person_Information (Email);

-- Indexes for Province
CREATE INDEX idx_province_name ON Province (Province_Name);
CREATE INDEX idx_province_code ON Province (Province_Code);

-- Indexes for Address
CREATE INDEX idx_address_city ON Address (City);
CREATE INDEX idx_address_province_id ON Address (Province_ID);

-- Indexes for Price
-- No additional indexes needed as the primary key already serves the purpose

-- Indexes for Salary
-- No additional indexes needed as the primary key already serves the purpose

-- Indexes for Membership_Type
CREATE INDEX idx_membership_type_name ON Membership_Type (Type_Name);

-- Indexes for Membership
CREATE INDEX idx_membership_person_id ON Membership (Person_ID);
CREATE INDEX idx_membership_address_id ON Membership (Address_ID);
CREATE INDEX idx_membership_price_id ON Membership (Price_ID);
CREATE INDEX idx_membership_type_id ON Membership (Membership_Type_ID);

-- Indexes for Equipment
CREATE INDEX idx_equipment_name ON Equipment (Equipment_Name);

-- Indexes for Staff
CREATE INDEX idx_staff_person_id ON Staff (Person_ID);
CREATE INDEX idx_staff_address_id ON Staff (Staff_Address_ID);
CREATE INDEX idx_staff_salary_id ON Staff (Salary_ID);

-- Indexes for Brands
CREATE INDEX idx_brand_name ON Brands (Brand_Name);

-- Indexes for Supplements
CREATE INDEX idx_supplements_brand_id ON Supplements (Brand_ID);
CREATE INDEX idx_supplements_price_id ON Supplements (Price_ID);

-- Indexes for Inventory_Log
CREATE INDEX idx_inventory_log_supplement_id ON Inventory_Log (Supplement_ID);
CREATE INDEX idx_inventory_log_staff_id ON Inventory_Log (Staff_ID);
CREATE INDEX idx_inventory_log_log_date ON Inventory_Log (Log_Date);

-- Indexes for Certifications
CREATE INDEX idx_certification_name ON Certifications (Certification_Name);
CREATE INDEX idx_certification_organization ON Certifications (Issuing_Organization);

-- Indexes for Employee_Certifications
CREATE INDEX idx_employee_certifications_staff_id ON Employee_Certifications (Staff_ID);
CREATE INDEX idx_employee_certifications_certification_id ON Employee_Certifications (Certification_ID);

-- Indexes for Fitness_Class
CREATE INDEX idx_staff_id ON Fitness_Class (Staff_ID);

-- Indexes for Services
CREATE INDEX idx_services_name ON Services (Service_Name);
CREATE INDEX idx_services_price_id ON Services (Price_ID);

-- Indexes for Receipt
CREATE INDEX idx_receipt_member_id ON Receipt (Member_ID);
CREATE INDEX idx_receipt_date ON Receipt (Receipt_Date);

-- Indexes for Receipt_Item
CREATE INDEX idx_receipt_item_receipt_id ON Receipt_Item (Receipt_ID);
CREATE INDEX idx_receipt_item_supplement_id ON Receipt_Item (Supplement_ID);
CREATE INDEX idx_receipt_item_fitness_class_id ON Receipt_Item (Fitness_Class_ID);
CREATE INDEX idx_receipt_item_service_id ON Receipt_Item (Service_ID);
