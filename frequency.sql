/*7. frequency*/
with
  E(login, realm, visits) as (
    SELECT V.login, V.realm, COUNT(V.realm) as visits
    FROM Visit V
    GROUP BY V.login, V.realm
    HAVING COUNT(V.realm) > 1
    ORDER BY V.login, V.realm
  ),

  F(login, realm, day, prev_day) as (
    SELECT A.login, A.realm, A.day, LAG (a.day,1) OVER (PARTITION BY a.login, a.realm ORDER BY a.day) as prev_day
    FROM Visit A
  ),

  G(login, realm, day, prev_day, daydiff) as (
    SELECT F.login, F.realm, f.day, F.prev_day, (F.day - F.prev_day) as daydiff
    FROM F
  ),

  H(login, realm, frequency) as (
    SELECT G.login, G.realm, CAST(AVG(G.daydiff) AS DECIMAL(5,2)) as frequency
    FROM G
    GROUP BY G.login, G.realm
    ORDER BY G.login, G.realm
  )

SELECT H.login, H.realm, E.visits, H.frequency
FROM H NATURAL JOIN E
WHERE E.visits > 1;
