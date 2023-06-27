-- city with the best customers

SELECT 
    SUM(total) AS Total_invoices, billing_city
FROM
    invoice
GROUP BY billing_city
ORDER BY Total_invoices DESC
LIMIT 1;