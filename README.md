# Portfolio Projects 

---
## Pizza Sales Analysis

#### SQL Query: [Pizza Sales.sql](https://github.com/knesli/PortfolioProjects/blob/main/Pizza%20Sales.sql)
#### PowerBI Dashboard [Pizza Sales.pbix](https://github.com/knesli/PortfolioProjects/blob/main/Pizza%20Sales.pbix)

#### Project Overview
This project aims to create a comprehensive Power BI dashboard for analyzing pizza sales data over a year, leveraging SQL for data retrieval and transformation. The objective is to provide stakeholders with actionable insights into sales performance, product trends, and business dynamics. 
#### Data Sources
Pizza Sales Data: The dataset used for this analysis is the "pizza_sales.csv" file, containing detailed information about the pizza sales.  
#### Tools
- Excel
- SQL Server
- Power BI
#### Data Cleaning/Preparation
#### Exploratory Data Analysis
Exploratory Data Analysis has been performed to explore the pizza sales data to answer the key questions, such as:
- What is the daily and monthly trend for total pizza orders?
- How the pizza sales are distributed by pizza category and pizza size?
- Which pizzas are at the top and bottom based on revenue, quantity sold, and total orders?
#### Data Analysis
As an example, the following SQL query has been implemented to determine the distribution of pizza sales by pizza category: 
```SQL
SELECT pizza_category, SUM(total_price) as Total_Sales ,CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) as decimal (10,2)) as Perct_of_Sales 
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Perct_of_Sales DESC;
```
#### Results/Findings
- Classic Pizza and Large Pizza have made the most significant contribution to pizza sales revenue.
- The busiest days have been Thursday and Friday, while the busiest months have been July and January based on the total orders.
- The Thai Chicken Pizza has been the pizza with the highest revenue.
- The Brie Carre Pizza has been at the bottom among other pizzas based on revenue, quantity sold, and total orders.

---
## COVID-19 Analysis

#### Project Overview

#### Data Sources
Pizza Sales Data: The dataset used for this analysis is the "pizza_sales.csv" file, containing detailed information about the pizza sales.  
#### Tools
- Excel
- SQL Server
- Power BI
#### Data Cleaning/Preparation
#### Exploratory Data Analysis
Exploratory Data Analysis has been performed to explore the pizza sales data to answer the key questions, such as:
- What is the daily and monthly trend for total pizza orders?
- How the pizza sales are distributed by pizza category and pizza size?
- Which pizzas are at the top and bottom based on revenue, quantity sold, and total orders?
#### Data Analysis
As an example, the following SQL query has been implemented to determine the distribution of pizza sales by pizza category: 
```SQL
SELECT pizza_category, SUM(total_price) as Total_Sales ,CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) as decimal (10,2)) as Perct_of_Sales 
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Perct_of_Sales DESC;
```
#### Results/Findings
- Classic Pizza and Large Pizza have made the most significant contribution to pizza sales revenue.
- The busiest days have been Thursday and Friday, while the busiest months have been July and January based on the total orders.
- The Thai Chicken Pizza has been the pizza with the highest revenue.
- The Brie Carre Pizza has been at the bottom among other pizzas based on revenue, quantity sold, and total orders.

