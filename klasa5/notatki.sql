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
