

<img width="728" height="374" alt="pizza dashboard 2" src="https://github.com/user-attachments/assets/3320f5b7-89ca-48e9-af50-148e2d834cf3" />


 <img width="730" height="374" alt="pizza dashboard 1" src="https://github.com/user-attachments/assets/f5664171-993b-4b3e-a8d5-215fbfbdb889" />
SQL + Power BI Project

Pizza Sales Analysis Report

This project focuses on analyzing pizza sales data to derive actionable insights using SQL for
data exploration and Power BI for visualization. The goal was to answer key business questions
such as revenue trends, customer behavior, and product performance, while also demonstrating
how SQL and Power BI complement each other in a data analytics workflow.
The dataset used contained transactional records of pizza sales, including details such as order
date, order time, pizza size, category, quantity, and pricing. By leveraging SQL queries, we
performed calculations and aggregations to extract insights, and then visualized them in Power
BI to create an interactive dashboard.

Dataset Structure
The PIZZA_SALES table contains the following key fields:
● pizza_id / order_id → unique identifiers for pizzas and customer orders.
● pizza_name / pizza_category / pizza_size / pizza_ingredients → product details.
● quantity, unit_price, total_price → transaction details.
● order_date, order_time → timestamp information for trend analysis.

This schema provides the foundation for both sales performance measurement and trend
analysis across time, product categories, and sizes.
Key Business Metrics (KPIs)
● Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales
→ 817,860.05
This represents the complete revenue generated from all pizza sales.

● Average Order Value (AOV)
SELECT (SUM(total_price) / COUNT(DISTINCT order_id))
AS Avg_order_Value
FROM pizza_sales
→ 38.31
On average, each order generates around 38, indicating customer spending habits.

● Total Pizzas Sold
SELECT SUM(quantity)
AS Total_pizza_sold
FROM pizza_sales
→ 49,574
This shows strong overall sales volume.

● Total Orders
SELECT COUNT(DISTINCT order_id)
AS Total_Orders
FROM pizza_sales
→ 21,350
A measure of customer transactions within the dataset period.

● Average Pizzas per Order
● → 2.32
Customers typically purchase 2–3 pizzas per order, suggesting small group or family
consumption patterns.

Sales Trends
a. Daily Trends (Orders by Day of Week)

● Friday (3,538 orders) and Thursday (3,239 orders) are the busiest days.
● Sunday (2,624 orders) sees the lowest activity.
This highlights a weekend spike in sales, likely driven by leisure and family gatherings.

b. Monthly Trends
(Extracted via grouping, available for visualization in Power BI). This trend helps identify
seasonality effects, useful for promotional campaigns.

4. Revenue Breakdown
a. Sales by Pizza Category
● Classic (26.91%) and Supreme (25.46%) dominate sales.
● Chicken (23.96%) and Veggie (23.68%) are nearly equal in contribution.
This shows balanced demand across categories, with a slight preference for traditional
and premium options.

b. Sales by Pizza Size
● Large (L) pizzas lead with 45.89% of revenue, followed by Medium (30.49%).
● Small (21.77%) contributes a fair share, while XL (1.72%) and XXL (0.12%) sizes are
niche.
This confirms that large and medium pizzas are the most popular, aligning with group
dining patterns.

5. Category Performance (February Example)
In February, the Classic category sold the highest quantity (1,178 pizzas), followed by Supreme
(964), Veggie (944), and Chicken (875).
This shows consistent performance across categories, with Classics maintaining dominance.

6. Product-Level Insights
a. Top Performers
● Revenue Leaders:
○ The Thai Chicken Pizza → 43,434.25
○ The Barbecue Chicken Pizza → 42,768
○ The California Chicken Pizza → 41,409.50
○ The Classic Deluxe Pizza → 38,180.50
○ The Spicy Italian Pizza → 34,831.25
● Quantity Leaders:
○ The Classic Deluxe Pizza (2,453 sold)
○ The Barbecue Chicken Pizza (2,432)
○ The Hawaiian Pizza (2,422)
○ The Pepperoni Pizza (2,418)
○ The Thai Chicken Pizza (2,371)
● Order Leaders:
○ The Classic Deluxe Pizza (2,329 orders)
○ The Hawaiian Pizza (2,280)
○ The Pepperoni Pizza (2,278)
○ The Barbecue Chicken Pizza (2,273)
○ The Thai Chicken Pizza (2,225)

