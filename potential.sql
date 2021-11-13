/*10. potential*/
with
  X(theme, realm, day) as (
      SELECT Quest.theme, Quest.realm, Quest.day, COUNT(*) as count
      FROM Quest
      WHERE Quest.succeeded IS NOT NULL
      GROUP BY Quest.theme, Quest.realm, Quest.day
  ),

  Y(theme, realm, day, earned) as (
        SELECT Q.theme, Q.realm, Q.day, MAX(T.sql) as earned
        FROM Quest Q
         JOIN  Loot L ON Q.theme = L.theme AND Q.realm = L.realm AND Q.day = L.day
         JOIN Treasure T ON L.treasure = T.treasure
        WHERE Q.succeeded IS NOT NULL
        GROUP BY  Q.theme, Q.realm, Q.day
    )

SELECT A.login, A.name, A.race, SUM(Y.earned) as earned, SUM(X.count) as quests
FROM  X
   JOIN  Actor Act ON X.theme = Act.theme AND X.realm = Act.realm AND X.day = Act.day
   JOIN Visit V ON Act.login = V.login AND Act.realm = V.realm AND Act.day = V.day
   RIGHT JOIN Avatar A ON A.login = V.login AND A.name = V.name
   LEFT JOIN Y ON X.theme = Y.theme AND X.realm = Y.realm AND X.day = Y.day
GROUP BY A.login, A.name, A.race
ORDER BY A.login, A.name;
