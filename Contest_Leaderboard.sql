SELECT s.hacker_id, h.name, SUM(s.Max_Score) AS Total
FROM (SELECT s1.hacker_id, MAX(s1.score) AS Max_Score
    FROM Submissions s1
    GROUP BY s1.challenge_id, s1.hacker_id) s
JOIN Hackers h ON s.hacker_id = h.hacker_id
GROUP BY s.hacker_id, h.name
HAVING SUM(s.Max_Score) != 0
ORDER BY Total DESC, s.hacker_id;
