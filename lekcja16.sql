CREATE DATABASE magazyn;

CREATE TABLE towary(
	id serial,
	nazwa varchar(255) NOT null,
    przyjecie timestamp
);

INSERT INTO towary(nazwa) VALUES ('Mleko');
INSERT INTO towary(nazwa) VALUES ('Smietana');
INSERT INTO towary(nazwa) VALUES ('Ser');
INSERT INTO towary(nazwa) VALUES ('Jogurt');

alter TABLE towary add stan int not null DEFAULT 30;

CREATE TABLE sprzedaz(
    id SERIAL,
    id_towaru int,
    sztuk int,
    cena int
);

INSERT INTO sprzedaz(id_towaru,sztuk,cena) VALUES (1,3,30); }
                                                              } BAD!!!!
UPDATE towary set stan=stan-3 WHERE id=1;                    }

START TRANSACTION;                                            } 
	INSERT INTO sprzedaz(id_towaru,sztuk,cena) VALUES(1,3,30);  } 
    UPDATE towary set stan=stan-3 WHERE id=1;                  } GOOD!!!
COMMIT;                                                       }


zad 28 transakcja w sakila:

START TRANSACTION;
	INSERT INTO actor(first_name,last_name) VALUES('DONALD','TRUMP');
    INSERT INTO film(title,language_id) VALUES('MAKE AMERICA GREAT AGAIN',1);
COMMIT;


START TRANSACTION;
	DELETE FROM actor WHERE actor_id = 202;
    DELETE FROM film WHERE film_id = 1002;
COMMIT;
------------------------------------------------------------------------

alter TABLE kursantki add ostatni_zakup_id int;

CREATE TABLE sprzedaz(
    id SERIAL,
    id_towaru int,
    sztuk int,
    cena int
);

ALTER TABLE sprzedaz add kursantki_id int;

CREATE TRIGGER nowaSprzedaz after INSERT ON sprzedaz 
for EACH ROW
UPDATE kursantki set ostatni_zakup_id=new.id WHERE kursantki_id = new.kursantki_id;

INSERT INTO sprzedaz (id_towaru,sztuk,cena,kursantki_id) VALUES(1,11,123,1);
INSERT INTO sprzedaz (id_towaru,sztuk,cena,kursantki_id) VALUES(2,22,222,2);
INSERT INTO sprzedaz (id_towaru,sztuk,cena,kursantki_id) VALUES(3,45,6,5);

