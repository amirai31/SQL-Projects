-- countries with the most invoices

SELECT 
    COUNT(*) AS No_of_invoices, billing_country
FROM
    invoice
GROUP BY billing_country
ORDER BY No_of_invoices DESC;