
CREATE TABLE ad_spend (
    spend_date   DATE,
    channel      TEXT,
    campaign     TEXT,
    impressions  INT,
    clicks       INT,
    spend        NUMERIC(10,2)
);

CREATE TABLE signups (
    user_id                 INT,
    signup_date             DATE,
    channel                 TEXT,
    campaign                TEXT,
    subscription_start_date DATE,
    plan                    TEXT,
    revenue_first_90_days   NUMERIC(10,2)
);

-- normalize format for ad spend
CREATE TABLE ad_spend_clean AS
SELECT DISTINCT
    spend_date,
    LOWER(REPLACE(channel, ' ', '_')) AS channel,
    campaign,
    impressions,
    clicks,
    spend
FROM ad_spend;


--ad spend date range
SELECT
    MIN(spend_date) AS start_date,
    MAX(spend_date) AS end_date
FROM ad_spend_clean;

--signups date range
SELECT
    MIN(signup_date) AS start_date,
    MAX(signup_date) AS end_date
FROM signups;


-- Check NULL values
SELECT
    COUNT(*) FILTER (WHERE spend_date IS NULL) AS null_date,
    COUNT(*) FILTER (WHERE channel IS NULL) AS null_channel,
    COUNT(*) FILTER (WHERE campaign IS NULL) AS null_campaign,
    COUNT(*) FILTER (WHERE impressions IS NULL) AS null_impressions,
    COUNT(*) FILTER (WHERE clicks IS NULL) AS null_clicks,
    COUNT(*) FILTER (WHERE spend IS NULL) AS null_spend
FROM ad_spend_clean;

--Duplicates
SELECT
    spend_date,
    channel,
    campaign,
    COUNT(*) AS duplicate_count
FROM ad_spend_clean
GROUP BY spend_date, channel, campaign
HAVING COUNT(*) > 1;

-- cleck signup nulls
SELECT
  COUNT(*) FILTER (WHERE campaign IS NULL OR campaign = '') AS blank_campaigns,
  COUNT(*) FILTER (WHERE subscription_start_date IS NULL) AS null_sub_date,
  COUNT(*) FILTER (WHERE plan IS NULL OR plan = '') AS blank_plans
FROM signups;

-- organic and referral as 0 campaigns
SELECT channel, COUNT(*) FILTER (WHERE campaign IS NULL) AS null_campaign, COUNT(*) AS total_campaigns
FROM signups GROUP BY 1 ORDER BY 1;


-- count subscribed customers
SELECT plan, COUNT(*) FROM signups GROUP BY 1 ORDER BY 2 DESC;


-- latest subscription date
SELECT MAX(subscription_start_date) AS last_sub_date FROM signups;

-- plan revenue and # of subscribers per month
SELECT DATE_TRUNC('month', signup_date)::date AS signup_month,
       plan,
       COUNT(*) AS subscribers,
       ROUND(AVG(revenue_first_90_days), 2) AS avg_revenue
FROM signups
WHERE subscription_start_date IS NOT NULL
GROUP BY 1, 2 ORDER BY 2, 1;

-- normalize format for signups
CREATE TABLE signups_clean AS
SELECT *,
    (subscription_start_date IS NOT NULL) AS subscribing,
    CASE WHEN channel IN ('organic','referral') THEN 'free_tier' ELSE 'subscribed' END AS source_type
FROM signups;

--
ALTER TABLE ad_spend_clean ADD PRIMARY KEY (spend_date, channel, campaign);

ALTER TABLE signups_clean  ADD PRIMARY KEY (user_id);



select * from signups_clean limit 15;