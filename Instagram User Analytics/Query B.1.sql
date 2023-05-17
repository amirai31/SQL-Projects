-- user engagement
WITH new AS (
	SELECT 
		users.id AS id, COUNT(photos.id) AS p_id
	FROM
		users
			LEFT JOIN
		photos ON users.id = photos.user_id
	GROUP BY users.id)

SELECT SUM(p_id) AS photos, 
		COUNT(id) AS users, 
        ROUND((SUM(p_id)/COUNT(id)),2) AS avg_posts
FROM new;

