SELECT imie,
	CASE imie WHEN 'Ola' THEN 'to jest Ola' END,
   	CASE imie WHEN 'Iza' THEN 'to jest Iza' END
FROM kursantki;


SELECT imie,
	CASE imie WHEN 'Ola' THEN 'to jest Ola' END as Ola,
   	CASE imie WHEN 'Iza' THEN 'to jest Iza' END as Iza
FROM kursantki;


SELECT imie,
	CASE imie WHEN 'Ola' THEN 'to jest Ola' ELSE 'to nie Ola' END as Ola,
   	CASE imie WHEN 'Iza' THEN 'to jest Iza' ELSE 'to nie Iza' END as Iza
FROM kursantki;


SELECT imie,
    CASE imie WHEN 'Ola' THEN 'to jest Ola' ELSE 'to nie Ola' END as Ola,
    CASE imie WHEN 'Iza' THEN 'to jest Iza' ELSE 'to nie Iza' END as Iza,
    CASE imie WHEN 'Kasia' THEN 'to jest Kasia' ELSE 'to nie Kasia' END as Kasia,
    CASE imie WHEN 'Ania' THEN 'to jest Ania' ELSE 'to nie Ania' END as Ania,
    CASE imie WHEN 'Monika' THEN 'to jest Monica' ELSE 'to nie Monica' END as Monica,
    CASE imie WHEN 'Basia' THEN 'to jest Basia' ELSE 'to nie Basia' END as Basia
FROM kursantki;

---------------------------------------------------------------------------------------------
zad 27:
27.1 : to samo ale do sakili
  
SELECT first_name,
	CASE first_name WHEN 'NICK' THEN 'Nick is here' END
FROM actor

27.2 : 4 case
  
SELECT first_name,
    CASE first_name WHEN 'NICK' THEN 'Nick is here' END AS Nick,
    CASE first_name WHEN 'ED' THEN 'Ed Edd and Eddie' END AS Ed,
    CASE first_name WHEN 'GRACE' THEN 'Holy Grace' END AS Grace,
    CASE first_name WHEN 'JOE' THEN 'You like ice cream?' END AS Joe
FROM actor

27.3 : inny warunek niz wyświetlanie

SELECT 
    COUNT(CASE first_name WHEN 'NICK' THEN 1 END) AS Nick,
    COUNT(CASE first_name WHEN 'ED' THEN 1 END) AS Ed,
    COUNT(CASE first_name WHEN 'GRACE' THEN 1 END) AS Grace,
    COUNT(CASE first_name WHEN 'JOE' THEN 1 END) AS Joe
FROM actor
	
27.4 : inne niż case

SELECT first_name,
    IF(first_name LIKE 'NICK','Nick is here','') as Nick,
    IF(first_name LIKE 'ED','Ed Edd and Eddie','') as Ed,
    IF(first_name LIKE 'GRACE','Holy Grace','') as Grace,
    IF(first_name LIKE 'JOE','You like ice cream?','') as Joe
FROM actor

27.5 : make it pretty

DONE ALREADY!!!

