USE hw5;

#1 Создайте представление, в которое попадет информация о пользователях (имя, фамилия, город и пол), которые не старше 20 лет.
CREATE OR REPLACE VIEW  viewUser AS
SELECT CONCAT(firstname, " ", lastname) AS "Name",
hometown, gender
FROM  users u JOIN profiles p ON u.id=p.user_id
and DATE_ADD(p.birthday, INTERVAL 20 YEAR ) > CURRENT_DATE();

#2 Найдите кол-во, отправленных сообщений каждым пользователем и выведите ранжированный список пользователей,
-- указав имя и фамилию пользователя, количество отправленных сообщений и место в
-- рейтинге (первое место у пользователя с максимальным количеством сообщений) . (используйте DENSE_RANK)

SELECT DENSE_RANK() OVER (ORDER BY COUNT(u.id) DESC) AS Position,
CONCAT(firstname, " ", lastname) AS "Name",
COUNT(u.id) AS "Messages"
FROM users u RIGHT JOIN messages m ON u.id=m.from_user_id
GROUP BY u.id;

#3 Выберите все сообщения, отсортируйте сообщения по возрастанию даты отправления (created_at)
-- и найдите разницу дат отправления между соседними сообщениями, получившегося списка. (используйте LEAD или LAG)
Select *,
TIMESTAMPDIFF(MINUTE, LAG(created_at, 1, created_at) OVER w , created_at) "От предыдущего\n(Минут)",
TIMESTAMPDIFF(MINUTE, created_at, LEAD(created_at, 1, created_at) OVER w) "До следующего\n(Минут)"
FROM messages
WINDOW w AS (ORDER BY created_at)
ORDER BY created_at;




