CREATE USER 'username'@localhost idenfified by 'password';
GRANT ALL PRIVILEGES ON *.* to 'username'@localhost;  // *.* = wszystkie bazy danych i wszystkie tabele
FLUSH PRIVILEGES; // potwierdzenie privileges - tu nie działa

Uprawnienia = CREATE, SELECT, DROP, DELETE, INSERT, UPDATE, ALTER
GRANT OPTION // uprawnienie do zmiany uprawnień

GRANT permission on database.table to 'username'@localhost;
REVOKE permission on database.table to 'username'@localhost;

DROP USER 'usrname'@localhost

hostname = %  // urzytkownik może logować się z każdej domeny
CREATE USER 'user'@'%.nazwa_domeny' identyfied BY 'haslo';
CREATE USER 'user'@'%' identyfied BY 'haslo';
CREATE USER 'user'@'213.186.88.112' identyfied BY 'haslo';

sys admin - mogą wszystko
server admin - ma dostęp do srwera
setup admin - kofiguracja setupu
security admin - bezpieczeństko
process admin - processy nie maja dostepu do BD
database creator - tworzenie baz danych
dysk admin - zarządzanie dyskami
bulk admin - masowe wstawianie danych 
access admin - dostęp 

DDL, DCL, DML - przypomieć!

CREATE role `admin`, `sysq`;
CREATE ROLE `ddddd`@localhost;

GRANT SELECT, INSERT, UPDATE,DELETE ON dbo.ksiazki to rola
REVOKE SELECT, INSERT, UPDATE,DELETE ON dbo.ksiazki to rola
DENY SELECT, INSERT, UPDATE,DELETE ON dbo.ksiazki to rola

GRANT UPDATE on data_base.* to user_name

GRANT USAGE 
SHOW GRANTS FOR 'user' 

Polecenie GRANT może zawierać dodatkowe klauzule:
MAX_QUERIES_PER_HOUR — ogranicza liczbę zapytań, 
MAX_UPDATES_PER_HOUR — ogranicza liczbę zmian wprowadzanych do bazy,
MAX_CONNECTIONS_PER_HOUR — ogranicza liczbę logowań użytkownika w ciągu godziny, 
MAX_USER_CONNECTIONS — ogranicza liczbę jednoczesnych połączeń uzyskiwanych z jednego konta


/////////////////////////////////////////
zad 
CREATE USER 'spejson2'@localhost;
SHOW GRANTS FOR 'spejson2'@localhost

GRANT SELECT,CREATE ON ksiegarnia.* FOR 'spejson2'@localhost;
SHOW GRANTS FOR 'spejson2'@localhost;

CREATE USER 'michal'@localhost;
SHOW GRANTS FOR 'michal'@localhost;

GRANT CREATE, SELECT ON ksiegarnia.* TO 'michal'@localhost;
SHOW GRANTS FOR 'michal'@localhost;

//////////////////////////////////////////
zad2
1. USE ksiegarnia;
2. CREATE USER 'uczen2'@'localhost' identified BY 'uczen123';
3. CREATE USER 'uczen2a'@'%' identified BY 'uczen321';
4. GRANT SELECT, INSERT, DELETE ON ksiegarnia.klient TO 'uczen2';
5. GRANT ALL PRIVILEGES ON ksiegarnia.zamowienia TO 'uczen2';
6. REVOKE DELETE ON ksiegarnia.zamowienia TO 'uczen2';

/////////////////////////////////////////////////////////////////////
/* UPDATE  26-09-2024 */
DQL – "Data Query Language" - SELECT - instrukcje
! DML - "Data Manipulation Language" - INSERT, UPDATE, DELETE - manipulacja danymi
! DDL - "Data Definition Language" - CREATE, ALTER, DROP - definiowanie 
! DCL - "Data Control Language" - GRANT, REVOKE - przydzielanie
TCL - COMMIT, ROUTEBACK, START TRANSACTION

Predykaty: BETWEEN, IN, DISTINCT, EXISTS, NOT, AND, OR

