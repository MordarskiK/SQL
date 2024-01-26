zad. 5
z tabeli filmy usuń krokti w których nie zagrał żaden aktor

DELETE FROM filmy
WHERE filmy.id_filmu IN(
	SELECT filmy.id_filmu FROM filmy
    JOIN obsada ON filmy.id_filmu=obsada.id_filmu
    GROUP by filmy.id_filmu
    HAVING COUNT(obsada.id_aktora) = 0
)
-----------------------------------------------------------------------

CREATE DATABASE kursantki;

DROP TABLE IF EXISTS nauka;
DROP TABLE IF EXISTS kursantki;
DROP TABLE IF EXISTS kurs;

CREATE TABLE `kursantki` (
	`kursantki_id` INT AUTO_INCREMENT PRIMARY KEY,
	`imie` varchar(15) NOT NULL,
	`nazwisko` varchar(120) NOT NULL DEFAULT 'uczen'   
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT charset=utf8 COLLATE=utf8_polish_ci;

INSERT INTO kursantki(kursantki_id,imie) VALUES(1,'Ola');
INSERT INTO kursantki(kursantki_id,imie) VALUES(2,'Iza');
INSERT INTO kursantki(kursantki_id,imie) VALUES(3,'Kasia');
INSERT INTO kursantki(kursantki_id,imie) VALUES(4,'Ania');
INSERT INTO kursantki(kursantki_id,imie) VALUES(5,'Monika');
INSERT INTO kursantki(kursantki_id,imie) VALUES(6,'Basia');


CREATE TABLE `kurs` (
`kurs_id` INT AUTO_INCREMENT PRIMARY KEY,
`nazwa` varchar(15) NOT null
) ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT charset=utf8 COLLATE=utf8_polish_ci;


INSERT INTO kurs(nazwa) VALUES('PHP');
INSERT INTO kurs(nazwa) VALUES('C++');
INSERT INTO kurs(nazwa) VALUES('Java');
INSERT INTO kurs(nazwa) VALUES('Python');
INSERT INTO kurs(nazwa) VALUES('C#');
INSERT INTO kurs(nazwa) VALUES('HTML');
INSERT INTO kurs(nazwa) VALUES('JavaScript');
INSERT INTO kurs(nazwa) VALUES('CSS');
INSERT INTO kurs(nazwa) VALUES('SQL');
INSERT INTO kurs(nazwa) VALUES('C');


CREATE TABLE `nauka`(
`nauka_id` INT AUTO_INCREMENT PRIMARY KEY,
`kursantki_id` INT,
`kurs_id` int,
    
FOREIGN KEY(kursantki_id) REFERENCES kursantki(kursantki_id),
FOREIGN KEY(kurs_id) REFERENCES kurs(kurs_id)
)ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT charset=utf8 COLLATE=utf8_polish_ci;
  
INSERT INTO nauka(kursantki_id,kurs_id) VALUES(1,7);
INSERT INTO nauka(kursantki_id,kurs_id) VALUES(1,8);
INSERT INTO nauka(kursantki_id,kurs_id) VALUES(2,10);
INSERT INTO nauka(kursantki_id,kurs_id) VALUES(3,9);
INSERT INTO nauka(kursantki_id,kurs_id) VALUES(4,9);
INSERT INTO nauka(kursantki_id,kurs_id) VALUES(5,7);
INSERT INTO nauka(kursantki_id,kurs_id) VALUES(6,9);
INSERT INTO nauka(kursantki_id,kurs_id) VALUES(6,8);

-----------------------------------------------------------------------
zad 25 
    
CREATE TABLE `cena_kursu` (
`cena_kursu_id` int AUTO_INCREMENT PRIMARY KEY,
`kurs_id` int,
`cena` float,

FOREIGN KEY(kurs_id) REFERENCES kurs(kurs_id)
)ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT charset=utf8 COLLATE=utf8_polish_ci;

INSERT INTO cena_kursu(kurs_id,cena) VALUES(7,200);
INSERT INTO cena_kursu(kurs_id,cena) VALUES(8,100);
INSERT INTO cena_kursu(kurs_id,cena) VALUES(9,150);
INSERT INTO cena_kursu(kurs_id,cena) VALUES(10,300);
INSERT INTO cena_kursu(kurs_id,cena) VALUES(11,400);
INSERT INTO cena_kursu(kurs_id,cena) VALUES(12,225);
INSERT INTO cena_kursu(kurs_id,cena) VALUES(13,130);
INSERT INTO cena_kursu(kurs_id,cena) VALUES(14,170);
INSERT INTO cena_kursu(kurs_id,cena) VALUES(15,420);
INSERT INTO cena_kursu(kurs_id,cena) VALUES(16,69);


CREATE TABLE `kalendarz` (
`kalendarz_id` INT AUTO_INCREMENT PRIMARY KEY,
`kursantki_id` int,
`data_rozpoczecia_kursu` date,  
`data_zakonczenia_kursu` date,
    
FOREIGN KEY(kursantki_id) REFERENCES kursantki(kursantki_id)
)ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT charset=utf8 COLLATE=utf8_polish_ci;

INSERT INTO kalendarz(kursantki_id,data_rozpoczecia_kursu,data_zakonczenia_kursu) VALUES(1,CURRENT_DATE(),CURRENT_DATE+90);
INSERT INTO kalendarz(kursantki_id,data_rozpoczecia_kursu,data_zakonczenia_kursu) VALUES(2,CURRENT_DATE(),CURRENT_DATE+100);
INSERT INTO kalendarz(kursantki_id,data_rozpoczecia_kursu,data_zakonczenia_kursu) VALUES(3,CURRENT_DATE(),CURRENT_DATE+40);
INSERT INTO kalendarz(kursantki_id,data_rozpoczecia_kursu,data_zakonczenia_kursu) VALUES(4,CURRENT_DATE(),CURRENT_DATE+30);
INSERT INTO kalendarz(kursantki_id,data_rozpoczecia_kursu,data_zakonczenia_kursu) VALUES(5,CURRENT_DATE(),CURRENT_DATE+200);
INSERT INTO kalendarz(kursantki_id,data_rozpoczecia_kursu,data_zakonczenia_kursu) VALUES(6,CURRENT_DATE(),CURRENT_DATE+10);


CREATE TABLE `nauczyciele` (
`nauczyciele_id` INT AUTO_INCREMENT PRIMARY KEY,
`kurs_id` int,
`imie` varchar(15) not null,
`nazwiko` varchar(120) not null DEFAULT 'nauczyciel',
    
FOREIGN KEY(kurs_id) REFERENCES kurs(kurs_id)
)ENGINE=INNODB AUTO_INCREMENT=7 DEFAULT charset=utf8 COLLATE=utf8_polish_ci;

INSERT INTO nauczyciele(kurs_id,imie) VALUES(7,'Jan');
INSERT INTO nauczyciele(kurs_id,imie) VALUES(8,'Jakub');
INSERT INTO nauczyciele(kurs_id,imie) VALUES(10,'Natalia');
INSERT INTO nauczyciele(kurs_id,imie) VALUES(11,'Kamil');
INSERT INTO nauczyciele(kurs_id,imie) VALUES(16,'Szymon');

-----------------------------------------------------------------------------------------------------
zad 26 A:

CREATE DATABASE `muzyka`;


CREATE TABLE `piosenki` (
`piosenki_id` int AUTO_INCREMENT PRIMARY KEY,
`nazwa` varchar(255)
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT charset=utf8 COLLATE=utf8_polish_ci;

INSERT INTO piosenki(nazwa) VALUES('Bloodshot');
INSERT INTO piosenki(nazwa) VALUES('Specialz');
INSERT INTO piosenki(nazwa) VALUES('Loser,baby');
INSERT INTO piosenki(nazwa) VALUES('Stayed Gone');
INSERT INTO piosenki(nazwa) VALUES('Rather Die');


CREATE TABLE `wykonawcy` (
`wykonawcy_id` INT AUTO_INCREMENT PRIMARY KEY,
`piosenki_id` int,
`imie` varchar(255) not null,
`nazwisko` varchar(255) not null DEFAULT 'muzyk',
    
FOREIGN KEY(piosenki_id) REFERENCES piosenki(piosenki_id)    
)ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT charset=utf8 COLLATE=utf8_polish_ci;


INSERT INTO wykonawcy(piosenki_id,imie) VALUES(1,'Sam')


