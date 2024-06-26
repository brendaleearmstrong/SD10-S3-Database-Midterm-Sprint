/* Adding in user story for protein shake sales reports */

SELECT Supplement_Name, COUNT(*)
FROM Supplements
GROUP BY Supplement_Name
HAVING COUNT(*) > 1;

select * from brands;

select * from supplements;

-- Insert new protein shakes
INSERT INTO Supplements (Brand_ID, Price_ID, Supplement_Name, Stock_Amount, Reorder_Number, Min_Stock_Level, Max_Stock_Level) VALUES
(21, 46, 'Vanilla - Kids Shake', 50, 20, 10, 100),
(21, 47, 'Vanilla - Regular Shake', 35, 15, 5, 70),
(21, 48, 'Vanilla - Super Shake', 60, 25, 10, 120),
(21, 46, 'Chocolate - Kids Shake', 40, 20, 10, 90),
(21, 47, 'Chocolate - Regular Shake', 25, 10, 5, 50),
(21, 48, 'Chocolate - Super Shake', 30, 15, 5, 60),
(21, 46, 'Strawberry - Kids Shake', 35, 15, 5, 70),
(21, 47, 'Strawberry - Regular Shake', 50, 20, 10, 100),
(21, 48, 'Strawberry - Super Shake', 45, 20, 10, 90),
(21, 46, 'Banana - Kids Shake', 40, 20, 10, 80),
(21, 47, 'Banana - Regular Shake', 35, 15, 5, 70),
(21, 48, 'Banana - Super Shake', 30, 15, 5, 60),
(21, 46, 'Peanut Butter - Kids Shake', 25, 10, 5, 50),
(21, 47, 'Peanut Butter - Regular Shake', 35, 15, 5, 70),
(21, 48, 'Peanut Butter - Super Shake', 40, 20, 10, 80);

