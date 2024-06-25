INSERT INTO inventory_log (Supplement_ID, Change_Amount, New_Stock_Amount, Log_Date, Staff_ID, Log_Type, Notes) VALUES
(601, 50, 150, '2023-06-01 09:00:00', 701, 'Restock', 'Monthly restock'),
(702, -5, 45, '2023-06-02 14:30:00', 702, 'Sale', 'Customer purchase'),
(853, -2, 28, '2023-06-03 11:15:00', 702, 'Sale', 'Customer purchase'),
(620, -10, 50, '2023-06-04 16:45:00', 701, 'Adjustment', 'Inventory count adjustment'),
(745, -3, 42, '2023-06-05 10:30:00', 701, 'Expired', 'Removed expired products'),
(712, 20, 55, '2023-06-06 13:20:00', 701, 'Restock', 'Weekly restock'),
(789, -4, 21, '2023-06-07 15:00:00', 702, 'Sale', 'Customer purchase'),
(604, -6, 49, '2023-06-08 17:30:00', 702, 'Sale', 'Customer purchase'),
(658, 30, 70, '2023-06-09 09:45:00', 701, 'Restock', 'New shipment received'),
(963, -1, 29, '2023-06-10 12:00:00', 702, 'Sale', 'Customer purchase'),
(611, -8, 22, '2023-06-11 11:30:00', 702, 'Sale', 'Customer purchase'),
(652, -7, 48, '2023-06-12 16:00:00', 702, 'Sale', 'Customer purchase'),
(623, 15, 63, '2023-06-13 14:00:00', 701, 'Restock', 'Monthly restock'),
(709, -3, 42, '2023-06-14 10:30:00', 703, 'Sale', 'Customer purchase'),
(645, -5, 37, '2023-06-15 13:45:00', 715, 'Sale', 'Customer purchase'),
(618, 25, 60, '2023-06-16 09:15:00', 701, 'Restock', 'Weekly restock'),
(732, -2, 18, '2023-06-17 11:45:00', 703, 'Sale', 'Customer purchase'),
(819, -4, 46, '2023-06-18 14:15:00', 703, 'Sale', 'Customer purchase'),
(613, -1, 59, '2023-06-19 16:45:00', 703, 'Sale', 'Customer purchase'),
(624, 30, 90, '2023-06-20 08:00:00', 701, 'Restock', 'New shipment received');

select * from inventory_log;
