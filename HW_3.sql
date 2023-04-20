-- Таблица 1 продавцы
CREATE TABLE tbl_1_SALESPEOPLE (
	snum INT PRIMARY KEY,
	sname VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	comm INT NOT NULL
);

-- Наполнение данными 
INSERT INTO tbl_1_SALESPEOPLE (snum, sname, city, comm)
VALUES
(1001, 'Peel', 'London', 12),
(1002, 'Serres',  'San Jose', 13),
(1004, 'Motika', 'London', 11),
(1007, 'Rifkin', 'Barcelona', 15),
(1003, 'Alexrod', 'New York', 10);

-- Таблица 2 заказчики
CREATE TABLE tbl_2_customers (
	cnum INT PRIMARY KEY,
	cname VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	rating INT,
    snum int not null
);
-- Наполнение данными
INSERT INTO tbl_2_customers (cnum, cname, city, rating, snum)
VALUES
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni',  'Rome', 200, 1003),
(2003, 'Liu', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'San Jose', 300, 1007),
(2007, 'Pereira', 'Rome', 100, 1004);

-- Таблица 3 заказы
CREATE TABLE tbl_3_orders (
	onum INT PRIMARY KEY,
	amt float8,
	odate DATE,
	cnum INT not null,
    snum int not null
);
-- Наполнение данными
INSERT INTO tbl_3_orders (onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, '1990-03-10', 2008, 1007),
(3003, 767.19, '1990-03-10', 2001 , 1001),
(3002, 1900.10, '1990-03-10', 2007 , 1004),
(3005, 5160.45, '1990-03-10', 2003 , 1002),
(3006, 1098.16, '1990-03-10', 2008 , 1007),
(3009, 1713.23, '1990-04-10', 2002 , 1003),
(3007, 75.75, '1990-04-10', 2004 , 1002),
(3008, 4723.00, '1990-05-10', 2006 , 1001),
(3010, 1309.95, '1990-06-10', 2004 , 1002),
(3011, 9891.88, '1990-06-10', 2006 , 1001);

/*1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: 
city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
*/
-- к первой таблице
select city, sname, snum, comm from tbl_1_SALESPEOPLE;
-- ко второй таблице
select city, cname, cnum, rating from tbl_2_customers;

/*
2.	 Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
*/

select rating as "Рейтинг", cname as "Имя" 
from tbl_2_customers
where city = "San Jose"
group by rating, cname;

/*
3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов 
без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
*/
select distinct snum
from tbl_3_orders;

/*
4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
Используется оператор 
"LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
*/
select cname as "Имя" 
from tbl_2_customers
where cname like "G%";

/*
5. 	Напишите запрос, который может дать вам все заказы 
со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
*/

select * from tbl_3_orders
Where amt > 1000.00;

/*
6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
*/

select min(amt) from tbl_3_orders;

/*
7. 	Напишите запрос к таблице “Заказчики”, 
который может показать всех заказчиков,
 у которых рейтинг больше 100 и они находятся не в Риме.
*/

select * from tbl_2_customers
where city not like "Rome";


/*
1) Отсортируйте поле “зарплата” в порядке убывания и возрастания

2) Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)

3) Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
*/
-- 1
select * from staff order by salary Desc; 
-- 2
select * from staff order by salary Desc limit 5; 
-- 3
SELECT post, SUM(salary) as "суммарная ЗП"
FROM staff
GROUP BY post
HAVING total_salary > 100000;