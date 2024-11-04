SELECT concat(CONCAT(UPPER(LEFT(uczniowie.imie,1)),LOWER(RIGHT(uczniowie.imie,LENGTH(uczniowie.imie)-1))),
              ' ',
              CONCAT(UPPER(LEFT(uczniowie.nazwisko,1)),LOWER(RIGHT(uczniowie.nazwisko,LENGTH(uczniowie.nazwisko)-1))))
              as 'Imie i Nazwosko',
       concat('wiek: ',
              uczniowie.wiek,
              ' lat, nr w dzienniku: '
              ,uczniowie.id) 
              as 'informacje dodatkowe' 
FROM uczniowie;

--------------------------------------------------------

Istnieją 3 grupy uprawnień w bazie danych MySQL/MariaDB:

1. Do zarządzani danymi: select, insert, delete, update.
2. Do manipulowania strukturą baz oraz tabel, m.in: create, alter, drop, show.
3. Do administracji serwerem, m.in: grant, create user, reload, super.

Każde z tych uprawnień może być pojedynczo lub zbiorczo przypisywane użytkownikowi. Użytkownik może mieć określona prawa działające na poziomie całego serwera, pojedynczej bazy, pojedynczej tabeli w bazie, czy do widoku utworzonego na podstawie zapytania.

--wyświetlenie zalogowanych użytkowników:

select current_user();

--alternatywnie: 

select user();

--wyświetlenie wszystkich istniejących użytkowników na serwerze:

select user from mysql.user;

--wyświetlenie uprawnień zalogowanego użytkownika:

show GRANTS;

/*
utworzenie nowego użytkownika - nazwa_użytkownika powinna zostać zamieniona na właściwy login, np: Dawid, Dyrektor czy Handlowiec, identified by to jego hasło
pamiętaj o apostrofach! WAŻNE!!! Localhost oznacza, że jest to użytkownik mający prawa do baz tylko na serwerze, na którym został utworzony:
*/ 
create user 'nazwa_użytkownika'@'localhost' identified by 'qwerty';
/* jesli nie ustawilismy hasla podczas tworzenia uzytkownika, mozemy to zrbic poleceniem:*/
alter user 'superuser'@'localhost' identified by 'qwerty';
/*logowanie*/
mysql -u superuser -p
/*
nadanie pełnych praw dla przykładowego użytkownika marian do wszystkich baz i tabel na serwerze (pierwsza * oznacza wszystkie bazy, kolejna * po kropce oznacza wszystkie tabele w bazach, 
'with grant option' oznacza, że marian może również tworzyć użytkowników i nadawać im uprawnienia:
*/

grant all PRIVILEGES on *.* to 'marian'@'localhost' with grant option;

Przykłady:

--utworzenie konta użytkownika bibliotekarz (zapytanie 1) i nadanie mu pełnych praw do bazy biblioteka (zapytanie 2):

create user 'bibliotekarz'@'localhost' identified by 'qwerty';
grant all PRIVILEGES on biblioteka.* to 'bibliotekarz'@'localhost';

--utworzenie konta użytkownika bibliotekarz_autor (zapytanie 1) i nadanie mu pełnych praw tylko do tabeli autorzy w bazie biblioteka (zapytanie 2):

create user 'bibliotekarz_autor'@'localhost' identified by 'qwerty';
grant all PRIVILEGES on biblioteka.autorzy to 'bibliotekarz_autor'@'localhost'; 

--utworzenie konta użytkownika bibliotekarz_ksiazka (zapytanie 1) i nadanie mu prawa do wyświetlania, dodawania i aktualizowania danych z tabeli książki bazie biblioteka (zapytanie 2):

create user 'bibliotekarz_ksiazka'@'localhost' identified by 'qwerty';
grant select, insert, update on biblioteka.ksiazki to 'bibliotekarz_ksiazka'@'localhost';

--jeśli chcemy nadać uprawnienia do dwóch tabel w bazie, polecenie należy powtórzyć, np:

grant select, insert, delete on biblioteka.ksiazki to 'bibliotekarz'@'localhost';
grant select, insert, delete on biblioteka.autorzy to 'bibliotekarz'@'localhost';

--aktualizacja haseł użytkownika:

alter user 'bibliotekarz'@'localhost' identified by 'qwerty123';

alternatywnie:

UPDATE mysql.user SET authentication_string = PASSWORD('nowe_hasło') WHERE User = 'użytkownik' AND Host = 'localhost';
FLUSH PRIVILEGES;

--zdejmowanie uprawnień

revoke select, insert, delete on biblioteka.ksiazki from 'bibliotekarz'@'localhost';
flush privileges;

--ROLE

CREATE ROLE 'programista', 'tester', 'wydawca';

