-- launch Campaign
SELECT 
    DAYNAME(created_at) AS Day,
    COUNT(*) AS Registrations
FROM
    users
GROUP BY Day
ORDER BY Registrations DESC, Day;