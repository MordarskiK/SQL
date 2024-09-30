1. Wyświetl datę wypożyczenia, imię i nazwisko klienta oraz markę i model samochodu. Dane posortów alfabetycznie wg nazwisk.

SELECT wypozyczenia.data_wyp, klienci.imie, klienci.nazwisko, samochody.marka, samochody.model FROM wypozyczenia
JOIN klienci ON klienci.id_klienta = wypozyczenia.id_klienta
JOIN samochody ON samochody.id_samochodu = wypozyczenia.id_samochodu
ORDER BY klienci.nazwisko;

2. Wyświetl imiona i nazwiska dwóch pierwszych pracowników z listy.

SELECT pracownicy.imie_p, pracownicy.nazwisko_p FROM pracownicy 
LIMIT 2;
  
3. Wyświetl imiona i nazwiska trzech pracowników z najniższą pensją.

SELECT pracownicy.imie_p, pracownicy.nazwisko_p FROM pracownicy
ORDER BY pracownicy.pensja ASC 
LIMIT 3;
  
4. Dla każdego klienta wyświetl imię i nazwisko oraz łączną ilość wypożyczeń.

SELECT klienci.id_klienta, klienci.imie, klienci.nazwisko, COUNT(wypozyczenia.id_wypozyczenia) as ilosc_wyporzyczen FROM klienci
JOIN wypozyczenia ON wypozyczenia.id_klienta = klienci.id_klienta
GROUP BY klienci.id_klienta;
  
5. Wyświetl imię i nazwisko pracownika z najwyższą pensją.

SELECT pracownicy.imie_p, pracownicy.nazwisko_p FROM pracownicy
ORDER BY pracownicy.pensja DESC
LIMIT 1;

SELECT pracownicy.imie_p, pracownicy.nazwisko_p FROM pracownicy
WHERE pracownicy.pensja = (
    SELECT MAX(pracownicy.pensja) FROM pracownicy
	);
  
6. Wyświetl katalog aut (marka,model,rok produkcji) posortowane malejąco wg liczny wypożyczeń.

SELECT samochody.marka, samochody.model, samochody.data_prod FROM samochody
JOIN wypozyczenia ON wypozyczenia.id_samochodu = samochody.id_samochodu
GROUP BY samochody.marka
ORDER BY COUNT(wypozyczenia.id_wypozyczenia) DESC;
  
7. Wyświetl imiona i nazwiska klientów, którzy nigdy nie wypożyczyli auta.

SELECT klienci.imie, klienci.nazwisko  FROM klienci
WHERE klienci.id_klienta NOT IN(
    SELECT wypozyczenia.id_klienta FROM wypozyczenia
    );

////////////////////////////////////////////////////////////////

1.	Wyświetl informacje o samochodach marki opel wraz z dodatkową kolumną zawierającą średnią cenę samochodów tej marki.
  
SELECT samochody.marka, samochody.model, samochody.data_prod, (SELECT round(AVG(samochody.cena_katalogowa),2) FROM samochody WHERE samochody.marka = "opel") FROM samochody
WHERE samochody.marka = "opel"

2.	Wyświetl informacje o najtańszych samochodach w bazie.

SELECT samochody.marka, samochody.model, samochody.data_prod FROM samochody
WHERE samochody.cena_katalogowa = (
    SELECT MIN(samochody.cena_katalogowa) FROM samochody
    );
  
3.	Wyświetl informacje o samochodach, które nie zostały nigdy wypożyczone.

SELECT samochody.marka, samochody.model, samochody.data_prod FROM samochody
WHERE samochody.id_samochodu NOT IN (
    SELECT dane_wypozyczen.id_samochodu FROM dane_wypozyczen
  );
  
4.	Policz ile razy dokonywano wypożyczenia na więcej niż jedno auto.

SELECT COUNT(*) FROM
(SELECT dane_wypozyczen.id_wypozyczenia FROM dane_wypozyczen
GROUP BY dane_wypozyczen.id_wypozyczenia
HAVING COUNT(dane_wypozyczen.id_wypozyczenia) > 1) t1
    
5.	Wyświetl informacje o klientach (imię i nazwisko), którzy dokonali największej liczby wypożyczeń.

SELECT klienci.id_klienta, klienci.imie_klienta, klienci.nazwisko_klienta FROM klienci
WHERE klienci.id_klienta in (SELECT MAX(COUNT(wypozyczenia.id_klienta)),klienci.id_klienta FROM wypozyczenia
                         JOIN klienci ON klienci.id_klienta = wypozyczenia.id_klienta)
    
6.	Wyświetl informacje o klientach (imię i nazwisko), którzy nigdy nie wypożyczali aut z klasy 'sedan'.
7.      Wyświetl wszystkie marki i modele samochodów (wraz z id i nr rejestracyjnym) z dopiskiem czy były wypożyczane w okresie od 21 do 31 grudnia 2022.
8.	Wyświetl informacje o samochodach, których cena wypożyczenia za dobę jest większa lub równa średniej cenie samochodu w danej klasie.
9.      Wyświetl informacje o samochodach, których cena wypożyczenia za dobę jest największa w danej klasie. 
10.	Wyświetl imiona i nazwiska klientów (imię i nazwisko), którzy wypożyczali auto Opel Astra, ale nigdy nie wypożyczali Forda Mondeo.




