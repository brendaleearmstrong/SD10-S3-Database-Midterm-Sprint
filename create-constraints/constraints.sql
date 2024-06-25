-- Constraints for Address
ALTER TABLE Address
ADD CONSTRAINT fk_address_province_id FOREIGN KEY (Province_ID) REFERENCES Province(Province_ID);

-- Constraints for Membership
ALTER TABLE Membership
ADD CONSTRAINT fk_membership_person_id FOREIGN KEY (Person_ID) REFERENCES Person_Information(Person_ID),
ADD CONSTRAINT fk_membership_address_id FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID),
ADD CONSTRAINT fk_membership_price_id FOREIGN KEY (Price_ID) REFERENCES Price(Price_ID),
ADD CONSTRAINT fk_membership_type_id FOREIGN KEY (Membership_Type_ID) REFERENCES Membership_Type(Membership_Type_ID);

-- Constraints for Staff
ALTER TABLE Staff
ADD CONSTRAINT fk_staff_id FOREIGN KEY (Person_ID) REFERENCES Person_Information(Person_ID),
ADD CONSTRAINT fk_salary_id FOREIGN KEY (Salary_ID) REFERENCES Salary(Salary_ID);

-- Constraints for Supplements
ALTER TABLE Supplements
ADD CONSTRAINT fk_supplements_brand_id FOREIGN KEY (Brand_ID) REFERENCES Brands(Brand_ID),
ADD CONSTRAINT fk_supplements_price_id FOREIGN KEY (Price_ID) REFERENCES Price(Price_ID);

-- Constraints for Inventory_Log
ALTER TABLE Inventory_Log
ADD CONSTRAINT fk_inventory_log_supplement_id FOREIGN KEY (Supplement_ID) REFERENCES Supplements(Supplement_ID),
ADD CONSTRAINT fk_inventory_log_staff_id FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID);

-- Constraints for Staff_Certifications
ALTER TABLE Employee_Certifications
ADD CONSTRAINT fk_Employee_Certifications_staff_id FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID),
ADD CONSTRAINT fk_Employee_Certifications_certification_id FOREIGN KEY (Certification_ID) REFERENCES Certifications(Certification_ID);

-- Constraints for Services
ALTER TABLE Services
ADD CONSTRAINT fk_services_price_id FOREIGN KEY (Price_ID) REFERENCES Price(Price_ID);

-- Constraints for Receipt
ALTER TABLE Receipt
ADD CONSTRAINT fk_receipt_member_id FOREIGN KEY (Member_ID) REFERENCES Membership(Member_ID),
ADD CONSTRAINT fk_receipt_tax_id FOREIGN KEY (Tax_ID) REFERENCES Tax(Tax_ID);

ALTER TABLE Receipt_Item
ADD CONSTRAINT fk_receipt_item_receipt_id FOREIGN KEY (Receipt_ID) REFERENCES Receipt(Receipt_ID),
ADD CONSTRAINT fk_receipt_item_supplement_id FOREIGN KEY (Supplement_ID) REFERENCES Supplements(Supplement_ID),
ADD CONSTRAINT fk_receipt_item_service_id FOREIGN KEY (Service_ID) REFERENCES Services(Service_ID);



