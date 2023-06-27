-- top 3 values of total invoice

SELECT 
    invoice_id, total
FROM
    invoice
ORDER BY total DESC
LIMIT 3;