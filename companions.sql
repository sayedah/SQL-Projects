/*9. companions*/
with
/*join avatar name with each actor*/
  TEMP(login, name, realm, day, theme) as (
    SELECT Visit.login, Visit.name, Actor.realm, Actor.day, Actor.theme
    FROM Visit JOIN Actor ON Visit.login = Actor.login AND Visit.day = Actor.day AND Visit.realm = Actor.realm
    ORDER BY  Actor.login, Actor.day
  ),

  TWO (login1, name1, login2, name2, realm, theme, day) as (
  SELECT distinct A.login as login1, A.name as name1, B.login as login2, B.name as name2, A.realm, A.theme, A.day
  FROM TEMP A JOIN TEMP B ON A.realm = B.realm AND A.theme = B.theme AND A.day = B.day
  WHERE  A.login < B.login

  ),

  CONC (login1, name1, login2, name2, realm, theme, day, con) as (
    SELECT TWO.login1, TWO.name1, TWO.login2, TWO.name2, TWO.realm, TWO.theme, TWO.day,
    CASE
      WHEN login1 < login2 THEN name1 || name2
      WHEN login2 < login1 THEN name2 || name1
    END con
    FROM TWO
  ),

  COUNTCON(login1, name1, login2, name2, realm, day, con, count_both) as (
    SELECT login1, name1, login2, name2, realm, day, con, COUNT(con) OVER (PARTITION BY realm,con) as count_both
    FROM CONC
  ),

  COUNTSEP(name, realm, count) as (
    SELECT DISTINCT name, realm, count(name) as count
    FROM TEMP
    GROUP BY name, realm
    ORDER BY  name
  ),

  COUNTONE(login1, name1, login2, name2, realm, day, con, count_both, count1) as (
    SELECT COUNTCON.login1, COUNTCON.name1, COUNTCON.login2, COUNTCON.name2, COUNTCON.realm, COUNTCON.day, COUNTCON.con, COUNTCON.count_both, COUNTSEP.count
    FROM COUNTCON JOIN COUNTSEP ON COUNTCON.name1 = COUNTSEP.name  AND COUNTCON.realm = COUNTSEP.realm
  ),

  COUNTTWO(login1, name1, login2, name2, realm, day, con, count_both, count1, count2) as (
    SELECT COUNTONE.login1, COUNTONE.name1, COUNTONE.login2, COUNTONE.name2, COUNTONE.realm, COUNTONE.day, COUNTONE.con, COUNTONE.count_both, COUNTONE.count1, COUNTSEP.count
    FROM COUNTONE JOIN COUNTSEP ON COUNTONE.name2 = COUNTSEP.name AND COUNTONE.realm = COUNTSEP.realm
  )



SELECT login1 as companion1, name1 as fname, realm, login2 as companion2, name2 as lname
FROM COUNTTWO
WHERE count_both = count1 AND count_both = count2
ORDER BY realm, companion1
