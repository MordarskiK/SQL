zad. 6
tytul filmu, min, max, avg czas trwania wyporzyczenia i ilosc wyporzyczeń. wyniki z dokładnośćią do 1 po przecinku

SELECT filmy.tytul as tytul, 
  round(MIN(wypozyczenia.data_zwrotu-wypozyczenia.data_wypozyczenia),1) as min,
  round(MAX(wypozyczenia.data_zwrotu-wypozyczenia.data_wypozyczenia),1) as max,
  round(AVG(wypozyczenia.data_zwrotu-wypozyczenia.data_wypozyczenia),1) as sre,
  COUNT(*) as razy 
FROM filmy
JOIN kopie ON kopie.id_filmu = filmy.id_filmu
JOIN wypozyczenia ON wypozyczenia.id_kopii =kopie.id_kopii
GROUP BY filmy.tytul
ORDER BY COUNT(*) DESC;

zad. 7
imie i nazwisko klienta i ilość dokonanych wyporzyczeń

SELECT 
  klienci.imie,
  klienci.nazwisko,
  COUNT(wypozyczenia.data_wypozyczenia)
FROM klienci
JOIN wypozyczenia ON wypozyczenia.id_klienta=klienci.id_klienta
GROUP BY klienci.nazwisko;

zad. 8
aktorzy i liczba filmów w których grali. Pomiń tych którzy zagrali tylko w jednym filmie

SELECT 
 	aktorzy.nazwisko,
    COUNT(filmy.tytul)
FROM aktorzy
JOIN obsada on obsada.id_aktora=aktorzy.id_aktora
JOIN filmy ON filmy.id_filmu=obsada.id_filmu
GROUP BY aktorzy.id_aktora
HAVING COUNT(filmy.tytul)!=1;

zad. 9
nazwisko klienta i sumaryczna kwota za wyporzyczone filmy

SELECT 
	  klienci.nazwisko,
    SUM(filmy.cena)
FROM klienci
JOIN wypozyczenia ON wypozyczenia.id_klienta=klienci.id_klienta
JOIN kopie ON kopie.id_kopii=wypozyczenia.id_kopii
JOIN filmy on kopie.id_filmu=filmy.id_filmu
GROUP BY klienci.id_klienta;

-----------------------------------------------------------------------------

zad. 1
do tabeli filmy dodaj nową krotke id_filmu = 11 , tytul = 'Komornik', rok_produkcji = 2005, cena = 10.5

INSERT INTO filmy(filmy.id_filmu,filmy.tytul,filmy.rok_produkcji,filmy.cena) 
  VALUES(11,'Komornik',2005,10.5);

zad. 2
usuń filmy gdzie rok produkcji = 2005

DELETE from filmy WHERE filmy.rok_produkcji=2005;

zad. 3
podnieś cene filmów o 0.5 gdzie rok_produkcji < 1980
  
UPDATE filmy SET cena = cena+0.5 
  WHERE rok_produkcji<1980;

zad. 5
z tabeli filmy usuń krokti w których nie zagrał żaden aktor



