-- Bots & Fake Accounts
SELECT 
    id, username, COUNT(*) AS likes
FROM
    users
        INNER JOIN
    likes ON users.id = likes.user_id
GROUP BY id
HAVING likes = MAX(photo_id)
