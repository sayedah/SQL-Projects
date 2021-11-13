/*4. cheaters*/
with Cheaters(login, day) as (
  SELECT A.login, A.day
  FROM Actor A
  GROUP BY A.login, A.day
  HAVING COUNT(login) >= 2 AND COUNT(day) >= 2
)

SELECT DISTINCT T.login, T.realm, T.day, V.name, T.theme
FROM Visit V JOIN (SELECT A.login, A.day, A.realm, A.theme
FROM Actor A JOIN Cheaters C ON
A.login = C.login AND A.day = C.day) as T ON
V.login = T.login AND V.day = T.day;
