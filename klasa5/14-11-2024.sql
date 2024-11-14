1. Wyświetl liczbę obserwacji dla każdego gatunku.
  
SELECT SUM(obserwacje.liczebnosc), gatunki.nazwa_zwyczajowa FROM obserwacje
JOIN gatunki ON gatunki.ID_gatunku = obserwacje.ID_gatunku
GROUP BY gatunki.nazwa_zwyczajowa

2. Wyświetl średnią liczebność obserwacji dla każdego gatunku.

SELECT AVG(obserwacje.liczebnosc), gatunki.nazwa_zwyczajowa FROM obserwacje
JOIN gatunki ON gatunki.ID_gatunku = obserwacje.ID_gatunku
GROUP BY gatunki.nazwa_zwyczajowa

3. Wyświetl maksymalną liczebność dla każdego gatunku, ale tylko dla gatunków o liczebności większej niż 10.

SELECT MAX(obserwacje.liczebnosc), gatunki.nazwa_zwyczajowa FROM obserwacje
JOIN gatunki ON gatunki.ID_gatunku = obserwacje.ID_gatunku
WHERE obserwacje.liczebnosc > 10
GROUP BY gatunki.nazwa_zwyczajowa

4. Wyświetl całkowitą liczebność obserwacji dla każdego gatunku i posortuj wyniki malejąco.

SELECT SUM(obserwacje.liczebnosc), gatunki.nazwa_zwyczajowa FROM obserwacje
JOIN gatunki ON gatunki.ID_gatunku = obserwacje.ID_gatunku
GROUP BY gatunki.nazwa_zwyczajowa
ORDER BY SUM(obserwacje.liczebnosc) DESC
  
5. Wyświetl liczbę obserwacji w każdej lokalizacji.

SELECT SUM(obserwacje.liczebnosc), lokalizacje.lokalizacja FROM obserwacje
JOIN lokalizacje ON lokalizacje.ID_lokalizacji = obserwacje.ID_lokalizacji
GROUP BY lokalizacje.lokalizacja
  
6. Wyświetl średnią liczebność obserwacji dla każdej lokalizacji.

SELECT AVG(obserwacje.liczebnosc), lokalizacje.lokalizacja FROM obserwacje
JOIN lokalizacje ON lokalizacje.ID_lokalizacji = obserwacje.ID_lokalizacji
GROUP BY lokalizacje.lokalizacja
  
7. Wyświetl lokalizacje, które miały więcej niż 10 obserwacji.
  
SELECT COUNT(obserwacje.liczebnosc), lokalizacje.lokalizacja FROM obserwacje
JOIN lokalizacje ON lokalizacje.ID_lokalizacji = obserwacje.ID_lokalizacji 
GROUP BY lokalizacje.lokalizacja
HAVING COUNT(obserwacje.liczebnosc) > 10
  
8. Wyświetl średnią liczebność obserwacji dla każdego gatunku, posortowaną rosnąco.

SELECT AVG(obserwacje.liczebnosc), gatunki.nazwa_zwyczajowa FROM obserwacje
JOIN gatunki ON gatunki.ID_gatunku = obserwacje.ID_gatunku
GROUP BY gatunki.nazwa_zwyczajowa
ORDER BY AVG(obserwacje.liczebnosc) ASC
  
9. Wyświetl nazwę lokalizacji i łączną liczebność obserwacji, posortowane malejąco.

SELECT SUM(obserwacje.liczebnosc), lokalizacje.lokalizacja FROM obserwacje
JOIN lokalizacje ON lokalizacje.ID_lokalizacji = obserwacje.ID_lokalizacji
GROUP BY lokalizacje.lokalizacja
ORDER BY SUM(obserwacje.liczebnosc) DESC
  
10. Wyświetl nazwę gatunku i maksymalną liczebność obserwacji dla każdego gatunku.

SELECT MAX(obserwacje.liczebnosc), gatunki.nazwa_zwyczajowa FROM obserwacje
JOIN gatunki ON gatunki.ID_gatunku = obserwacje.ID_gatunku
GROUP BY gatunki.nazwa_zwyczajowa
  
11. Wyświetl gatunki, które miały średnią liczebność większą niż 20.