SELECT nazwa_kolumny from nazwa_tabeli
WHERE EXISTS
(SELECT ...)
/* przykład z bazy danych sklep */ 
SELECT producent.nazwa FROM producent 
WHERE EXISTS(
    	SELECT produkt.nazwa FROM produkt 
    	WHERE produkt.producent_id = producent.id AND produkt.cena < 10
    )

////////////////////////////////////////////////
1.
SELECT produkt.nazwa FROM produkt
WHERE produkt.ilosc BETWEEN 67 AND 68;

2.
SELECT produkt.nazwa, produkt.kategoria_id FROM produkt
WHERE produkt.cena BETWEEN 100 AND 150 AND produkt.kategoria_id IN (1,5,28);

3.
SELECT DISTINCT produkt.kategoria_id FROM produkt
WHERE produkt.nazwa LIKE "%0" AND produkt.cena > 1900;

4.
SELECT klient.miejscowosc FROM klient 
WHERE klient.ulica LIKE "R%";

5.
SELECT pracownik.nazwisko, pracownik.numer FROM pracownik
WHERE pracownik.telefon LIKE "6%5";

6.
SELECT transakcja.data FROM transakcja
WHERE transakcja.pracownik_id IN (10,20) AND transakcja.klient_id IN (10,20);

7.
SELECT produkt.nazwa, produkt.cena FROM produkt
WHERE produkt.ilosc NOT BETWEEN 2 AND 99;

8.
SELECT transakcja.data FROM transakcja
WHERE EXISTS (
    SELECT klient.id FROM klient
    WHERE klient.miejscowosc LIKE "P%" AND klient.ulica LIKE "K%"
    );

///////////////////////////////////////////////
/* Baza danych Hotel */
CREATE DATABASE hotel;

CREATE TABLE Uslugi_Wizyty (
	Liczba_elem int,
    Cena_jednostwowa decimal(15,2),
    Data_od datetime,
    Data_do datetime
    ) ENGINE=InnoDB  DEFAULT CHARSET=utf8;
///////////////////////////////////////////////////
/*  Update z 03-10-2024	  */

"Dziedziczenie - pobiera informacje z paru tabel naraz (może być dziedziczenie wykluczające)"

///////////////////////////////////////////////////
/*  Update z 10-10-2024   */

SELECT oddzial.nazwa, pracownicy.nazwisko FROM oddzial
JOIN pracownicy ON pracownicy.id_odzial = oddzial.id_odzial
WHERE pracownicy.nazwisko BETWEEN "B%" AND "L%"

SELECT oddzial.nazwa, pracownicy.nazwisko FROM oddzial
JOIN pracownicy ON pracownicy.id_odzial = oddzial.id_odzial
WHERE substring(pracownicy.nazwisko, 1,1) BETWEEN "B%" AND "L%"



SELECT klienci.nazwisko FROM klienci
WHERE substring(klienci.nazwisko, 2, 1) = "D" AND substring(klienci.nazwisko, -1, 1) = "a" 
	
SELECT klienci.nazwisko FROM klienci
WHERE substring(klienci.nazwisko, 2) LIKE "D%a" 


SELECT klienci.nazwisko FROM klienci
WHERE substring(klienci.nazwisko, 2, 1) = "D" AND substring(klienci.nazwisko, -2, 1) = "a" 
	
SELECT klienci.nazwisko FROM klienci
WHERE substring(klienci.nazwisko, 2) = "D%a_"


SELECT oddzial.nazwa, pracownicy.nazwisko FROM oddzial
JOIN pracownicy ON pracownicy.id_odzial = oddzial.id_odzial
WHERE pracownicy.nazwisko LIKE "B%" OR pracownicy.nazwisko LIKE "L%"


SELECT kategorie.nazwa, kategorie.opis FROM kategorie
WHERE kategorie.opis LIKE "%_%"      /* _ (podłoga) to dowolny znak */

////////////////////////////////////////////////////////////////////
/*  Update z 17-10-2024  */

