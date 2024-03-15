Procedura wykonuje w bazie danych określone akcje. Funkcja wykonuje obliczenia i zwraca wartość do środowiska wołającego.
  https://www.tutorialspoint.com/difference-between-function-and-procedure

DELIMITER $$
CREATE PROCEDURE Panstwa()
BEGIN
	SELECT * FROM world.country;
END $$
DELIMITER ;

CALL world.Panstwa();

  
DELIMITER $$
CREATE PROCEDURE Kraj(IN kod varchar(3))
BEGIN
	SELECT CONCAT(Name,', ',Continent,', ',Region) FROM country WHERE CODE = kod;
END $$
DELIMITER ;

CALL world.Kraj("USA");

DROP PROCEDURE Kraj;

DELIMITER $$
CREATE PROCEDURE Kraj(IN kod varchar(3), OUT wyjscie TEXT)   ???????????????????????????????
BEGIN
	SELECT CONCAT(Name,', ',Continent,', ',Region) FROM country WHERE CODE = kod;   
END $$
DELIMITER ;

set @p0 = 'ABW';
set @p1 = '';
call world.Kraj(@p0,@p1);

-------------------------------------------------------------------------
DELIMITER $$
CREATE FUNCTION witaj() RETURNS text 
DETERMINISTIC
BEGIN
	RETURN 'witaj';
END $$
DELIMITER ;

SELECT witaj()
SELECT witaj() as Powitanie;


DELIMITER $$
CREATE FUNCTION witajUczniu(imie varchar(20)) RETURNS text 
DETERMINISTIC
BEGIN
	RETURN concat('Witaj ',imie,' co tam u ciebie?');
END $$
DELIMITER ;
	
SELECT witajUczniu('Jacek')


DELIMITER $$
CREATE FUNCTION brutto(CenaNetto double) RETURNS text 
DETERMINISTIC
BEGIN
	DECLARE podatek double;
    DECLARE cena_brutto decimal(5,2);
    SET podatek = 23;
    set cena_brutto = CenaNetto *((podatek/100)+1);
	RETURN concat('Cena netto: ',CenaNetto,'zł, podatek: ',podatek,'%, cena brutto: ',cena_brutto,'zł');
END $$
DELIMITER ;

SELECT brutto(250)

-------------------------------------------------------------------------
3 procedury i 3 funkcje z Sakili: 	
	
DELIMITER $$
CREATE PROCEDURE whereDoIlive(idInput varchar(3))
BEGIN
	SELECT a.address as address FROM address as a
	JOIN customer as c ON a.address_id=c.address_id
	WHERE c.customer_id = 1;
END $$
	DELIMITER ;

CALL whereDoILive(1)


DELIMITER $$
CREATE PROCEDURE whatFilmsForActor(firstNameInp varchar(255), lastNameInp varchar(255))
BEGIN
	SELECT a.first_name as name,a.last_name as surname,f.title FROM actor as a
    JOIN film_actor ON film_actor.actor_id=a.actor_id
    JOIN film as f ON f.film_id=film_actor.film_id
    WHERE a.first_name=firstNameInp && a.last_name=lastNameInp;
END $$
DELIMITER ;

call whatFilmsForActor('ed','chase')


DELIMITER $$
CREATE PROCEDURE whatCategoryForFilm(filmTitle varchar(255))
BEGIN
	SELECT c.name FROM category as c
    JOIN film_category ON film_category.category_id=c.category_id
    JOIN film as f ON f.film_id=film_category.film_id
    WHERE f.title=filmTitle;
END $$
DELIMITER ;

call whatCategoryForFilm('ACADEMY DINOSAUR');