SELECT AVG(obserwacje.liczebnosc), gatunki.nazwa_zwyczajowa FROM obserwacje
JOIN gatunki ON gatunki.ID_gatunku = obserwacje.ID_gatunku
GROUP BY gatunki.nazwa_zwyczajowa
HAVING AVG(obserwacje.liczebnosc) > 20
  
12. Wyświetl nazwy lokalizacji i liczbę różnych gatunków obserwowanych w każdej lokalizacji.

SELECT lokalizacje.lokalizacja, COUNT(gatunki.ID_gatunku) FROM lokalizacje
JOIN obserwacje ON obserwacje.ID_lokalizacji = lokalizacje.ID_lokalizacji
JOIN gatunki ON gatunki.ID_gatunku = obserwacje.ID_gatunku
GROUP BY lokalizacje.lokalizacja
  
13. Wyświetl całkowitą liczebność dla każdego zachowania w obserwacjach.

SELECT SUM(obserwacje.liczebnosc), obserwacje.zachowanie FROM obserwacje
GROUP BY obserwacje.zachowanie
  
14. Wyświetl nazwę gatunku i całkowitą liczebność jego obserwacji dla gatunków, które mają więcej niż 50 obserwacji.

SELECT MAX(obserwacje.liczebnosc), gatunki.nazwa_zwyczajowa FROM obserwacje
JOIN gatunki ON gatunki.ID_gatunku = obserwacje.ID_gatunku
WHERE obserwacje.liczebnosc > 50
GROUP BY gatunki.nazwa_zwyczajowa
  
15. Wyświetl nazwę lokalizacji i średnią liczebność obserwacji dla lokalizacji, w których średnia liczebność jest większa niż 15. 

SELECT AVG(obserwacje.liczebnosc), lokalizacje.lokalizacja FROM obserwacje
JOIN lokalizacje ON lokalizacje.ID_lokalizacji = obserwacje.ID_lokalizacji
GROUP BY lokalizacje.lokalizacja
HAVING AVG(obserwacje.liczebnosc) > 15
  
16. Wyświetl lokalizacje, w których liczba obserwacji była większa niż 100.

SELECT obserwacje.liczebnosc, lokalizacje.lokalizacja FROM obserwacje
JOIN lokalizacje ON lokalizacje.ID_lokalizacji = obserwacje.ID_lokalizacji
WHERE obserwacje.liczebnosc > 100
GROUP BY lokalizacje.lokalizacja
  
17. Wyświetl nazwę gatunku, nazwę lokalizacji i całkowitą liczebność obserwacji dla każdego gatunku w każdej lokalizacji.

SELECT SUM(obserwacje.liczebnosc), gatunki.nazwa_zwyczajowa, lokalizacje.lokalizacja FROM obserwacje
JOIN gatunki ON gatunki.ID_gatunku = obserwacje.ID_gatunku
JOIN lokalizacje ON lokalizacje.ID_lokalizacji = obserwacje.ID_lokalizacji
GROUP BY gatunki.nazwa_zwyczajowa, lokalizacje.lokalizacja
  
18. Wyświetl maksymalną i minimalną liczebność obserwacji dla każdego gatunku.

SELECT MAX(obserwacje.liczebnosc), MIN(obserwacje.liczebnosc),gatunki.nazwa_zwyczajowa FROM obserwacje
JOIN gatunki ON gatunki.ID_gatunku = obserwacje.ID_gatunku
GROUP BY gatunki.nazwa_zwyczajowa
  
19. Wyświetl lokalizacje, w których suma liczebności obserwacji jest większa niż 500. (tbc)

SELECT SUM(obserwacje.liczebnosc), lokalizacje.lokalizacja FROM obserwacje
JOIN lokalizacje ON lokalizacje.ID_lokalizacji = obserwacje.ID_lokalizacji
GROUP BY lokalizacje.lokalizacja
HAVING SUM(obserwacje.liczebnosc) > 500

20. Wyświetl średnią liczebność dla każdego zachowania w obserwacjach.

SELECT AVG(obserwacje.liczebnosc), obserwacje.zachowanie FROM obserwacje
GROUP BY obserwacje.zachowanie
