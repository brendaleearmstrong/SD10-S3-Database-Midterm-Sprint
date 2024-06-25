/* Query #6 - Membership Type Performance Analysis Report 
The function will return a table with membership type name, member count, average membership length, total revenue for that type, 
and the percentage of total revenue it represents. The query can filter by membership type */

CREATE OR REPLACE FUNCTION get_membership_report(p_membership_type_id INT DEFAULT NULL)
RETURNS TABLE (
    membership_type_name VARCHAR(50),
    member_count BIGINT,
    avg_membership_length NUMERIC,
    total_revenue NUMERIC,
    percentage_of_total NUMERIC
) AS $$
BEGIN
    RETURN QUERY
    WITH MembershipStats AS (
        SELECT
            mt.Membership_Type_ID,
            mt.Type_Name,
            COUNT(m.Member_ID) AS member_count,
            AVG(m.Membership_Length) AS avg_membership_length,
            SUM(p.Price_Amount * m.Membership_Length) AS membership_revenue
        FROM
            Membership_Type mt
        LEFT JOIN
            Membership m ON mt.Membership_Type_ID = m.Membership_Type_ID
        LEFT JOIN
            Price p ON m.Price_ID = p.Price_ID
        WHERE
            p_membership_type_id IS NULL OR mt.Membership_Type_ID = p_membership_type_id
        GROUP BY
            mt.Membership_Type_ID, mt.Type_Name
    ),
    TotalRevenue AS (
        SELECT SUM(membership_revenue) AS grand_total FROM MembershipStats
    )
    SELECT
        ms.Type_Name,
        ms.member_count,
        ROUND(ms.avg_membership_length, 2) AS avg_membership_length,
        ms.membership_revenue,
        ROUND(ms.membership_revenue / NULLIF(tr.grand_total, 0) * 100, 2) AS percentage_of_total
    FROM
        MembershipStats ms,
        TotalRevenue tr
    ORDER BY
        ms.membership_revenue DESC;
END;
$$ LANGUAGE plpgsql;

-- For all membership types
SELECT * FROM get_membership_report();

-- For a Basic Membership type 
SELECT * FROM get_membership_report(1);

-- For a Standard Membership type
SELECT * FROM get_membership_report(2);

-- For a Premium Membership type
SELECT * FROM get_membership_report(3);

-- For a Student Membership type
SELECT * FROM get_membership_report(4);

-- For a Senior Membership type
SELECT * FROM get_membership_report(5);