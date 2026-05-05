-- This will grab the daily revenue generated.
CREATE TABLE daily_sales AS
SELECT
    DATE(event_time) AS date,
    COUNT(*) FILTER (WHERE event_type='purchase') AS purchases,
    SUM(price) FILTER (WHERE event_type='purchase') AS revenue
FROM events
GROUP BY DATE(event_time);

-- This will grab a summary of the user.
CREATE TABLE user_summary AS
SELECT
    user_id,
    COUNT(*) FILTER (WHERE event_type='view') AS views,
    COUNT(*) FILTER (WHERE event_type='cart') AS carts,
    COUNT(*) FILTER (WHERE event_type='purchase') AS purchases
FROM events
GROUP BY user_id;

-- This will grab all user summaries with low engagement (defined by me as a views without purchases).
CREATE TABLE user_segments AS
SELECT *,
    CASE 
        WHEN views > 0 AND purchases = 0 THEN 'Low Engagement'
        WHEN purchases > 0 THEN 'Buyer'
        ELSE 'Other'
    END AS segment
FROM user_summary;