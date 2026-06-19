WITH IpOctets AS(
    SELECT
        log_id,
        SPLIT_PART(ip, '.', 1) AS octet1,
        SPLIT_PART(ip, '.', 2) AS octet2,
        SPLIT_PART(ip, '.', 3) AS octet3,
        SPLIT_PART(ip, '.', 4) AS octet4,
        SPLIT_PART(ip, '.', 5) AS octet5
    FROM logs
),

ValidIps AS (
    SELECT
        log_id
    FROM IpOctets
    WHERE 
        -- Rule 3: Must be exactly 4 octets
        LENGTH(octet5) = 0 AND LENGTH(octet4) > 0 AND

        -- Rule 2: No leading zeros (A single '0' is allowed)
        -- Parenthesis are mandatory since 'AND' has higher precedence than 'OR'
        (LENGTH(LTRIM(octet1, '0')) = LENGTH(octet1) OR octet1 = '0') AND
        (LENGTH(LTRIM(octet2, '0')) = LENGTH(octet2) OR octet2 = '0') AND
        (LENGTH(LTRIM(octet3, '0')) = LENGTH(octet3) OR octet3 = '0') AND
        (LENGTH(LTRIM(octet4, '0')) = LENGTH(octet4) OR octet4 = '0') AND

        -- Rule 1: Numeric Check (all 4 octets must be less than or equal to 255)
        octet1::numeric <= 255 AND octet2::numeric <= 255 AND -- rule 1
        octet3::numeric <= 255 AND octet4::numeric <= 255
)

SELECT
    ip,
    COUNT(logs.log_id) AS invalid_count
FROM logs
WHERE NOT EXISTS (SELECT 1 FROM ValidIps WHERE logs.log_id = ValidIps.log_id)
GROUP BY ip
ORDER BY invalid_count DESC, ip DESC;