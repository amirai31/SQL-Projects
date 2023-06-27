-- names that have a song length longer than the average song length 

SELECT 
    name, milliseconds AS length
FROM
    track
WHERE
    milliseconds > (SELECT 
            AVG(milliseconds) 
        FROM
            track)
ORDER BY milliseconds DESC;
    
