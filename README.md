# Consumer-Insights-Project

<a href="https://public.tableau.com/views/CustomerInsightsDashboard_17330158312860/Dashboard2?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link">click here for tableau dashboard</a>

## Project Overview

**Objective**: Analyze shopping behavior to uncover customer insights, purchasing trends, and promotional impacts using SQL and visualize the findings through a Tableau dashboard.

**Goal**: Develop SQL skills for business analytics by solving key questions related to customers, products, promotions, and satisfaction, supporting data-driven decision-making.

---

## Project Components

### 1. **Data Exploration**
- Validated data for customer transactions to ensure consistency.
- Conducted preliminary checks for unique customers and patterns in purchase records.

### 2. **Customer Insights**
- Identified **top 5 customers** based on purchase amount and analyzed patterns in their age, gender, and location.
- Analyzed which **age groups** drive the highest purchase amounts and explored gender distribution within each group.

### 3. **Purchasing Patterns**
- Determined the **top 5 most frequently purchased items** and their seasonal trends.
- Calculated the **average purchase amount per category**, identifying the highest and lowest-performing categories.
- Explored **seasonal purchase patterns** to identify the busiest season and most popular items.

### 4. **Promotions and Discounts**
- Measured the **percentage of purchases** influenced by promo codes.
- Compared **average purchase amounts** with and without promo codes.
- Analyzed the **top locations** where discounts are frequently applied.

### 5. **Shipping and Payment Preferences**
- Analyzed the **popularity of shipping types** (e.g., free shipping vs. express) and their impact on purchase amounts.
- Identified the preferred **payment methods** overall and for high-value customers (top 10% by spending).

### 6. **Customer Loyalty and Retention**
- Examined customers with **more than 5 previous purchases** and their active subscription rates.
- Analyzed the buying habits of monthly vs. annual customers.

### 7. **Review and Satisfaction Analysis**
- Identified **top-rated items** and patterns in ratings based on category, color, and season.
- Calculated **average review ratings** by category and identified the categories with the most rating variation.

---

## Data Analysis Queries (SQL)
A series of SQL queries were used to address the above analytics questions. Key highlights include:
- CTEs and subqueries to group, rank, and filter data.
- Aggregate functions like `AVG`, `COUNT`, `ROUND`, and conditional grouping with `CASE` statements.
- Analysis of seasonal trends, promo usage, and review ratings to identify actionable insights.

---

## Tableau Dashboard
The findings from SQL queries were visualized using Tableau to create an **interactive dashboard** showcasing:
1. **Average Purchase Amount and Review Ratings** by Item and Category.
2. **Seasonal Sales Trends** across different product categories.
3. **Shipping Preferences** and their impact on review ratings.
4. **Customer Segmentation** by age, gender, and purchasing behavior.
5. **State-Wise Purchase Distribution** and product-specific insights.
6. **Sales by Size and Color** for granular analysis.

Key Performace Indicators(KPIs):
- **Avg. Purchase Amount**  
- **Avg. Review Rating** 

---

## Tools and Technologies
- **SQL**: Data extraction and analysis.
- **Tableau**: Visualization and dashboard creation.
- **Data Source**: "PROJECT" schema from `customer_insights` table.

---

## Business Insights
1. **Top-performing categories**: Footwear emerged as the most profitable category with an average purchase amount of $60.26.
2. **Promo Codes Impact**: Promo codes influenced 30%+ of purchases, with a notable difference in purchase amounts.
3. **Seasonal Trends**: Spring observed the highest number of purchases, with specific items driving seasonal sales.
4. **Customer Loyalty**: Recurring customers with active subscriptions contribute significantly to sales.

---

## How to Use This Repository
1. **SQL Queries**: Access and modify SQL scripts in the `sql_analysis` folder to explore further insights.
2. **Tableau Dashboard**: Open the Tableau workbook to interact with the visualizations.
3. **Insights Documentation**: Review the summarized insights in this README.

---

## Future Improvements
- Incorporate time-series analysis to explore trends over time.
- Perform correlation analysis to determine relationships between promo usage, customer loyalty, and review ratings.
- Integrate machine learning models for predictive analytics on customer behavior.

---

## Author
Shams Sadhin
mail: sadhinss@mail.uc.edu
Linkedin: https://www.linkedin.com/feed/

---
