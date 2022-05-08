/* Tools Used: Subquerying in FROM */

/*
The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and 
total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by 
ascending hacker_id. Exclude all hackers with a total score of  from your result.
*/
 
 Hackers
+-----------+---------+
| Column    | Type    |
+-----------+---------+
| hacker_id | Integer |
| name      | String  |
+-----------+---------+

Submissions
+--------------+---------+
| Column       | Type    |
+--------------+---------+
| submisson_id | Integer |
| hacker_id    | Integer |
| challenge_id | Integer |
| score        | Integer |
+--------------+---------+

/* HACKER RANK ACCEPTED SOLUTION */

SELECT s.hacker_id, h.name, SUM(s.Max_Score) AS Total
FROM (SELECT s1.hacker_id, MAX(s1.score) AS Max_Score
    FROM Submissions s1
    GROUP BY s1.challenge_id, s1.hacker_id) s
JOIN Hackers h ON s.hacker_id = h.hacker_id
GROUP BY s.hacker_id, h.name
HAVING SUM(s.Max_Score) != 0
ORDER BY Total DESC, s.hacker_id;


