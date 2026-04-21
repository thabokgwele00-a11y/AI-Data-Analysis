Project 1: FICA/AML Risk Compliance Pipeline
1. Business Objective: To automate the identification of High-Risk customers based on South African FICA (Financial Intelligence Centre Act) and AML (Anti-Money Laundering) regulations. The goal is to prioritize compliance officer reviews for accounts with suspicious risk ratings.

2. Transformation Logic:

Risk Categorization: Applied CASE statements to classify customers based on their Risk_Rating score.

Red Alert: Rating ≥ 8.0 (Immediate investigation required).

Amber Alert: Rating 5.0 - 7.9 (Secondary review).

Green: Rating < 5.0 (Standard monitoring).

Geographic Aggregation: Grouped data by Province to identify regional risk hotspots (e.g., identifying Western Cape as a high-density zone for Red Alerts).

3. Technical Stack: Google BigQuery (SQL), Looker Studio (Data Visualization), Data Modeling (Fact Tables & Views).