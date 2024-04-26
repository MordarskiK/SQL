CREATE TABLE Autor
(
  id_autora int AUTO_INCREMENT NOT NULL	PRIMARY KEY,
  nazwisko varchar (50) NOT NULL,
  imie varchar (30) NOT NULL,
  narodowosc varchar (30),
  okres_tworzenia varchar (35),
  jezyk varchar (30),
  rodzaj_tworczosci varchar (35),
  osiagniecia varchar (200)
);

CREATE TABLE Faktura
(
  nr_faktury int AUTO_INCREMENT NOT NULL PRIMARY KEY,
  sposob_platnosci varchar (30),
  data_wystawienia_faktury date
);

CREATE TABLE Klient
(
  id_klienta int AUTO_INCREMENT NOT NULL	PRIMARY KEY,
  nazwisko varchar (60) NOT NULL,
  imie varchar (40) NOT NULL,
  kod_pocztowy varchar (6),
  miejcowosc varchar (50) DEFAULT 'Warszawa',
  ulica varchar (50),
  nr_domu varchar (7),
  PESEL varchar (11) NOT NULL,
  telefon varchar (12) UNIQUE,
  adres_e_mail varchar (70)
);

CREATE TABLE Ksiazki
(
  id_ksiazki int AUTO_INCREMENT NOT NULL	PRIMARY KEY,
  tytul varchar (100) NOT NULL,
  id_autora int NOT NULL,
  cena decimal,
  wydawnictwo varchar (20),
  temat varchar (30),
  miejsce_wydania varchar (28),
  jezyk_ksiazki varchar (15),
  opis varchar (100),
  rok_wydania varchar (4)
);

CREATE TABLE Rejestracja_zamowienia
(
  id_zamowienia int,
  id_ksiazki int,
  liczba_egz int
);

CREATE TABLE Zamowienia
(
  id_zamowienia int AUTO_INCREMENT NOT NULL	PRIMARY KEY,
  data_zlozenia_zamowienia date,
  data_wyslania date,
  koszt_wysylki decimal,
  id_klienta int NOT NULL,
  id_faktury int NOT NULL
);

CREATE VIEW sprzedaz_ksiazek AS
SELECT 
	klient.nazwisko AS K_Nazw, 
    klient.imie AS K_Im,
    ksiazki.tytul,
    autor.nazwisko AS A_Nazw,
    autor.imie AS A_Im,
    ksiazki.cena
FROM klient INNER JOIN zamowienia
ON klient.id_klienta = zamowienia.id_klienta
INNER JOIN ksiazki
ON rejestracja_zamowienia.id_ksiazki = ksiazki.id_ksiazki
INNER JOIN autor
ON ksiazki.id_autora = autor.id_autora;

CREATE VIEW ksiazki_i_autorzy AS
SELECT 
	autor.nazwisko, 
    autor.imie, 
    ksiazki.tytul, 
    ksiazki.cena
FROM autor INNER JOIN ksiazki
ON autor.id_autora = ksiazki.id_autora
WHERE (ksiazki.rok_wydania>2010);







