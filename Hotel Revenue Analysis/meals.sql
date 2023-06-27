
with hotels as(
	SELECT * FROM data2020
    UNION
    SELECT * FROM data2019
    UNION
    SELECT * FROM data2018    
)

SELECT * 
FROM hotels 
LEFT JOIN 
market_segment
ON hotels.market_segment = market_segment.market_segment
LEFT JOIN
meal_cost
ON
meal_cost.meal = hotels.meal;

