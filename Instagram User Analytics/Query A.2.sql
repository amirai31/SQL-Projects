-- Inactive Users to Start Posting
SELECT *
FROM users
WHERE
    id NOT IN (SELECT user_id
			FROM photos)
ORDER BY id