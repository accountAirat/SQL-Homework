USE lesson_4;
DROP SCHEMA lesson_4;

#1
CREATE TABLE users_old(
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);

DROP PROCEDURE IF EXISTS transfer;

DELIMITER //
CREATE PROCEDURE transfer ()
BEGIN
DECLARE rand_id INT;
SET rand_id = FLOOR(RAND()*(SELECT MAX(users.id) FROM users)); -- Случайное число от 0 до последнего id
START TRANSACTION;
INSERT INTO users_old (id, firstname, lastname, email)
SELECT * FROM users WHERE id = rand_id;

IF EXISTS(SELECT * FROM users_old WHERE id = rand_id)
THEN 
	DELETE FROM users WHERE id = rand_id;
    COMMIT;
    SELECT * FROM users_old;
ELSE
	SELECT "Что-то пошло не так!";
    ROLLBACK;
END IF;
END//
DELIMITER ;

CALL transfer();

#2
DROP FUNCTION IF EXISTS hello;

DELIMITER //
CREATE FUNCTION hello()
RETURNS VARCHAR(15) READS SQL DATA
BEGIN
RETURN CASE
	WHEN CURTIME() BETWEEN '06:00:00' AND '12:00:00' THEN "Доброе утро"
    WHEN CURTIME() BETWEEN '12:00:00' AND '18:00:00' THEN "Добрый день"
    WHEN CURTIME() BETWEEN '18:00:00' AND '24:00:00' THEN "Добрый вечер"
    WHEN CURTIME() BETWEEN '00:00:00' AND '06:00:00' THEN "Доброй ночи"
    ELSE "Привет"
END;

END//
DELIMITER ;

SELECT hello() AS "Приветствие";


