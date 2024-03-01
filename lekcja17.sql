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

