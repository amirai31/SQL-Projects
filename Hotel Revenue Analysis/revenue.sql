-- check if revenue is growing every year

with hotels as(
	SELECT * FROM data2020
    UNION
    SELECT * FROM data2019
    UNION
    SELECT * FROM data2018    
)

SELECT 
	arrival_date_year,
    hotel,
	ROUND((SUM((stays_in_week_nights + stays_in_weekend_nights)*adr)),2) AS Revenue
FROM hotels
GROUP BY arrival_date_year,hotel;
