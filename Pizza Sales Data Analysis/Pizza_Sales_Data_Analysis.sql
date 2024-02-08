-- Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales_data;

-- Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Avg_Order_Value
FROM pizza_sales_data;

-- Total Pizzas Sold
SELECT SUM(quantity) AS Total_Pizzas
FROM pizza_sales_data;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales_data;

-- Average Pizza Per Order
SELECT ROUND((SUM(quantity)/COUNT(DISTINCT order_id)),2) AS Avg_Pizza_Per_Order
FROM pizza_sales_data;

-- Daily Trend for Total Orders
SELECT DAYNAME(order_date) AS Day, 
	COUNT(DISTINCT order_id) AS Orders
FROM pizza_sales_data
GROUP BY DAYNAME(order_date);

-- Monthly Trend for Total Orders
SELECT MONTHNAME(order_date) AS Month, 
	COUNT(DISTINCT order_id) AS Orders
FROM pizza_sales_data
GROUP BY MONTHNAME(order_date);

-- Percentage of Sales by Pizza Category
SELECT pizza_category, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sale,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_data) AS DECIMAL(10,2)) AS Percent
FROM pizza_sales_data
GROUP BY pizza_category
ORDER BY Total_Sale;

-- Percentage of Sales by Pizza Size
SELECT pizza_size, 
	CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_Sale,
	CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales_data) AS DECIMAL(10,2)) AS Percent
FROM pizza_sales_data
GROUP BY pizza_size
ORDER BY pizza_size;

-- Total Pizzas Sold by Pizza Category
SELECT pizza_category, 
	SUM(quantity) AS Total_Sale
FROM pizza_sales_data
GROUP BY pizza_category;

-- Top 5 Pizzas by Revenue
SELECT pizza_name, 
	SUM(total_price) AS Total_Sale
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_Sale DESC
LIMIT 5;

-- Bottom 5 Pizzas by Revenue
SELECT pizza_name, 
	SUM(total_price) AS Total_Sale
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_Sale 
LIMIT 5;

-- Top 5 Pizzas by Quantity
SELECT pizza_name, 
	SUM(quantity) AS Pizza_Sold
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Pizza_Sold DESC
LIMIT 5;

-- Bottom 5 Pizzas by Quantity
SELECT pizza_name, 
	SUM(quantity) AS Pizza_Sold
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Pizza_Sold 
LIMIT 5;

-- Top 5 Pizzas by Total Orders
SELECT pizza_name, 
	COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_Order DESC
LIMIT 5;

-- Bottom 5 Pizzas by Total Orders
SELECT pizza_name, 
	COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales_data
GROUP BY pizza_name
ORDER BY Total_Order
LIMIT 5;

-- Top 5 'Classic' category pizzas by Total Orders
SELECT pizza_name, 
	COUNT(DISTINCT order_id) AS Total_Order
FROM pizza_sales_data
WHERE pizza_category = 'Classic'
GROUP BY pizza_name
ORDER BY Total_Order DESC
LIMIT 5;