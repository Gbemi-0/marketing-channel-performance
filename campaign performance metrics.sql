-- campaign performance metrics
WITH ads AS (
    SELECT channel, campaign,
           SUM(spend) AS total_spend,
           SUM(impressions) AS impressions,
           SUM(clicks) AS clicks
    FROM ad_spend_clean
    GROUP BY channel, campaign
),
outcomes AS (
    SELECT channel, campaign,
           COUNT(*) AS signups,
           COUNT(*) FILTER (WHERE subscribing) AS subscribers,
           SUM(revenue_first_90_days) AS revenue
    FROM signups_clean
    WHERE campaign IS NOT NULL
    GROUP BY channel, campaign
)
SELECT a.channel, a.campaign,
       a.total_spend, a.impressions, a.clicks,
       ROUND(100.0 * a.clicks / NULLIF(a.impressions, 0), 2) AS click_through_rate,
       ROUND(a.total_spend / NULLIF(a.clicks, 0), 2) AS cost_per_click,
       o.signups, o.subscribers,
       ROUND(a.total_spend / NULLIF(o.signups, 0), 2) AS cost_per_signup,
       ROUND(100.0 * o.subscribers / NULLIF(o.signups, 0), 2) AS customer_conversion_rate,
       ROUND(a.total_spend / NULLIF(o.subscribers, 0), 2) AS cost_per_subscribers,
       o.revenue,
       ROUND(o.revenue / NULLIF(a.total_spend, 0), 2) AS roas
FROM ads a
JOIN outcomes o USING (channel, campaign)
ORDER BY roas DESC;