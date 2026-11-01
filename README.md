# Robinhood Marketing Channel Performance

## Project Description
This project looks at Robinhood's marketing channel and campaign performance for the first half of 2025.

## Objective
* Which channels generate the most revenue?
* Which campaigns attract the most customers?
* Which campaigns produce signups at the lowest cost?
* Does a cheaper signup channel bring users who rarely pay?
* How do paid signups compare to organic and referral signups?
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

### 2. Metrics
- Cost per signup
- Cost per subscriber
- Customer conversion rate
- Return on ad spend (ROAS)

Signups are people who created accounts, and subscribers are customers with paid accounts (they have a subscription start date).

### 3. Campaign Performance Metrics



## Key Findings
- Paid Search had the best ROAS and the lowest cost per subscriber among all channels. 
- While the Paid Social channel drove the most signups overall, the prospecting video campaigns have the lowest customer conversion rates.
- Display returned the least revenue relative to what it cost.

## Recommendation
- Cut Display completely or refocus its budget.
- Reduce spend on prospecting videos due to their low conversion rate. [Risk: Could negatively impact profit.]

## Data Flow Pipeline


## Dataset
The datasets are provided by Data Career School for educational purposes.
