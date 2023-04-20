USE hw2;
#1
CREATE TABLE sales (
	id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);
INSERT INTO hw2.sales (order_date, count_product)
VALUE ('2022-01-01 ',156),
	('2022-01-02 ',180),
	('2022-01-03',21),
	('2022-01-04',124),
	('2022-01-05',341);
SELECT * FROM sales;

#2
SELECT
	id AS "id заказа",
	CASE 
		WHEN count_product < 100 THEN "Маленький заказ"
		WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
		ELSE "Большой заказ"
	END AS "Тип заказа"
FROM sales;

#3
CREATE TABLE orders (
	id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id  VARCHAR(3) NOT NULL UNIQUE,
    amount  DOUBLE(6,2) NOT NULL,
    order_status VARCHAR(15)
);

INSERT INTO hw2.orders (employee_id, amount, order_status)
VALUE ('e03', 15.00, 'OPEN'),
	('e01', 25.50, 'OPEN'),
	('e05', 100.70, 'CLOSED'),
	('e02', 22.18, 'OPEN'),
	('e04', 9.50, 'CANCELLED');
SELECT * FROM orders;

SELECT
	id AS "Заказ",
	CASE order_status
		WHEN 'OPEN' THEN "«Order is in open state"
		WHEN 'CLOSED' THEN "«Order is closed"
		ELSE "«Order is cancelled»"
	END AS "full_order_status"
FROM orders;

#4
/* 
NULL ничего не содержит, просто пустота. Данных ни каких нет.
0 или, например, пустая строка "" - это значение, которое несёт в себе  данные. 
*/


        
