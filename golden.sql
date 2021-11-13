/*2. golden*/
with Gold (prize) as (
  SELECT treasure
  FROM Treasure T
  WHERE T.treasure LIKE '%Gold%'
)

(SELECT DISTINCT Quest.realm, Quest.day, Quest.theme
  FROM Quest NATURAL JOIN (
  SELECT realm, day, theme
  FROM Loot L, Gold G
  WHERE L.treasure LIKE G.prize) as Temp
  ORDER BY Quest.day)
EXCEPT
(SELECT realm, day, theme
  FROM Quest
  WHERE succeeded IS NULL);