These results show Chicken and Deluxe pizzas are revenue drivers, while Classic, Hawaiian,
and Pepperoni excel in popularity and frequency of orders.

b. Underperformers
● Revenue Laggards:
○ The Brie Carre Pizza → 11,588.50
○ The Green Garden Pizza → 13,955.75
○ The Spinach Supreme Pizza → 15,277.75
○ The Mediterranean Pizza → 15,360.50
○ The Spinach Pesto Pizza → 15,596
● Lowest Quantity Sold:
○ The Brie Carre Pizza (490 units)
○ Mediterranean, Calabrese, Spinach Supreme, Soppressata (all under 1,000
units)
● Lowest Orders:
○ The Brie Carre Pizza (480 orders)
○ Mediterranean, Calabrese, Spinach Supreme, Chicken Pesto (all below 950
orders)

These pizzas represent low-demand SKUs, which may require menu reevaluation, better
marketing, or removal.

. Strategic Insights
1. Customer Spending Habits: Average spend per order is modest, but large pizzas
dominate sales, pointing to group-based consumption.
2. Sales Timing: Thursdays and Fridays are peak order days, suggesting opportunities for
targeted weekend promotions.
3. Menu Performance: While popular pizzas (Deluxe, Hawaiian, Chicken) are consistent
performers, niche pizzas like Brie Carre underperform significantly.

4. Product Mix: Balanced sales across categories indicate diverse customer preferences,
but Classics and Supremes are the most reliable drivers.
5. Opportunities:
○ Upsell combos around large pizzas.
○ Optimize underperforming pizzas (rebranding, discounts, or removal).
○ Boost midweek sales (Monday–Wednesday) with special offers.

Power BI Workflow
After extracting insights with SQL, the dataset was connected to Power BI for visualization.
Steps Followed
1. Connecting the Data
○ Imported the dataset into Power BI directly from the SQL database.
○ Verified data types (dates, floats, integers).
2. Transformations in Power Query
○ Created calculated columns such as Month Name and Day of Week for better
grouping.

Creating Measures

○ Used DAX measures to replicate SQL insights:
■ Total Revenue = SUM(total_price)
■ Avg Order Value = DIVIDE([Total Revenue],
DISTINCTCOUNT(order_id))
■ Total Orders = DISTINCTCOUNT(order_id)

3. Visuals Created
○ KPI Cards: Displayed Total Revenue, Total Pizzas Sold, Avg Order Value, Total
Orders.
○ Line Chart: Showed daily and monthly trends in orders.
○ Pie Chart: Revenue contribution by pizza category and pizza size.
○ Bar Chart: Top 5 and Bottom 5 pizzas by revenue, quantity, and orders.

How SQL and Power BI Complemented Each Other
● SQL Strengths:
○ Handled large dataset efficiently.
○ Allowed precise filtering, aggregation, and trend analysis.
○ Ensured that only relevant, pre-aggregated data was brought into Power
BI, improving performance.

● Power BI Strengths:
○ Enabled interactive dashboards that non-technical users can explore.
○ Provided visual clarity to SQL results (e.g., seeing peak sales days in a
line chart).
○ Allowed stakeholders to slice data by time, size, or category instantly.

Together, SQL handled the backend heavy lifting, while Power BI transformed queries
into actionable insights through visuals.

Lessons Learned and Challenges Faced
Lessons Learned
1. SQL is powerful for groundwork: Performing calculations in SQL before loading into
Power BI reduces complexity.
2. Data cleaning is crucial: Small inconsistencies in dates and categories can affect
analysis significantly.
3. Visual storytelling matters: Stakeholders connect better with visuals (e.g., seeing
Friday as the busiest day).

Challenges Faced

1. Performance Issues in Power BI: Large datasets sometimes slowed down visuals until
aggregations were optimized in SQL.
2. Choosing the right visuals: Presenting too much data cluttered the dashboard;
simplifying charts improved clarity.

6. Conclusion
This project highlighted how SQL and Power BI work hand-in-hand for effective business
analysis. SQL ensured data accuracy and prepared the foundation, while Power BI brought the
story to life visually. By combining both, i was able to uncover trends in customer behavior,
product performance, and revenue distribution, giving valuable insights to the pizza business for
decision-making.
