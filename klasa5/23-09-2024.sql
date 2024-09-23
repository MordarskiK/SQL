1. Ile produktów jest w każdej z kategorii
  SELECT kategorie.OpisKategorii, COUNT(produkty.NumerProduktu) FROM kategorie 
  JOIN produkty ON produkty.IDKategorii = kategorie.IDKategorii
  GROUP BY kategorie.OpisKategorii

2. Ile produktów dostarcza każdy z dostawców
  SELECT dostawcy.NazwaDostawcy, COUNT(dostawcy_produktow.NumerProduktu) FROM dostawcy
  JOIN dostawcy_produktow ON dostawcy.IDDostawcy = dostawcy_produktow.IDDostawcy
  GROUP BY dostawcy.NazwaDostawcy
  
3. Ile razy dokonał zamówienia każdy klient
  SELECT klienci.ImieKlienta, COUNT(zamowienia.IDKlienta) FROM klienci
  JOIN zamowienia ON klienci.IDKlienta = zamowienia.IDKlienta
  GROUP BY klienci.ImieKlienta
  
4. Ile razy dokonał zamówienia każdy klient, uwzględniając tylko tych, którzy zamówienie realizowali mniej niż 30 razy
  SELECT klienci.ImieKlienta, COUNT(zamowienia.IDKlienta) FROM klienci
  JOIN zamowienia ON klienci.IDKlienta = zamowienia.IDKlienta
  GROUP BY klienci.ImieKlienta
  HAVING COUNT(zamowienia.IDKlienta) < 30
  
5. Ile razy dokonał zamówienia każdy klient w grudniu 2012
  SELECT klienci.ImieKlienta, COUNT(zamowienia.IDKlienta) FROM klienci
  JOIN zamowienia ON klienci.IDKlienta = zamowienia.IDKlienta
  WHERE zamowienia.DataZamowienia LIKE '2012-12-%'
  GROUP BY klienci.ImieKlienta
  
6. Kwota (suma) zamówień poszeczególnych klientów
  SELECT klienci.ImieKlienta, SUM(dane_zamowien.CenaZakupu*dane_zamowien.ZamowionaIlosc) FROM klienci
  JOIN zamowienia ON zamowienia.IDKlienta = klienci.IDKlienta
  JOIN dane_zamowien ON dane_zamowien.NumerZamowienia = zamowienia.NumerZamowienia
  GROUP BY klienci.ImieKlienta
  
7. Kwota (suma) zamówień poszczególnych klientów z września 2012, posortowana wg wartości
  SELECT klienci.ImieKlienta, SUM(dane_zamowien.CenaZakupu*dane_zamowien.ZamowionaIlosc) FROM klienci
  JOIN zamowienia ON zamowienia.IDKlienta = klienci.IDKlienta
  JOIN dane_zamowien ON dane_zamowien.NumerZamowienia = zamowienia.NumerZamowienia
  WHERE Year(zamowienia.DataZamowienia) = 2012 and month(zamowienia.DataZamowienia) = 09
  GROUP BY klienci.ImieKlienta
  ORDER BY SUM(dane_zamowien.CenaZakupu*dane_zamowien.ZamowionaIlosc) DESC
  
8. Kwota (suma) zamówień poszczególnych klientów, uwzględniając tylko sumę powyżej 200k
  SELECT klienci.ImieKlienta, SUM(dane_zamowien.CenaZakupu*dane_zamowien.ZamowionaIlosc) FROM klienci
  JOIN zamowienia ON zamowienia.IDKlienta = klienci.IDKlienta
  JOIN dane_zamowien ON dane_zamowien.NumerZamowienia = zamowienia.NumerZamowienia
  GROUP BY klienci.ImieKlienta
  HAVING SUM(dane_zamowien.CenaZakupu*dane_zamowien.ZamowionaIlosc)>200000
  
9. Suma sprzedaży wg produktów
  SELECT produkty.NazwaProduktu, COUNT(zamowienia.NumerZamowienia) FROM produkty
  JOIN dane_zamowien ON dane_zamowien.NumerProduktu = produkty.NumerProduktu
  JOIN zamowienia ON zamowienia.NumerZamowienia = dane_zamowien.NumerZamowienia
  GROUP BY produkty.NazwaProduktu
  
10. Średnia wartość zamówień we wrześniu 2012
  SELECT
      AVG(t.suma)
  FROM
      (
      SELECT
          SUM(
              dane_zamowien.CenaZakupu * dane_zamowien.ZamowionaIlosc
          ) AS suma,
          dane_zamowien.NumerZamowienia
      FROM
          dane_zamowien
      JOIN zamowienia ON zamowienia.NumerZamowienia = dane_zamowien.NumerZamowienia
      WHERE
          YEAR(zamowienia.DataZamowienia) = 2012 AND MONTH(zamowienia.DataZamowienia) = 09
      GROUP BY
          dane_zamowien.NumerZamowienia
  ) AS t;
