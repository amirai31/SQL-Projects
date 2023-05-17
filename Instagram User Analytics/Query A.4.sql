-- hashtag researching
SELECT 
    tags.tag_name, COUNT(*) AS Frequency
FROM
    tags
        INNER JOIN
    photo_tags ON tags.id = photo_tags.tag_id
GROUP BY photo_tags.tag_id
ORDER BY Frequency DESC
LIMIT 5