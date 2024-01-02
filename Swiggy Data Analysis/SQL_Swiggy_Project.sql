USE sql_project;

-- 01 HOW MANY RESTAURANTS HAVE A RATING GREATER THAN 4.5?
SELECT COUNT(DISTINCT restaurant_no) AS High_Rated_Count
FROM swiggy 
WHERE rating > 4.5;

-- DISPLAY THE RESTAURANTS WITH RATING > 4.5
SELECT DISTINCT restaurant_no, 
	restaurant_name, 
    rating
FROM swiggy 
WHERE rating > 4.5;

-- 02 WHICH IS THE TOP 1 CITY WITH THE HIGHEST NUMBER OF RESTAURANTS?
SELECT city, 
	COUNT(DISTINCT restaurant_no) AS Rest_Count
FROM swiggy
GROUP BY city
ORDER BY Rest_Count DESC
LIMIT 1;

-- 03 HOW MANY RESTAURANTS SELL(HAVE WORD "Pizza" IN THEIR NAME)?
SELECT COUNT(DISTINCT restaurant_no) AS Pizza_Rest_Count
FROM swiggy
WHERE cuisine LIKE '%Pizza%';

-- 04 WHAT IS THE MOST COMMON CUISINE AMONG THE RESTAURANTS?
SELECT cuisine, 
	COUNT(*) AS Cuisine_Count
FROM swiggy
GROUP BY cuisine
ORDER BY Cuisine_Count DESC
LIMIT 1;

-- 05 WHAT IS THE AVERAGE RATING OF RESTAURANTS IN EACH CITY?
SELECT city, 
	AVG(rating) AS Avg_Rating
FROM swiggy
GROUP BY city;

-- 06 WHAT IS THE HIGHEST PRICE OF ITEM UNDER THE 'RECOMMENDED' MENU CATEGORY FOR EACH RESTAURANT?
SELECT DISTINCT restaurant_no, 
	MAX(price) AS Highest_Price
FROM swiggy
WHERE menu_category = 'RECOMMENDED'
GROUP BY restaurant_no;

-- 07 FIND THE TOP 5 MOST EXPENSIVE RESTAURANTS THAT OFFER CUISINE OTHER THAN INDIAN CUISINE
SELECT DISTINCT restaurant_no, 
	cost_per_person
FROM swiggy
WHERE cuisine <> 'INDIAN CUISINE'
ORDER BY cost_per_person DESC
LIMIT 5;

-- 08 FIND THE RESTAURANTS THAT HAVE AN AVERAGE COST WHICH IS HIGHER THAN THE TOTAL AVERAGE COST OF ALL    
-- RESTAURANTS TOGETHER
SELECT DISTINCT restaurant_no, 
	restaurant_name, 
    cost_per_person
FROM swiggy
WHERE cost_per_person > (
	SELECT AVG(cost_per_person)
    FROM swiggy
);

-- AVERAGE COST
SELECT AVG(cost_per_person)
FROM swiggy;

-- 09 RETRIEVE THE DETAILS OF RESTAURANTS THAT HAVE THE SAME NAME BUT ARE LOCATED IN DIFFERENT CITIES
SELECT DISTINCT S1.restaurant_name, S1.city, S2.city
FROM swiggy AS S1 JOIN swiggy AS S2
WHERE S1.restaurant_name = S2.restaurant_name AND
	s1.city <> s2.city;

-- 10 WHICH RESTAURANT OFFERS THE MOST NUMBER OF ITEMS IN THE 'MAIN COURSE' CATEGORY?
SELECT restaurant_no, 
	count(item) AS Item_Count
FROM swiggy
WHERE menu_category = 'MAIN COURSE'
GROUP BY restaurant_no, 
	menu_category
ORDER BY Item_Count DESC
LIMIT 1;

-- 11 LIST THE NAMES OF RESTAURANTS THAT ARE 100% VEGEATARIAN IN ALPHABETICAL ORDER OF RESTAURANT NAME
SELECT DISTINCT restaurant_name,
	(COUNT(CASE WHEN veg_or_nonveg = "Veg" THEN 1 END)) *100 / (COUNT(*)) AS Veg_Percent
FROM swiggy
GROUP BY restaurant_name
HAVING Veg_Percent = 100.00
ORDER BY restaurant_name;

-- 12 WHICH IS THE RESTAURANT PROVIDING THE LOWEST AVERAGE PRICE FOR ALL ITEMS?
SELECT DISTINCT restaurant_no, AVG(price) AS Avg_Price
FROM swiggy
GROUP BY restaurant_no
ORDER BY Avg_Price
LIMIT 1;

-- 13 WHICH TOP 5 RESTAURANT OFFERS HIGHEST NUMBER OF CATEGORIES?
SELECT DISTINCT restaurant_no, COUNT(DISTINCT menu_category) AS Category_Count
FROM swiggy
GROUP BY restaurant_no
ORDER BY Category_Count DESC
LIMIT 5;

-- 14 WHICH RESTAURANT PROVIDES THE HIGHEST PERCENTAGE OF NON-VEGEATARIAN FOOD?
SELECT DISTINCT restaurant_name,
	(COUNT(CASE WHEN veg_or_nonveg = "Non-Veg" THEN 1 END)) *100 / (COUNT(*)) AS Non_Veg_Percent
FROM swiggy
GROUP BY restaurant_name
ORDER BY Non_Veg_Percent DESC
LIMIT 1;

-- 15 Determine the Most Expensive and Least Expensive Cities for Dining:
WITH CityExpense AS(
	SELECT city,
		MAX(cost_per_person) AS Max_Cost,
		MIN(cost_per_person) AS Min_Cost
	FROM swiggy
    GROUP BY city
)

SELECT * 
FROM CityExpense
ORDER BY Max_Cost DESC;

-- 16 Calculate the Rating Rank for Each Restaurant Within Its City
WITH RatingRankByCity AS(
	SELECT DISTINCT restaurant_no,
		city,
        rating,
        DENSE_RANK() OVER(PARTITION BY city ORDER BY rating DESC) AS City_Rank
	FROM swiggy
)
SELECT * 
FROM RatingRankByCity
WHERE City_Rank = 1;
