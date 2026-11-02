# Robinhood Marketing Channel Performance

## Project Description
This project is a practice case study looking at Robinhood's marketing channel and campaign performance for the first half of 2025.

[Summary of findings]
Paid Search channel is the cheapest avenue for attracting paying customers; Display Network and Prospecting Video should be cut back.

## Focus Objectives
* Which channels generate the most revenue?
* Which campaigns attract the most subscribers?
* Which campaigns produce signups at the lowest cost?
* Does a cheaper signup channel bring users who rarely pay?
* How should the marketing budget be allocated for the second half of the year?

## Tools
* PostgreSQL
* pgAdmin 4
* Matplotlib

## Datasets
### ad_spend.csv                                                                    
Contains advertising data:
* Date
* Channel
* Campaign
* Impressions
* Clicks
* Spend

### signups.csv
Contains customer subscription data:
* User ID
* Signup date
* Channel
* Campaign
* Subscription Start Date
* Plan
* Revenue First-90-Days


## Paid vs Unpaid Channels
Cost metrics only apply to paid channel types:
1. Display
2. Affiliate
3. Paid Search
4. Paid Social

Unpaid:
1. Organic
2. Referral

## Analysis
### 1. Data Cleaning and Validation
- Removed 7 duplicate records
- Standardized channel names across both datasets
- Confirmed expected blank campaigns in unpaid channels and null subscription fields for signups

### 2. Calculated Metrics
- Cost per signup
- Cost per subscriber
- Customer conversion rate
- Return on ad spend (ROAS)
- Click-through rate
- Cost per click

### 3. Performance Trends
- Monthly spend 
- Monthly signups and subscriptions
- Campaign length

Signups are people who created accounts, and subscribers are customers with paid accounts (they have a subscription start date).

## Key Findings
- Brand Search campaigns had the highest ROAS (about 1.91) and the lowest cost per subscriber among all campaigns ($21.93).
- Brand Search and Retargeting were the only campaigns that returned more than they cost (ROAS above 1.0).
- While the Paid Social channel drove the most signups overall, the Prospecting Video campaigns converted only 3.29% compared to 16.96% for retargeting campaigns.
- Display Network returned the least revenue relative to what it cost (about $540 on $16.5K of spend) before ending prematurely compared to other campaigns.

## Recommendations
- Do not restart Display Network campaigns. Its click-through rate is only 2.99% and costs Robinhood about $2,057 per subscriber.
- Reduce spend on Prospecting Videos due to their low conversion rate and high cost per subscriber. [Risk: Most signups come from this campaign.]

## Budget Split
Based on the H1 spend, the budget allotted for H2 is $124,886.



## Limitations


## Dataset Credit
The datasets are provided by Data Career School for educational purposes.
