WITH SCORED AS (
    SELECT * FROM {{ ref('rfm_customer_scores') }}
)
SELECT
    CUSTOMER_ID,
    CHANNEL,
    RECENCY_DAYS,
    FREQUENCY, 
    MONETARY,
    R_SCORE,
    F_SCORE,
    M_SCORE,
    (R_SCORE || F_SCORE || M_SCORE) AS RFM_CODE,
    CASE 
        WHEN R_SCORE >= 4 AND F_SCORE >= 4 AND M_SCORE >= 4 THEN 'Premier Customers'
        WHEN F_SCORE >= 4 AND M_SCORE >= 4 THEN 'Loyal Customers'
        WHEN R_SCORE >= 4 AND M_SCORE >= 4 AND F_SCORE <= 3 THEN 'High-Value Recent'
        WHEN R_SCORE >= 4 AND F_SCORE <=3 AND M_SCORE <=3 THEN 'Emerging Customers'
        WHEN M_SCORE >= 4 AND R_SCORE >= 3 THEN 'High Spend Customers'
        WHEN F_SCORE >= 3 AND M_SCORE <= 2 THEN 'Value-Oriented Customers'
        WHEN F_SCORE BETWEEN 3 AND 5 AND M_SCORE BETWEEN 3 AND 5 AND R_SCORE BETWEEN 2 AND 3 THEN 'Seasonal Customers'
        WHEN R_SCORE <= 2 AND (F_SCORE >= 3 OR M_SCORE >= 3) THEN 'At-Risk Customers'
        WHEN R_SCORE <= 2 AND F_SCORE <= 2 AND M_SCORE <= 2 THEN 'Dormant Customers'
        else 'Inactive Customers'
    END AS SEGMENT_LABEL
FROM SCORED
