WITH
  V(login, name, gender, race, realm, day) as (
    SELECT Visit.login, Visit.name, Avatar.gender, Avatar.race, Visit.realm, Visit.day
    FROM Visit NATURAL JOIN Avatar
  ),

  Price(realm, login, day, treasure, sql) as (
    SELECT Loot.realm, Loot.login, Loot.day, Loot.treasure, Treasure.sql
    FROM Loot NATURAL JOIN Treasure
    WHERE Loot.login IS NOT NULL
  ),

  Y(realm, race, gender, sql) as (
    SELECT V.realm, V.race, V.gender, SUM(Price.sql) as sum
    FROM V NATURAL JOIN Price
    GROUP BY V.realm, V.race, V.gender
    ORDER BY V.realm, V.race
  ),


  A(realm, race, total) as (
    SELECT Y.realm, Y.race, MAX(Y.sql) as total
    FROM Y
    GROUP BY Y.realm, Y.race
  )

  SELECT DISTINCT A.realm, A.race, Y.gender, A.total
  FROM A JOIN Y ON
  Y.realm = A.realm AND Y.race = A.race AND Y.sql = A.total;
