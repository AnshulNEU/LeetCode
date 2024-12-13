WITH DailyTotals AS (
    SELECT 
        visited_on, 
        SUM(amount) AS daily_total
    FROM Customer
    GROUP BY visited_on
),
SevenDayWindow AS (
    SELECT 
        visited_on,
        SUM(daily_total) OVER (
            ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS total_amount,
        ROUND(
            AVG(daily_total) OVER (
                ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
            ), 2
        ) AS average_amount,
        COUNT(daily_total) OVER (
            ORDER BY visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS days_count
    FROM DailyTotals
)
SELECT 
    visited_on, 
    total_amount AS amount, 
    average_amount
FROM SevenDayWindow
WHERE days_count = 7
ORDER BY visited_on;
