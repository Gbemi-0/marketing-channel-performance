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
Fixed these issues in the data:
- Null values
- Duplicate records
- Channel naming inconsistencies

### 2. Metrics
a. Cost per signup
b. Cost per paying subscriber
c. Clicks

Customers are all app users, subscribed or not. Signups are people with accounts, and subscribers are customers with paid accounts.

### 3. Campaign Performance Metrics



## Key Findings
- The highest performing channels are Paid Search and Paid Social.
- While the Paid Social channel is profitable, the prospecting video campaigns are underperforming
- Display channel consumes the most spend and cost, while bringing in the least revenue.

## Recommendation
- Cut Display completely or refocus its budget.
- Reduce spend on prospecting videos due to their low conversion rate. [Risk: Could negatively impact profit.]

## Dataset
The datasets are provided by Data Career School for educational purposes.
