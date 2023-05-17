-- contest winner
SELECT 
    photos.user_id,
    users.username,
    likes.photo_id,
    COUNT(*) AS total_Likes
FROM
    users
        INNER JOIN
    photos ON users.id = photos.user_id
        INNER JOIN
    likes ON photos.id = likes.photo_id
GROUP BY likes.photo_id
ORDER BY Total_Likes DESC
LIMIT 1
