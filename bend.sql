/*5. bend*/
with
  X(login, name, realGender, avatarGender, numAvatars) as (
    SELECT A.login, Player.name, Player.gender, A.gender, COUNT(A.name) AS numAvatars
    FROM Avatar A JOIN Player ON A.login = Player.login
    GROUP BY A.login, Player.name, Player.gender, A.gender
    ORDER BY A.login
  ),

  Swappers(login, name, realGender) as (
    SELECT X.login, X.name, X.realGender
    FROM X
    WHERE X.realGender <> X.avatarGender
  ),

  Cnt(login, numAvatars) as (
    SELECT P.login, COUNT(P.login) as numAvatars
    FROM Avatar P
    WHERE P.login IN (SELECT Swappers.login FROM Swappers)
    GROUP BY P.login
    ORDER BY P.login
  )

SELECT Swappers.login, Swappers.name, Swappers.realGender, Cnt.numAvatars
FROM Swappers NATURAL JOIN Cnt;
