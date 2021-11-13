/*3. evening*/
SELECT theme, day, realm, succeeded
FROM Quest
WHERE Quest.succeeded > '20:00:00' OR Quest.succeeded IS NULL
ORDER BY theme, day ASC;