"Encja - tabela (obiekt który można zdefiniować)
Atrytut encji - definicja
Krotka - rekord
Dane pierwotne - dane które muszą zostać wprowadzone (data urodzenia)
Dane pochodne - wyliczane na podstawie danych pierwotnych (wiek)
system zarządzania bazą danych - system zarządzający bazą i urzytkownikami
Struktura bazy danych - budowa bazy danych
Model hierarchiczny - 1 tablica (mogą być duplikaty)
Integralność danych - śpójność danych, gwarantuje że dane nie zostaną zmienione lub usunięte bez odpowiednich uprawnień
Integralnośc semantyczność - dopuszcza do kolumny tylko dane zgodne (numer do int, text do string) 
Create schema / create database - TO SAMO
integralność encji - każda encja musi mieć klucz i nie może się powtarzać
referencje - związki między tabelami
funkcje systemu zarządzania bazą danych - tworzenie struktur baz danych, wykonywanie operacji CRUD (Create, Read, Update, Delete), obsługa zapytań (selekcjonowanie danych), generowanie raportów i zestawień, administracja bazą danych

iloczyn kartezjański - tabela która ma w sobie połączenie tabel 

normalizacja baz danych - proces który ma za zadanie usuwanie kopii danych 
Postacie normalizacji (Normal Forms - NF):
  - przyrównanie do schematu
celem normalizacji jest usuwanie anomalii

1NF - kiedy wiersz ma postac w której kolumna ma tylko 1 wartość a dane są atomowe (dane są niepodzielne w każdej kolumnie), musi zawierać klucz główny
2NF - 1NF + tabela zawiera dane tylko konkretne do obiektu, tabele łączą się relacjami
3NF - 2NF + każdy element nie kluczowy jest tylko zależny od klucza głównego (nie kluczowa kolumna nie może zależeć od nie kluczowej kolumny) 
"

///////////////////////////////////////////////////////////////////
/*  Update 24-10-2024  */

CREATE DATABASE ksiegarnia;

CREATE TABLE wydawnictwo (
    id_wydawnictwa int not null AUTO_INCREMENT,
    nazwa varchar(50),
    PRIMARY KEY (id_wydawnictwa)
);

CREATE TABLE autor (
    id_autora int not null AUTO_INCREMENT,
    nazwisko varchar(50),
    imie varchar(50),
    PRIMARY KEY (id_autora)
);

CREATE TABLE ksiazki (
	id_ksiazki int not null AUTO_INCREMENT,
    tytul varchar(100),
    id_autora int,
    cena decimal(50,2),
    id_wydawnictwa int,
    rok_wydania int,
    PRIMARY KEY (id_ksiazki),
    FOREIGN KEY (id_autora) REFERENCES autor(id_autora)
    	ON UPDATE CASCADE
    	ON DELETE SET NULL,
    FOREIGN KEY (id_wydawnictwa) REFERENCES wydawnictwo(id_wydawnictwa)
    	ON UPDATE CASCADE
    	ON DELETE SET NULL
);

CREATE TABLE faktura (
	id_faktury int not null AUTO_INCREMENT,
    nr_faktury varchar(50),
    sposob_platnosci varchar(50),
    data_wystawienia datetime,
    PRIMARY KEY (id_faktury)
);

CREATE TABLE klient (
	id_klienta int not null AUTO_INCREMENT,
   	imie varchar(50),
    nazwisko varchar(50),
    miejscowosc varchar(50),
    kod_pocztowy varchar(6),
    ulica varchar(50),
    nr_domu varchar(7),
    telefon varchar(12),
    e_mail varchar(50),
    PRIMARY KEY (id_klienta)
);

