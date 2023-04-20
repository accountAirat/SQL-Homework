USE hw1;

SELECT * FROM new_table; #1
SELECT name, brand, price FROM new_table WHERE count>2; #2
SELECT * FROM new_table WHERE brand="Samsung"; #3

SELECT * 
FROM new_table
WHERE name LIKE 'iphone%'; #4.1

SELECT * 
FROM new_table
WHERE name LIKE 'samsung'; #4.2

SELECT * 
FROM new_table
WHERE name REGEXP '[0-9]'; #4.3

SELECT * 
FROM new_table
WHERE name LIKE '%8%'; #4.4

SELECT * 
FROM new_table
WHERE name REGEXP '8'; #4.4




