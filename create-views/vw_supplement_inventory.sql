/* Supplement Inventory View */

CREATE VIEW vw_supplement_inventory AS
SELECT 
    s.Supplement_ID,
    s.Supplement_Name,
    b.Brand_Name,
    s.Stock_Amount,
    s.Reorder_Number,
    s.Min_Stock_Level,
    s.Max_Stock_Level,
    p.Price_Amount AS Current_Price
FROM 
    Supplements s
JOIN 
    Brands b ON s.Brand_ID = b.Brand_ID
JOIN 
    Price p ON s.Price_ID = p.Price_ID;
	
select * from vw_supplement_inventory;