CREATE TABLE zamowienia (
	id_zamowienia int not null AUTO_INCREMENT,
	id_klienta int,
    data_zamowienia datetime,
    data_wyslania datetime,
    koszt_wysylki decimal(50,2),
    id_faktury int,
    PRIMARY KEY (id_zamowienia),
    FOREIGN KEY (id_klienta) REFERENCES klient(id_klienta)
    	ON UPDATE CASCADE
    	ON DELETE SET NULL,
    FOREIGN KEY (id_faktury) REFERENCES faktura(id_faktury)
    	ON UPDATE CASCADE
    	ON DELETE SET NULL
);

CREATE TABLE szczegoly_zamowienia (
	id_zamowienia int,
    id_ksiazki int,
    ilosc int,
    FOREIGN KEY (id_zamowienia) REFERENCES zamowienia(id_zamowienia)
    	ON UPDATE CASCADE
    	ON DELETE SET NULL,
    FOREIGN KEY (id_ksiazki) REFERENCES ksiazki(id_ksiazki)
    	ON UPDATE CASCADE
    	ON DELETE SET NULL
);

INSERT INTO autor(imie,nazwisko) VALUES("J.K.","Rowling");
INSERT INTO autor(imie,nazwisko) VALUES("Albert","Camus");
INSERT INTO autor(imie,nazwisko) VALUES("Slawonir","Mrozek");
INSERT INTO autor(imie,nazwisko) VALUES("Boleslaw","Prus");
INSERT INTO autor(imie,nazwisko) VALUES("Adam","Mickiewicz");

INSERT INTO wydawnictwo(nazwa) VALUES("Greg");
INSERT INTO wydawnictwo(nazwa) VALUES("Helion");

INSERT INTO ksiazki(tytul,cena,rok_wydania,id_autora,id_wydawnictwa) VALUES("Harry Potter",13.99,2005,1,2);
INSERT INTO ksiazki(tytul,cena,rok_wydania,id_autora,id_wydawnictwa) VALUES("Dżuma",14.20,1947,2,2);
INSERT INTO ksiazki(tytul,cena,rok_wydania,id_autora,id_wydawnictwa) VALUES("Tango",11.25,1964,3,2);
INSERT INTO ksiazki(tytul,cena,rok_wydania,id_autora,id_wydawnictwa) VALUES("Lalka",10.18,1890,4,1);
INSERT INTO ksiazki(tytul,cena,rok_wydania,id_autora,id_wydawnictwa) VALUES("Dziady",16,1832,5,1);

INSERT INTO faktura(nr_faktury,sposob_platnosci,data_wystawienia) VALUES ("1005AB","karta","2024-01-19");
INSERT INTO faktura(nr_faktury,sposob_platnosci,data_wystawienia) VALUES ("287OP","gotowka","2024-09-07");
INSERT INTO faktura(nr_faktury,sposob_platnosci,data_wystawienia) VALUES ("GR501","karta","2024-11-16");

INSERT INTO klient(imie, nazwisko, miejscowosc, kod_pocztowy, ulica, nr_domu,telefon, e_mail) 
VALUES ("Jan","Kowalski","Zabrze","42-990","Składowa","2","123456789","mail@mail.pl");
INSERT INTO klient(imie, nazwisko, miejscowosc, kod_pocztowy, ulica, nr_domu,telefon, e_mail) 
VALUES ("Kuba","Kubowski","Warszawa","41-790","Klinowa","32","789456132","kuba@mail.pl");
INSERT INTO klient(imie, nazwisko, miejscowosc, kod_pocztowy, ulica, nr_domu,telefon, e_mail) 
VALUES ("Joanna","Prawa","Gliwice","12-321","Porowa","1","852963741","asia@mail.pl");

INSERT INTO zamowienia(data_zamowienia,data_wyslania,id_klienta,id_faktury,koszt_wysylki) VALUES ("2024-10-11","2024-10-15",1,7,14.99);
INSERT INTO zamowienia(data_zamowienia,data_wyslania,id_klienta,id_faktury,koszt_wysylki) VALUES ("2024-09-01","2024-09-02",2,8,12.25);
INSERT INTO zamowienia(data_zamowienia,data_wyslania,id_klienta,id_faktury,koszt_wysylki) VALUES ("2024-01-09","2024-01-30",3,9,9.99);

