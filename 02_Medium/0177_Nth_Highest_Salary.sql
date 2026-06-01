CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) 
RETURNS TABLE (Salary INT) AS $$
BEGIN
    -- Handle invalid input
    IF N <= 0 THEN
        RETURN QUERY SELECT NULL::INT;
        RETURN;
    END IF;

    -- Actual Query
    RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    SELECT COALESCE (
    (SELECT DISTINCT e.salary
    FROM Employee AS e 
    ORDER BY e.salary DESC
    LIMIT 1 OFFSET (N-1)),
    NULL)
    );
END;
$$ LANGUAGE plpgsql;