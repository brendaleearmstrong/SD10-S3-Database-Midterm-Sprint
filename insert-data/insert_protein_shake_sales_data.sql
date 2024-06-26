-- Insert Receipts with multiple items, different dates in 2024
INSERT INTO Receipt (Receipt_ID, Member_ID, Payment_Method, Tax_ID, Subtotal, Tax_Amount, Total_Amount, Receipt_Date) VALUES
(16, 467, 'Credit Card', 1, 82.96, 12.44, 95.40, '2024-01-01 10:30:00'),
(17, 496, 'Debit Card', 1, 114.95, 17.24, 132.19, '2024-02-02 14:45:00'),
(18, 502, 'Cash', 1, 64.48, 9.67, 74.15, '2024-03-02 11:15:00'),
(19, 531, 'Credit Card', 1, 117.92, 17.69, 135.61, '2024-04-04 16:00:00'),
(20, 582, 'Debit Card', 1, 84.98, 12.75, 97.73, '2024-05-05 09:30:00'),
(21, 582, 'Credit Card', 1, 82.96, 12.44, 95.40, '2024-06-01 10:30:00'),
(22, 601, 'Debit Card', 1, 32.48, 4.87, 37.35, '2024-07-02 14:45:00'),
(23, 604, 'Cash', 1, 76.71, 11.51, 88.22, '2024-08-02 11:15:00'),
(24, 542, 'Credit Card', 1, 52.98, 7.95, 60.93, '2024-09-04 16:00:00'),
(25, 579, 'Debit Card', 1, 81.17, 12.18, 93.35, '2024-10-05 09:30:00');

select * from receipt;

-- ADDING RECEIPT ITEMS FOR MULTIPLE PRODUCT TRANSACTIONS 

-- Insert Receipt Items with 1 or 2 protein shakes and an additional product or service
INSERT INTO Receipt_Item (Receipt_ID, Supplement_ID, Fitness_Class_ID, Service_ID, Quantity, Price_ID, Item_Subtotal, Item_Tax_Amount, Item_Total) VALUES
-- Receipt 16: 1 Protein Shake + Additional Product
(16, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Vanilla - Kids Shake' LIMIT 1), NULL, NULL, 1, 46, 2.99, 0.45, 3.44),
(16, 762, NULL, NULL, 2, 1, 19.98, 3.00, 22.98),
(16, NULL, NULL, (SELECT Service_ID FROM Services ORDER BY RANDOM() LIMIT 1), 1, 10, 59.99, 8.99, 68.98),

-- Receipt 17: 2 Protein Shakes + Additional Product
(17, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Vanilla - Regular Shake' LIMIT 1), NULL, NULL, 1, 47, 4.99, 0.75, 5.74),
(17, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Strawberry - Regular Shake' LIMIT 1), NULL, NULL, 1, 47, 4.99, 0.75, 5.74),
(17, 765, NULL, NULL, 1, 10, 29.99, 4.50, 34.49),

-- Receipt 18: 1 Protein Shake + Additional Product
(18, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Vanilla - Super Shake' LIMIT 1), NULL, NULL, 1, 48, 9.99, 1.50, 11.49),
(18, 766, NULL, NULL, 1, 10, 29.99, 4.50, 34.49),
(18, NULL, NULL, (SELECT Service_ID FROM Services ORDER BY RANDOM() LIMIT 1), 1, 10, 24.50, 3.67, 28.17),

-- Receipt 19: 2 Protein Shakes + Additional Product
(19, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Chocolate - Kids Shake' LIMIT 1), NULL, NULL, 1, 46, 2.99, 0.45, 3.44),
(19, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Chocolate - Regular Shake' LIMIT 1), NULL, NULL, 1, 47, 4.99, 0.75, 5.74),
(19, NULL, NULL, (SELECT Service_ID FROM Services ORDER BY RANDOM() LIMIT 1), 1, 10, 89.99, 13.50, 103.49),

-- Receipt 20: 1 Protein Shake + Additional Product
(20, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Strawberry - Super Shake' LIMIT 1), NULL, NULL, 1, 48, 9.99, 1.50, 11.49),
(20, NULL, 47, NULL, 1, 17, 74.99, 11.25, 86.24),

-- Receipt 21: 2 Protein Shakes + Additional Product
(21, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Peanut Butter - Kids Shake' LIMIT 1), NULL, NULL, 1, 46, 2.99, 0.45, 3.44),
(21, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Peanut Butter - Regular Shake' LIMIT 1), NULL, NULL, 1, 47, 4.99, 0.75, 5.74),
(21, NULL, NULL, (SELECT Service_ID FROM Services ORDER BY RANDOM() LIMIT 1), 1, 10, 59.99, 8.99, 68.98),

-- Receipt 22: 1 Protein Shake + Additional Product
(22, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Banana - Kids Shake' LIMIT 1), NULL, NULL, 1, 46, 2.99, 0.45, 3.44),
(22, 765, NULL, NULL, 1, 10, 29.99, 4.50, 34.49),

-- Receipt 23: 2 Protein Shakes + Additional Product
(23, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Banana - Regular Shake' LIMIT 1), NULL, NULL, 1, 47, 4.99, 0.75, 5.74),
(23, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Banana - Super Shake' LIMIT 1), NULL, NULL, 1, 48, 9.99, 1.50, 11.49),
(23, NULL, NULL, (SELECT Service_ID FROM Services ORDER BY RANDOM() LIMIT 1), 1, 10, 49.99, 7.50, 57.49),

-- Receipt 24: 1 Protein Shake + Additional Product
(24, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Strawberry - Kids Shake' LIMIT 1), NULL, NULL, 1, 46, 2.99, 0.45, 3.44),
(24, NULL, NULL, (SELECT Service_ID FROM Services ORDER BY RANDOM() LIMIT 1), 1, 10, 49.99, 7.50, 57.49),

-- Receipt 25: 2 Protein Shakes + Additional Product
(25, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Strawberry - Regular Shake' LIMIT 1), NULL, NULL, 1, 47, 4.99, 0.75, 5.74),
(25, (SELECT Supplement_ID FROM Supplements WHERE Supplement_Name = 'Strawberry - Super Shake' LIMIT 1), NULL, NULL, 1, 48, 9.99, 1.50, 11.49),
(25, NULL, NULL, (SELECT Service_ID FROM Services ORDER BY RANDOM() LIMIT 1), 1, 10, 49.99, 7.50, 57.49);

select * from receipt_item;