INSERT INTO szczegoly_zamowienia(id_ksiazki, id_zamowienia,ilosc) VALUES(1,2,2);
INSERT INTO szczegoly_zamowienia(id_ksiazki, id_zamowienia,ilosc) VALUES(3,1,1);
INSERT INTO szczegoly_zamowienia(id_ksiazki, id_zamowienia,ilosc) VALUES(5,3,5);

-------------------------------------------------------------
ALTER TABLE tabela1 RENAME rzeczy; / ALTER TABLE tabela1 RENAME TO rzeczy;
ALTER TABLE tabela1 ADD kolumna int NOT NULL DEFAULT "18";
ALTER TABLE tabela1 ADD (wiek int, plec varchar(1));
ALTER TABLE tabela1 MODIFY plec varchar(20) not NULL;
ALTER TABLE tabela1 CHANGE wiek ilelat int;
ALTER TABLE tabela1 DROP COLUMN ilelat;

ALTER TABLE tabela1 DROP COLUMN ilelat
TRUNCATE;

ALTER DATABASE nazwa_bazy CHARACTER SET utf8 COLLATE rodzaj_kodowania
ALTER TABLE nazwa_tabeli CHARACTER SET utf8 COLLATE rodzaj_kodowania  -- moga miec inne rodzaje kodowania 

ALTER TABLE nazwa_tabeli CONVERT TO CHARACTER SET utf8 COLLATE rodzaj_kodowania -- convert przeconvertuje a nie zmieni wiec nie ma strat

ALTER TABLE rzeczy MODIFY id NOT null, ADD PRIMARY KEY (id)

//////////////////////////////////////////////////////////////////
/*  Update z 31-10-2024  */

"ENUM - zabezpieczenie aby mogły być wpisywane tylko podane wartości
plec ENUM ('M','K');  /  plec CHAR(3) CHECK (plec in ('M','K'));

ALTER TABLE person ADD wiek int AFTER kom1;  - dodanie komurki po kom1
ALTER TABLE person ADD wiek int FIRST;  - dodanie komurki na początku

ALTER TABLE person DROP PRIMARY KEY;

ALTER TABLE person INDEX(wiek, kolor_oczu)  - klucz kompozytowy / złożony
ALTER TABLE person DROP INDEX(wiek, kolor_oczu)  
"
	
ALTER TABLE klient ADD plec ENUM('M','K') AFTER nazwisko;

UPDATE klient SET plec = 'M'
WHERE klient.id_klienta = 1;
-- brak błędu

UPDATE klient SET plec = 'N'
WHERE klient.id_klienta = 2;
-- wartosc nie została zapisana

----- NOTATKA ------
Po wykonaniu polecenia UPDATE które zmienia id_zamowienia w tabeli zamowienia

UPDATE zamowienia SET id_zamowienia = 1
WHERE id_zamowienia = 3;

wartość id_zamowienia również znmieniła się w tabeli szczegoły_zamowienia poprzez urzycie CASCADE

---------------------------------------------------------------

Po usunięciu z tabeli wydawnictwo wydawnictwa o id 1

DELETE FROM wydawnictwo 
WHERE wydawnictwo.id_wydawnictwa = 1

W tabeli ksiazki w kolumnie id_wydawnictwa wartość 1 została zmieniona na NULL

---------------------------------------------------------------

Po dodaniu do tabeli klient kolumny plec z użyciem ENUM

ALTER TABLE klient ADD plec ENUM('M','K') AFTER nazwisko;

oraz dodaniu wartości do komlny plec przy urzyciu komend 

(Wpisanie poprawnej wartości)
UPDATE klient SET plec = 'M'
WHERE klient.id_klienta = 1;

Nie ma błędu i wartość zostaje poprawnie zapisana

(Wpisanie błędnej wartości)
UPDATE klient SET plec = 'N'
WHERE klient.id_klienta = 2;

Powstaje błąd - wartość w polu plec zostaje zmieniona na pustą
