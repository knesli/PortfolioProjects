
SELECT * 
FROM pizza_sales;

--Total Revenue
SELECT SUM(total_price) as Total_Revenue 
FROM pizza_sales ;


--Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) as Av_Order_Value 
FROM pizza_sales ;


--Total Pizza Sales
SELECT SUM(quantity) as Total_Pizza_Sales 
FROM pizza_sales ;


--Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales ;


--Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) as decimal(10,2)) / CAST(COUNT(DISTINCT order_id) as decimal(10,2)) as decimal(10,2)) as Av_Pizzas_Per_Order 
FROM pizza_sales;


--Total Orders by Day
SELECT DATENAME(DW, order_date) as order_date, COUNT(DISTINCT order_id) as total_orders
FROM pizza_sales 
GROUP BY DATENAME(DW, order_date);


--Total Orders by Month
SELECT DATENAME(MONTH, order_date) as Month_Name , COUNT(DISTINCT order_id) as Total_Orders 
FROM pizza_sales 
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders DESC;


--Percentage of Sales by Pizza Category
SELECT pizza_category, SUM(total_price) as Total_Sales ,CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) as decimal (10,2)) as Perct_of_Sales 
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Perct_of_Sales DESC; 


--Percentage of Sales by Pizza Size
SELECT pizza_size, SUM(total_price) as Total_Sales ,CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) as decimal (10,2)) as Perct_of_Sales 
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Perct_of_Sales DESC;  


--Total Pizzas Soldy by Pizza Category
SELECT pizza_category, sum(quantity) as Total_Sales 
FROM pizza_sales
GROUP BY pizza_category;



--Top 5 Best Seller Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) as Revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue DESC;


--Top 5 Best Seller Pizzas by Total Quantity
SELECT TOP 5 pizza_name, SUM(quantity) as Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Quantity DESC;


--Top 5 Best Seller Pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;


--Bottom 5 Best Seller Pizzas by Revenue
SELECT TOP 5 pizza_name, SUM(total_price) as Revenue 
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Revenue ASC;


--Bottom 5 Best Seller Pizzas by Total Quantity
SELECT TOP 5 pizza_name, SUM(quantity) as Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Quantity ASC;


--Bottom 5 Best Seller Pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) as Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC;






