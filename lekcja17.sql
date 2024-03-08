Zad.29
  
create database zadanie;

CREATE TABLE memo(
	memo_id serial,
    tytul varchar(255),
    wpis varchar(255),
    termin timestamp
)

INSERT INTO memo(tytul,wpis) VALUES ('Urodziny Babci','Kupic kwiatki i zrobic tort');
INSERT INTO memo(tytul,wpis) VALUES ('Zadania domowe','2 zadania z matmy, 1 zadanie z infy');
INSERT INTO memo(tytul,wpis) VALUES ('Rozwowa z szefem','Przygotować plan sprzedarzy');

ALTER TABLE memo add zrobione int DEFAULT 0;

CREATE TABLE sukcesy(
	sukcesy_id serial,
    wydarzenie varchar(255),
    czas timestamp
)

DELIMITER $$
	CREATE TRIGGER zrobioneZadanie after UPDATE ON memo
    FOR EACH ROW
        BEGIN
            IF new.zrobione>0 THEN
                INSERT INTO sukcesy(wydarzenie) 
                VALUES (new.tytul);
            end IF;
        end $$
DELIMITER ; 

UPDATE memo SET zrobione = 1 WHERE memo_id = 1
---------------------------------------------------------------------------------------------------
https://dev.mysql.com/doc/index-other.html   -  import world database

widok to zapytanie do bazy danych zapisywane pod daną nazwą

SELECT
	GNP AS PKB,
    name as Kraj,
    Continent as Kontynent,
    Population as Populacja,
    SurfaceArea as Powierzchnia,
    LifeExpectancy as DlugoscZycia
FROM
	country
ORDER BY PKB DESC;

--------------------
CREATE VIEW PozycjaPKB AS
SELECT
	GNP AS PKB,
    name as Kraj,
    Continent as Kontynent,
    Population as Populacja,
    SurfaceArea as Powierzchnia,
    LifeExpectancy as DlugoscZycia
FROM
	country
ORDER BY PKB DESC;

SELECT PKB,Kraj FROM pozycjapkb

--------------------------	
CREATE VIEW Miasta AS
SELECT
    name as Miasto,
    CountryCode as KodKraju,
    District as Dystrykt,
    Population as Populacja
FROM
	city
ORDER BY Populacja DESC;

---------------------
CREATE VIEW JezykKraju AS
SELECT
    CountryCode as KodKraju,
    Language as Jezyk,
    IsOfficial as JestOficjalny,
    Percentage as Procent
FROM
	countrylanguage
ORDER BY Procent DESC;

--------------------------

set @nr := 0;								 |  Jedno
SELECT @nr := @nr+1 as Pozycja,PKB, Kraj, DlugoscZycia FROM pozycjapkb;	 |  zapytanie


SELECT * FROM miasta WHERE miasta.Dystrykt='New York' ORDER BY miasta.Populacja DESC;


SELECT 
	CONCAT(C.first_name,' ',C.last_name) AS Klient,
    SUM(P.amount) AS Zaplacil,
    AVG(P.amount) AS Srednia
FROM
	payment as P, customer AS C
WHERE
	C.customer_id = P.customer_id
GROUP BY
	C.customer_id
ORDER BY Zaplacil DESC;



CREATE VIEW Platnosci AS
SELECT 
	CONCAT(C.first_name,' ',C.last_name) AS Klient,
    SUM(P.amount) AS Zaplacil,
    AVG(P.amount) AS Srednia
FROM
	payment as P, customer AS C
WHERE
	C.customer_id = P.customer_id
GROUP BY
	C.customer_id
ORDER BY Zaplacil DESC;

---------------------------------------------------------------
A: tabela polaczona 2 tabele z world: zad C

B: 3 widoki z sakili z join:

CREATE VIEW sakila_stalk_customer AS
SELECT 
	C.first_name AS Imie,
    C.last_name AS Nazwisko,
    A.address AS Adres
FROM
	(customer AS C
    JOIN address as A ON (C.address_id=A.address_id))
GROUP BY C.first_name
ORDER BY C.first_name;
	
C: dodac kraj do jezyka:

CREATE VIEW KrajIJezyk AS
SELECT 
	country.Name AS Kraj, 
    countrylanguage.Language AS Jezyk, 
    countrylanguage.IsOfficial AS CzyOficjalny, 
    countrylanguage.Percentage AS Procent
FROM 
	country 
LEFT JOIN 
	countrylanguage ON country.Code=countrylanguage.CountryCode
WHERE 
	country.Code=countrylanguage.CountryCode
GROUP BY
	country.Name	
ORDER BY Procent DESC;



















