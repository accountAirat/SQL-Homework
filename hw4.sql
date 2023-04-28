USE hw4;

#1
SELECT u.id,
CONCAT(u.firstname, ' ', u.lastname) 'Пользователь',
p.birthday,
COUNT(l.user_id) 'Лайки'
FROM users u
RIGHT JOIN profiles p ON u.id = p.user_id AND DATE_ADD(p.birthday, INTERVAL 13 YEAR ) > CURRENT_DATE()
JOIN likes l ON l.user_id = u.id
GROUP BY l.user_id
ORDER BY p.birthday;

#2
SELECT p.gender 'Пол',
COUNT(p.gender) 'Лайки'
FROM profiles P
JOIN likes l
GROUP BY p.gender
ORDER BY Лайки DESC;

#3
SELECT CONCAT(u.firstname, ' ', u.lastname) AS 'Пользователь'
FROM  messages m 
RIGHT JOIN users u ON u.id=m.from_user_id
WHERE m.from_user_id IS NULL;

#4 Пользователь с id = 1
SELECT CONCAT(u.firstname, ' ', u.lastname) 'Пользователь',
COUNT(from_user_id) AS C
FROM messages m LEFT JOIN
users u ON m.from_user_id = u.id WHERE m.to_user_id = 1
GROUP BY from_user_id
ORDER BY C DESC LIMIT 1; 

