WITH DailyAmount AS (
    SELECT 
        visited_on, 
        SUM(amount) AS daily_total
    FROM Customer
    GROUP BY visited_on
),
AggregatedData AS (
    SELECT 
        visited_on,
        SUM(daily_total) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS total_amount,
        COUNT(daily_total) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS total_days
    FROM DailyAmount
)
SELECT 
    visited_on,
    total_amount AS amount,
    ROUND(total_amount * 1.0 / total_days, 2) AS average_amount
FROM AggregatedData
WHERE total_days = 7
ORDER BY visited_on;

