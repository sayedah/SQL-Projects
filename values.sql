/*add tuple*/
INSERT INTO Person (sin, name, address, phone) VALUES (123456789, Meredith Grey, 123 Avenue Rd, 9051234567);

/*display table*/
SELECT * FROM Person;

/* display tuple count*/
SELECT COUNT(id) FROM Person;

/*display specific attribute*/
SELECT attribute FROM Table WHERE club = '' and title = '';

/*update value*/
UPDATE Person SET name = 'newName' WHERE id = 3;

/*default value*/
o	birthdate DATE DEFAULT DATE ’0000-00-00’
o	ALTER TABLE MovieStar ADD phone CHAR(16) DEFAULT ’unlisted’;

/*delete tuple*/
DELETE FROM Person WHERE name = 'name';

/*delete all tuples*/
DELETE FROM Person;

/*delete a table*/
DROP TABLE Person;


/*expanded display*/
\x

/*see all the tables*/
/dt

/*drop all tables*/
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;



/*File to Command Line*/
/*Write in .sql file*/
SELECT sin, name, address
FROM Person
WHERE name = 'name';

/*Navigate to where file is, copy the pathway*/

/*Execute commands from file*/
\i C:/Users/shsap/Documents/3421/test.sql

/*Alter attributes in a table*/
ALTER TABLE Person ADD phone VARCHAR(12);
ALTER TABLE Person DROP phone;
