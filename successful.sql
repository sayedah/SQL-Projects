/*6. successful*/ 
SELECT DISTINCT P.theme, COUNT(P.theme) as quests
FROM Quest P
WHERE P.theme NOT IN (
  SELECT DISTINCT Q.theme
  FROM Quest Q
  WHERE Q.succeeded IS NULL)
GROUP BY P.theme
ORDER BY P.theme;
