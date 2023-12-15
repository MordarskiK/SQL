CREATE TABLE magazyn(
id serial,
nazwa varchar(100),
alejka SET('biala','czerwona','zielona'))

INSERT INTO magazyn(nazwa,alejka) VALUES('Mleko','biala');
INSERT INTO magazyn(nazwa,alejka) VALUES('Ser','czerwona');
INSERT INTO magazyn(nazwa,alejka) VALUES('Jogurt','zielona');
INSERT INTO magazyn(nazwa,alejka) VALUES('Jogurt owocowy','zielona,biala');
INSERT INTO magazyn(nazwa,alejka) VALUES('Jogurt Jagodowy','zielona,biala,czerwona');

INSERT INTO magazyn(nazwa,alejka) VALUES('Jogurt Sernikowy','zielona,biala,czerwony');

INSERT INTO magazyn(nazwa,alejka) VALUES('Jogurt Sernikowy','3');
INSERT INTO magazyn(nazwa,alejka) VALUES('Jogurt Sernikowy','6');


-- zad 1
-- stwórz własną tabelę i sprawdź numery w 'SET'cie

CREATE TABLE sklep(
id serial,
nazwa varchar(100),
typ_produktu SET('warzywa','miesa','nabial'))

INSERT INTO sklep(nazwa,typ_produktu) VALUES('wieprzowina','2')  -- 2 oznadza drugi wybór w set       2^1       
INSERT INTO sklep(nazwa,typ_produktu) VALUES('baklazan','3')     -- 3 oznacza 2 rekory 1 i 2          2^0 + 2^1
INSERT INTO sklep(nazwa,typ_produktu) VALUES('jajka','4')        -- 4 oznacza trzeci wybór w set      2^2       

INSERT INTO sklep(nazwa,typ_produktu) VALUES('pomidor','5')      -- 5 bierze 2 rekordy z 3 i 1        2^2 + 2^0
INSERT INTO sklep(nazwa,typ_produktu) VALUES('marchew','6')      -- 6 bierze 2 rekordy z 2 i 3        2^1 + 2^2
INSERT INTO sklep(nazwa,typ_produktu) VALUES('ziemniak','7')     -- 7 bierze 3 rekordy z 3 i 2 i 1    2^2 + 2^1 + 2^0

-- numery bazują na potęgach 2 
-- co onacza że:
-- warzywa = 1
-- miesa = 2
-- nabial = 4

-- warzywa + nabial = 5


-- PODZAPYTANIA --------------------------------------
SELECT customer_id, SUM(amount), AVG(amount)
FROM sakila_m.payment
WHERE customer_id in (SELECT customer_id 
                     FROM sakila_m.customer
                     WHERE first_name = 'MARION')
-------------------------------------------------------


CREATE TABLE towary(
    id serial,
    nazwa varchar(255),
    przyjecie timestamp
)

INSERT INTO towary(nazwa) VALUES('Mleko');
INSERT INTO towary(nazwa) VALUES('Smietana');
INSERT INTO towary(nazwa) VALUES('Ser');
INSERT INTO towary(nazwa) VALUES('Jogurt');




CREATE TABLE backstage(
	id serial,
	name varchar(255),
	hour timestamp)

INSERT INTO backstage(name) VALUES('brocoly');
INSERT INTO backstage(name) VALUES('cheese');

UPDATE backstage set name = 'potato' WHERE id = 2




