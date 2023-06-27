-- best customer
SELECT 
    c.customer_id, ROUND((SUM(i.total)), 2) AS Total
FROM
    customer AS c
        JOIN
    invoice AS i ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY Total DESC;