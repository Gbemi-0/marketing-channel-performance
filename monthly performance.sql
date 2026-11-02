-- Campaign trends per month
WITH spend AS (
    SELECT channel, campaign,
           DATE_TRUNC('month', spend_date)::date AS month,
           SUM(spend) AS total_spend
    FROM ad_spend_clean
    GROUP BY 1, 2, 3
),
outcomes AS (
    SELECT channel, campaign,
           DATE_TRUNC('month', signup_date)::date AS month,
           COUNT(*) AS signups,
           COUNT(*) FILTER (WHERE subscribing) AS subscribers,
		   SUM(revenue_first_90_days) AS total_revenue
    FROM signups_clean
    WHERE campaign IS NOT NULL
    GROUP BY 1, 2, 3
)
SELECT s.month, s.channel, s.campaign,
       s.total_spend, o.signups, o.subscribers, o.total_revenue,
       ROUND(s.total_spend / NULLIF(o.signups, 0), 2) AS cost_per_signup,
       ROUND(100.0 * o.subscribers / NULLIF(o.signups, 0), 2) AS customer_conversion_rate,
       ROUND(s.total_spend / NULLIF(o.subscribers, 0), 2) AS cost_per_subscriber
FROM spend s
LEFT JOIN outcomes o USING (month, channel, campaign)
ORDER BY s.month, s.channel, s.campaign;

-- Display campaign spend (ended early compared to other campaigns)
SELECT MIN(spend_date) AS first_spend, MAX(spend_date) AS last_spend, COUNT(*) AS days_with_spend
FROM ad_spend_clean WHERE campaign = 'display_network';





