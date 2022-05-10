/* Tools Used: Inner Joins, Differentiating Between HAVING and WHERE */

/*
 Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output 
 in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores 
 in same number of challenges, then sort them by ascending hacker_id.
 */

Hackers
+--------------+---------+
| Column       | Type    |
+--------------+---------+
| hacker_id    | Integer |
| name         | String  |
+--------------+---------+

Difficulty
+------------------+---------+
| Column           | Type    |
+------------------+---------+
| difficulty_level | Integer |
| score            | Integer |
+------------------+---------+

Challenges
+------------------+---------+
| Column           | Type    |
+------------------+---------+
| challenge_id     | Integer |
| hacker_id        | Integer | Id of the user that created the challenge.
| difficulty_level | Integer |
+------------------+---------+

Submissions
+--------------+---------+
| Column       | Type    |
+--------------+---------+
| submisson_id | Integer |
| hacker_id    | Integer |
| challenge_id | Integer |
| score        | Integer |
+--------------+---------+

SELECT h.hacker_id, h.name
FROM Hackers h
JOIN Submissions s ON h.hacker_id = s.hacker_id
JOIN Challenges c ON s.challenge_id = c.challenge_id
JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
WHERE d.score = s.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.submission_id) > 1
ORDER BY COUNT(s.submission_id) DESC, h.hacker_id;


