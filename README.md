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
The primary goal of this project is to create an interactive and informative PowerBI dashboard using COVID-19 data, which encompasses information on cases, deaths, and vaccinations. SQL is used for data retrieval and extracting relevant information from the database. The project aims to provide a comprehensive view of the global and country-specific impact of the pandemic.

#### Supermarket Sales Analysis: [Supermarket Sales - Exploratory Data Analysis.ipynb](https://github.com/knesli/PortfolioProjects/blob/main/COVID19.pbix)

#### Data Sources
Supermarket Sales Data: The dataset used for this analysis is the [supermarket_sales.csv](https://github.com/knesli/PortfolioProjects/blob/main/supermarket_sales.csv) file, containing detailed information about the supermarket sales.  

#### Tools
- Interactive Python Notebook
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
```SQL
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
