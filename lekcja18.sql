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

