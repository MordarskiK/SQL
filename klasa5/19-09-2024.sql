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
