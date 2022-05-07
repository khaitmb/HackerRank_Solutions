/* SQL Tools Used: Subquerying in JOIN */

/* PLACEMENTS
You are given three tables: Students, Friends and Packages. Students contains two columns: ID and Name. Friends contains two columns: ID and 
Friend_ID (ID of the ONLY best friend). Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. Names must be ordered by the salary 
amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/

Students
+------------+----------+
|   Column   |   Type   |
+------------+----------+
| ID         | Integer  |
| Name       | String   |
+------------+----------+

Friends
+------------+----------+
|   Column   |   Type   |
+------------+----------+
| ID         | Integer  |
| Friend_ID  | Integer  |
+------------+----------+

Packages
+------------+----------+
|   Column   |   Type   |
+------------+----------+
| ID         | Integer  |
| Salary     | Float    |
+------------+----------+

/* HACKER RANK ACCEPTED SOLUTION */
SELECT s.Name
FROM Students s
JOIN Friends f 
    ON s.ID = f.ID
JOIN Packages p 
    ON s.ID = p.ID
JOIN (SELECT *
     FROM Friends f1
     JOIN Packages p1 ON f1.Friend_ID = p1.ID) Friend_Salary 
        ON f.Friend_ID = Friend_Salary.Friend_ID
WHERE p.salary < Friend_Salary.salary
ORDER BY Friend_Salary.salary;
