INSERT INTO Receipt (Receipt_ID, Member_ID, Payment_Method, Tax_ID, Subtotal, Tax_Amount, Total_Amount, Receipt_Date) VALUES
(1, 405, 'Credit Card', 1, 19.98, 3.00, 22.98, '2023-06-01 10:30:00'), -- Meditation Support
(2, 411, 'Debit Card', 1, 54.99, 8.25, 63.24, '2023-06-02 14:45:00'), -- HIIT Blast
(3, 488, 'Cash', 1, 99.99, 15.00, 114.99, '2023-06-03 11:15:00'), -- Massage Therapy
(4, 475, 'Credit Card', 1, 119.97, 18.00, 137.97, '2023-06-04 16:00:00'), -- Adaptogen Blend
(5, 522, 'Debit Card', 1, 74.99, 11.25, 86.24, '2023-06-05 09:30:00'), -- Kickboxing
(6, 603, 'Credit Card', 1, 199.00, 29.85, 228.85, '2023-06-06 12:00:00'), -- Personal Training
(7, 581, 'Debit Card', 1, 129.99, 19.50, 149.49, '2023-06-07 13:15:00'), -- Nutrition Consultation
(8, 500, 'Cash', 1, 24.99, 3.75, 28.74, '2023-06-08 14:45:00'), -- Fitness Assessment
(9, 410, 'Credit Card', 1, 49.99, 7.50, 57.49, '2023-06-09 15:30:00'), -- Body Composition Analysis
(10, 500, 'Debit Card', 1, 84.99, 12.75, 97.74, '2023-06-10 16:15:00'); -- Hydrotherapy

-- adding transactions with multiple items

INSERT INTO Receipt (Receipt_ID, Member_ID, Payment_Method, Tax_ID, Subtotal, Tax_Amount, Total_Amount, Receipt_Date) VALUES
(11, 444, 'Credit Card', 1, 69.96, 10.49, 80.45, '2023-06-01 10:30:00'), -- Multiple items
(12, 405, 'Debit Card', 1, 84.98, 12.75, 97.73, '2023-06-02 14:45:00'), -- Multiple items
(13, 523, 'Cash', 1, 99.97, 14.99, 114.96, '2023-06-03 11:15:00'), -- Multiple items
(14, 581, 'Credit Card', 1, 149.96, 22.49, 172.45, '2023-06-04 16:00:00'), -- Multiple items
(15, 555, 'Debit Card', 1, 179.96, 26.99, 206.95, '2023-06-05 09:30:00'); -- Multiple items

select * from receipt;

