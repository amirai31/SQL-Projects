-- email, first name, last name, and genre of all rock music listeners

SELECT DISTINCT
	first_name, last_name, email
FROM 
	customer 
        JOIN
    invoice ON customer.customer_id = invoice.customer_id
		JOIN
    invoice_line ON invoice.invoice_id = invoice_line.invoice_id
WHERE track_id IN (
	SELECT 
		track_id
	FROM track 
		JOIN
	genre ON track.genre_id = genre.genre_id
    WHERE genre.name = "Rock"
)    
ORDER by email;
    

