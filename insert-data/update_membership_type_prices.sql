-- Update Price_ID in Membership table based on the new Price_ID values
UPDATE Membership SET Price_ID = CASE
    WHEN Membership_Type_ID = 1 AND Membership_Length = 1 THEN 26
    WHEN Membership_Type_ID = 1 AND Membership_Length = 4 THEN 27
    WHEN Membership_Type_ID = 1 AND Membership_Length = 6 THEN 28
    WHEN Membership_Type_ID = 1 AND Membership_Length = 12 THEN 29
    WHEN Membership_Type_ID = 2 AND Membership_Length = 1 THEN 30
    WHEN Membership_Type_ID = 2 AND Membership_Length = 4 THEN 31
    WHEN Membership_Type_ID = 2 AND Membership_Length = 6 THEN 32
    WHEN Membership_Type_ID = 2 AND Membership_Length = 12 THEN 33
    WHEN Membership_Type_ID = 3 AND Membership_Length = 1 THEN 34
    WHEN Membership_Type_ID = 3 AND Membership_Length = 4 THEN 35
    WHEN Membership_Type_ID = 3 AND Membership_Length = 6 THEN 36
    WHEN Membership_Type_ID = 3 AND Membership_Length = 12 THEN 37
    WHEN Membership_Type_ID = 4 AND Membership_Length = 1 THEN 38
    WHEN Membership_Type_ID = 4 AND Membership_Length = 4 THEN 39
    WHEN Membership_Type_ID = 4 AND Membership_Length = 6 THEN 40
    WHEN Membership_Type_ID = 4 AND Membership_Length = 12 THEN 41
    WHEN Membership_Type_ID = 5 AND Membership_Length = 1 THEN 42
    WHEN Membership_Type_ID = 5 AND Membership_Length = 4 THEN 43
    WHEN Membership_Type_ID = 5 AND Membership_Length = 6 THEN 44
    WHEN Membership_Type_ID = 5 AND Membership_Length = 12 THEN 45
END
WHERE Price_ID IS NOT NULL;

select * from membership;
