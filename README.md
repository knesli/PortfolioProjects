# Portfolio Projects 

---
## Pizza Sales Analysis

#### SQL Query: [Pizza Sales.sql](https://github.com/knesli/PortfolioProjects/blob/main/Pizza%20Sales.sql)
#### PowerBI Dashboard: [Pizza Sales.pbix](https://github.com/knesli/PortfolioProjects/blob/main/Pizza%20Sales.pbix)

#### Project Overview
This project aims to create a comprehensive Power BI dashboard for analyzing pizza sales data over a year, leveraging SQL for data retrieval and transformation. The objective is to provide stakeholders with actionable insights into sales performance, product trends, and business dynamics. 
#### Data Sources
Pizza Sales Data: The dataset used for this analysis is the [pizza_sales.csv](https://github.com/knesli/PortfolioProjects/blob/main/pizza_sales.csv) file, containing detailed information about the pizza sales.  
#### Tools
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
The primary goal of this project is to create an interactive and informative PowerBI dashboard using COVID-19 data, which encompasses information on cases, deaths, and vaccinations. SQL is used for data retrieval and extracting relevant information from the database. The project aims to provide a comprehensive view of the global and country-specific impact of the pandemic.

#### PowerBI Dashboard: [COVID19.pbix](https://github.com/knesli/PortfolioProjects/blob/main/COVID19.pbix)

#### Data Sources
COVID-19 Data: The dataset used for this analysis has been obtained from the "(https://ourworldindata.org/coronavirus)" website, containing detailed information about COVID-19, such as cases, deaths, and vaccinations.  
#### Tools
- Excel
- SQL Server
- Power BI
#### Data Cleaning/Preparation
- Excel has been employed to standardize data structures and ensure consistency for seamless integration with PowerBI.
- SQL queries have been utilized to clean and preprocess the data. This involves filtering out irrelevant information, handling null values, and aggregating data to facilitate meaningful insights.

#### Exploratory Data Analysis
Exploratory Data Analysis has been performed to explore the COVID-19 data to answer the key questions, such as:
- How did the case numbers, number of people vaccinated, and case fatality rate progress over time worldwide and for the countries?
- How were the numbers distributed by continents?
- Which countries were at the top based on case numbers, people vaccinated, and case fatality rate?
#### Data Analysis
As an example, the following SQL query has been implemented to determine the number of people vaccinated per 100,000 population: 
```python
WITH Vacc(Location, Date, Population, PeopleVaccinated)
AS
(SELECT dea.location,dea.date, dea.population, 
	CASE
		WHEN vac.people_vaccinated is null THEN max(vac.people_vaccinated) OVER (PARTITION BY dea.location order by dea.date) ELSE vac.people_vaccinated
	END
		AS people_vaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
ON dea.location = vac.location
AND dea.date = vac.date
WHERE dea.continent is not null
)
SELECT *, 100000 * PeopleVaccinated/Population as VaccinatedPer100k
FROM Vacc
ORDER BY Location, Date
```
#### Results/Findings
- ﻿9,674.84﻿ cases per 100,000 people were confirmed between 01/06/2020 and 11/08/2023.
- The case fatality rate, starting with 60%, declined to 0.9% at the end of the period.
- The total number of vaccines was the most in South America, while the total number of cases was the most in Europe per 100,000 population.
- The case fatality rate in Yemen was 18.1%, the highest among all countries.
---

## Personal Bank Statement Analysis 

#### Project Overview
This project involves a detailed examination of a yearly personal bank statement to gain insights into financial behaviors, track changes in the account balance over time, categorize expenses, and identify prevalent payment methods. The goal is to provide a comprehensive overview of personal financial patterns and trends through the PowerBI Dashboard.

#### PowerBI Dashboard: [Bank Statement Analysis.pbix](https://github.com/knesli/PortfolioProjects/blob/main/Bank%20Statement%20Analysis.pbix)

#### Data Sources
The dataset used for this analysis has been obtained from personal bank account records, including  transaction details, dates, amounts, etc.  
#### Tools
- Power BI
#### Data Cleaning/Preparation
- Transactions are categorized into specific expense categories and payment methods. Power Query Editor has been employed to automatically assign categories and payment methods based on transaction descriptions. 
- Unused columns have been removed.

#### Exploratory Data Analysis
Exploratory Data Analysis has been performed to explore the bank statement data to answer the key questions, such as:
- How are the spending distributed by category such as rent, groceries, transportation, etc?
- What is the proportion of the payment methods used for the expenses?
- How does the balance in the account change over the period?
- In which months is the highest amount of money debited and credited? 

#### Results/Findings
- ﻿The most considerable proportion of expenses are made through transfers from the account to other parties.
- The highest amount of money is spent on Tuesday on average.
- Total debited amount and total credited amount are highest in December and January, respectively.
- Rent accounts for most of the total expenses over the period, at almost 34%.

---
## Supermarket Sales - Exploratory Data Analysis

#### Project Overview
The project aims to conduct an exploratory analysis of a supermarket's sales data to derive insights into product performance, revenue patterns, and customer behavior. Leveraging the Interactive Python Notebook, the analysis spans data cleaning, exploratory data analysis (EDA), and uncovering valuable information to guide strategic decision-making for the supermarket.

#### Supermarket Sales Analysis: [Supermarket Sales - Exploratory Data Analysis.ipynb](https://github.com/knesli/PortfolioProjects/blob/main/Supermarket%20Sales%20-%20Exploratory%20Data%20Analysis.ipynb)

#### Data Sources
Supermarket Sales Data: The dataset used for this analysis is the [supermarket_sales.csv](https://github.com/knesli/PortfolioProjects/blob/main/supermarket_sales.csv) file, containing detailed information about the supermarket sales.  

#### Tools
- Interactive Python Notebook
#### Data Cleaning/Preparation
- The data type of dates has been handled to ensure consistency.
- Duplicate sales records have been removed to enhance data integrity. 
- Null values for categorical and numerical features have been addressed and filled with the mode and mean of the features, respectively.

#### Exploratory Data Analysis
Exploratory Data Analysis has been performed to explore the Supermarket Sales data to answer the key questions, such as:
- How is the number of sales distributed over the product lines and, which product lines have the most sales? 
- Which product line has the most revenue? 
- Is there a relationship between gross income and gender?
- Is there a time trend in gross income?
#### Data Analysis
As an example, the following code has been implemented to examine and compare the number of sales by product lines and payment methods.
```
plt.figure(figsize=(12,10))
product_payment_count = df.groupby(["Product line", "Payment"]).size()
product_count = df.groupby(["Product line"]).size()
product_payment_perct = round(product_payment_count  / product_count * 100, 2)
product_payment_perct = product_payment_perct.reset_index()
product_payment_perct.rename(columns= {0: "count"}, inplace=True)
ax = sns.barplot(data = product_payment_perct, x="Product line", y="count" , hue="Payment", palette="mako")
for i in ax.containers:
    ax.bar_label(i)
```
#### Results/Findings
- ﻿Rating has very weak or no relationship with any other numerical features such as unit price, quantity, and gross income, while the quantity and gross income have a strong relationship.
- Gross income is distributed almost equally for male and female customers.
- There is no obvious time trend in gross income. 
- Home and lifestyle products have the most revenue on average, followed by sports and travel and health and beauty products.


----
## Customer Calls - Data Cleaning Project

#### Project Overview
The Customer Calls Data Cleaning Project aims to enhance the quality and consistency of the customer call dataset. The project leverages an Interactive Python Notebook to perform various data cleaning tasks, ensuring that the dataset is accurate, well-organized, and ready for further analysis.

#### Customer Calls - Data Cleaning Project: [Customer Calls - Data Cleaning Project.ipynb]()

#### Data Sources
Customer Calls Data: The dataset used for this analysis is the [Customer Call List.xlsx]() file, containing detailed information about the customer calls.  

#### Tools
- Interactive Python Notebook

#### Data Cleaning
- Duplicate records and unused columns have been deleted.
- Customers' names, last names, and phone numbers have been adjusted to have a common format for all of the records.
- Customer records without a phone number have been deleted because these customers are not reachable by call.
- The address column has been separated into Street Address, State, and Zip Code.
- Values having different formats in the same columns have been addressed.
- It is assumed that customer records that do not have a communication preference will be contacted.
- Customers who don't prefer to be contacted have been deleted from the records.
- Record indexes have been handled.

As an example, the following code has been implemented to remove any characters that are not numbers in the Phone_Number column and to set them in a common format.
```python
df["Phone_Number"] = df["Phone_Number"].astype(str)
df["Phone_Number"] = df["Phone_Number"].replace('[^0-9]',"",regex=True)
df["Phone_Number"] = df["Phone_Number"].apply(lambda x: x[0:3] + "-" + x[3:6] + "-" + x[6:10])
```

  