GRANT ALL privileges ON *.* TO 'programista';
GRANT SELECT ON baza.* TO 'tester';
GRANT INSERT, UPDATE, DELETE ON baza.* TO 'wydawca';

CREATE USER 'p1'@'localhost' IDENTIFIED BY 'qwerty';
CREATE USER 't1'@'localhost' IDENTIFIED BY 'qwerty';
CREATE USER 'w1'@'localhost' IDENTIFIED BY 'qwerty';

GRANT 'programista' to 'p1'@'localhost';
GRANT 'tester' to 't1'@'localhost';
GRANT 'wydawca' to 'w1'@'localhost';

SET DEFAULT ROLE 'programista' for 'p1'@'localhost';
SET DEFAULT ROLE 'tester' for 't1'@'localhost';
SET DEFAULT ROLE 'wydawca' for 'w1'@'localhost';

--usuwanie uprawanień ról

REVOKE INSERT, UPDATE, DELETE ON baza.* FROM 'tester';
flush privileges;

--usuwianie ról

DROP ROLE 'tester';

-------------------------------------------------------------
--CMD:
cd c:/xampp/mysql/bin
mysql -u root -p
create user 'superuser5i1'@'localhost' identified by 'qwerty';
grant all privileges on *.* to 'superuser5i1'@'localhost' with grant option;
flush privileges;
quit
mysql -u superuser5i1 -p    //(password: qwerty)
use zwierzaki   (wejście to bazy)

create user 'admin_zwierzaki'@'localhost' identified by '';
grant all privileges on zwierzaki.* to 'admin_zwierzaki'@'localhost';

create user 'admin_kotki'@'localhost' identified by '';
grant all privileges on zwierzaki.kotki to 'admin_kotki'@'localhost';

flush privileges;

create user 'maniek'@'localhost' identified by '';
grant select on zwierzaki.kotki to 'maniek'@'localhost';

grant select, insert, delete on zwierzaki.pieski to 'jozek'@'localhost';

grant create, update on zwierzaki.* to 'bronek'@'localhost';
grant select on zwierzaki.kotki to 'bronek'@'localhost';
grant select on zwierzaki.swinki to 'bronek'@'localhost';

flush privileges;

-------------------------------------------------------------

UNION, UNION ALL - suma, suma z duplikatami
INTERSECT - część wspólna
EXCEPT - różnica

CREATE VIEW dane_osobowe_5i1 AS
SELECT concat(klienci.ImieKlienta,' ',klienci.NazwiskoKlienta), klienci.AdresKlienta, klienci.MiastoKlienta, klienci.TelefonKlienta, 'klient' as 'kto' FROM klienci
UNION
SELECT concat(pracownicy.ImiePracownika,' ',pracownicy.NazwiskoPracownika), pracownicy.AdresPracownika, pracownicy.MiastoPracownika, pracownicy.TelefonPracownika, 'pracownik' FROM pracownicy
UNION
SELECT dostawcy.NazwaDostawcy, dostawcy.AdresDostawcy, dostawcy.MiastoDostawcy, dostawcy.TelefonDostawcy, 'dostawca' FROM dostawcy;


SELECT zamowienia.NumerZamowienia FROM zamowienia 
JOIN dane_zamowien ON dane_zamowien.NumerZamowienia = zamowienia.NumerZamowienia
JOIN produkty ON produkty.NumerProduktu = dane_zamowien.NumerProduktu
WHERE produkty.NazwaProduktu LIKE "%Opony%"
Intersect 
SELECT zamowienia.NumerZamowienia FROM zamowienia 
JOIN dane_zamowien ON dane_zamowien.NumerZamowienia = zamowienia.NumerZamowienia
JOIN produkty ON produkty.NumerProduktu = dane_zamowien.NumerProduktu
WHERE produkty.NazwaProduktu LIKE "%Licznik%";


SELECT zamowienia.NumerZamowienia, klienci.ImieKlienta, klienci.NazwiskoKlienta FROM zamowienia 
JOIN klienci on klienci.IDKlienta = zamowienia.IDKlienta
JOIN dane_zamowien ON dane_zamowien.NumerZamowienia = zamowienia.NumerZamowienia
JOIN produkty ON produkty.NumerProduktu = dane_zamowien.NumerProduktu
WHERE produkty.NazwaProduktu LIKE "%Licznik%"
EXCEPT 
SELECT zamowienia.NumerZamowienia, klienci.ImieKlienta, klienci.NazwiskoKlienta FROM zamowienia 
JOIN klienci on klienci.IDKlienta = zamowienia.IDKlienta
JOIN dane_zamowien ON dane_zamowien.NumerZamowienia = zamowienia.NumerZamowienia
JOIN produkty ON produkty.NumerProduktu = dane_zamowien.NumerProduktu
WHERE produkty.NumerProduktu LIKE "%Opony%";
