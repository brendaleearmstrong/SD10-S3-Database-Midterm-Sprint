INSERT INTO Receipt_Item (Receipt_ID, Supplement_ID, Fitness_Class_ID, Service_ID, Quantity, Price_ID, Item_Subtotal, Item_Tax_Amount, Item_Total) VALUES
(1, 762, NULL, NULL, 2, 1, 19.98, 3.00, 22.98), -- Meditation Support, 2 units at $9.99 each
(2, NULL, 42, NULL, 1, 15, 54.99, 8.25, 63.24), -- HIIT Blast, 1 unit at $54.99
(3, NULL, NULL, 61, 1, 20, 99.99, 15.00, 114.99), -- Massage Therapy, 1 unit at $99.99
(4, 765, NULL, NULL, 3, 4, 119.97, 18.00, 137.97), -- Adaptogen Blend, 3 units at $39.99 each
(5, NULL, 47, NULL, 1, 17, 74.99, 11.25, 86.24), -- Kickboxing, 1 unit at $74.99
(6, NULL, NULL, 59, 1, 24, 199.00, 29.85, 228.85), -- Personal Training, 1 unit at $199.00
(7, NULL, NULL, 60, 1, 22, 129.99, 19.50, 149.49), -- Nutrition Consultation, 1 unit at $129.99
(8, NULL, NULL, 62, 1, 12, 24.99, 3.75, 28.74), -- Fitness Assessment, 1 unit at $24.99
(9, NULL, NULL, 63, 1, 5, 49.99, 7.50, 57.49), -- Body Composition Analysis, 1 unit at $49.99
(10, NULL, NULL, 65, 1, 18, 84.99, 12.75, 97.74); -- Hydrotherapy, 1 unit at $84.99

-- Adding multiple item transactions

INSERT INTO Receipt_Item (Receipt_ID, Supplement_ID, Fitness_Class_ID, Service_ID, Quantity, Price_ID, Item_Subtotal, Item_Tax_Amount, Item_Total) VALUES
-- Receipt 1: Multiple items
(11, 762, NULL, NULL, 2, 1, 19.98, 3.00, 22.98), -- Meditation Support, 2 units at $9.99 each
(11, 764, NULL, NULL, 1, 10, 49.99, 7.50, 57.49), -- Ashwagandha Capsules, 1 unit at $49.99
-- Receipt 2: Multiple items
(12, NULL, 42, NULL, 1, 15, 54.99, 8.25, 63.24), -- HIIT Blast, 1 unit at $54.99
(12, 765, NULL, NULL, 1, 10, 29.99, 4.50, 34.49), -- Adaptogen Blend, 1 unit at $29.99
-- Receipt 3: Multiple items
(13, NULL, NULL, 61, 1, 20, 99.99, 15.00, 114.99), -- Massage Therapy, 1 unit at $99.99
(13, 766, NULL, NULL, 1, 10, 29.99, 4.50, 34.49), -- Rhodiola Rosea, 1 unit at $29.99
-- Receipt 4: Multiple items
(14, 767, NULL, NULL, 2, 10, 59.98, 9.00, 68.98), -- L-Theanine, 2 units at $29.99 each
(14, NULL, NULL, 62, 1, 10, 89.99, 13.50, 103.49), -- Fitness Assessment, 1 unit at $89.99
-- Receipt 5: Multiple items
(15, NULL, 47, NULL, 1, 17, 74.99, 11.25, 86.24), -- Kickboxing, 1 unit at $74.99
(15, 769, NULL, NULL, 2, 10, 59.98, 9.00, 68.98); -- Holy Basil Extract, 2 units at $29.99 each

select * from receipt_item;
