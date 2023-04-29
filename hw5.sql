/*
таблица с машинами
*/
DROP TABLE IF EXISTS cars1;
create table cars1 
(   id int PRIMARY KEY, 
	name VARCHAR(10), 
	cost int
);

-- заполняем
INSERT INTO db.cars1 (id, name, cost)
VALUES(1,'Audi', '52642');

INSERT INTO db.cars1 (id, name, cost)
VALUES(2,'Mercedes', '57127');

INSERT INTO db.cars1 (id, name, cost)
VALUES(3,'Skoda', '9000');

INSERT INTO db.cars1 (id, name, cost)
VALUES(4,'Volvo', '29000');

INSERT INTO db.cars1 (id, name, cost)
VALUES(5,'Bentley', '350000');

INSERT INTO db.cars1 (id, name, cost)
VALUES(6,'Citroen', '21000');

INSERT INTO db.cars1 (id, name, cost)
VALUES(7,'Hummer', '41400');

INSERT INTO db.cars1 (id, name, cost)
VALUES(8,'Volkswagen', '21600');

/*
1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов
*/
create view view_25000 as
select * from cars1
where cost < 25000;

/*
2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
*/
 alter view view_25000 as
 select * from cars1
 where cost < 30000;
/*
3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
*/
create view SK_AUD as
select * from cars1
where name in ("Skoda", "Audi");
/*
Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

Есть таблица анализов Analysis:
an_id — ID анализа;
an_name — название анализа;
an_cost — себестоимость анализа;
an_price — розничная цена анализа;
an_group — группа анализов.

Есть таблица групп анализов Groups:
gr_id — ID группы;
gr_name — название группы;
gr_temp — температурный режим хранения.

Есть таблица заказов Orders:
ord_id — ID заказа;
ord_datetime — дата и время заказа;
ord_an — ID анализа.
*/
-- создаём таблицы
DROP TABLE IF EXISTS Analysis;
create table Analysis 
(   an_id int PRIMARY KEY, 
	an_name VARCHAR(40),
	an_cost int,
    an_price int,
    an_group int
);
INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group)
VALUES(1,"a1", 10, 12, 1);
INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group)
VALUES(2,"a2", 15, 17, 2);
INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group)
VALUES(3,"a3", 20, 22, 3);
INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group)
VALUES(4,"a4", 25, 27, 4);
INSERT INTO Analysis (an_id, an_name, an_cost, an_price, an_group)
VALUES(5,"a5", 30, 32, 5);


DROP TABLE IF EXISTS Grups;
create table Grups 
(   gr_id int PRIMARY KEY, 
	gr_name VARCHAR(40),
	gr_temp int
);

INSERT INTO Grups (gr_id, gr_name, gr_temp)
VALUES(1,"aa1", 10);
INSERT INTO Grups (gr_id, gr_name, gr_temp)
VALUES(2,"aa1", 11);
INSERT INTO Grups (gr_id, gr_name, gr_temp)
VALUES(2,"b1", 12);
INSERT INTO Grups (gr_id, gr_name, gr_temp)
VALUES(4,"b1", 13);
INSERT INTO Grups (gr_id, gr_name, gr_temp)
VALUES(5,"c1", 14);
INSERT INTO Grups (gr_id, gr_name, gr_temp)
VALUES(6,"c1", 15);
INSERT INTO Grups (gr_id, gr_name, gr_temp)
VALUES(7,"d1", 16);
INSERT INTO Grups (gr_id, gr_name, gr_temp)
VALUES(8,"d1", 17);
INSERT INTO Grups (gr_id, gr_name, gr_temp)
VALUES(9,"e1", 18);
INSERT INTO Grups (gr_id, gr_name, gr_temp)
VALUES(10,"e1", 19);

DROP TABLE IF EXISTS Orders;
create table Orders 
(   ord_id int PRIMARY KEY, 
	ord_datetime date,
    ord_an int
);
INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES(1,"2020-01-07", 1);
INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES(2,"2020-02-07", 1);
INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES(3,"2020-02-06", 1);
INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES(4,"2020-03-03", 1);
INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES(5,"2020-04-04", 1);
INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES(6,"2020-05-05", 1);
INSERT INTO Orders (ord_id, ord_datetime, ord_an)
VALUES(7,"2020-06-06", 1);


SELECT Analysis.an_name, Analysis.an_price
FROM Analysis
JOIN Orders ON Analysis.an_id = Orders.ord_an
WHERE Orders.ord_datetime BETWEEN '2020-02-05' AND '2020-02-12';

/*
Добавьте новый столбец под названием «время до следующей станции». 
Чтобы получить это значение, мы вычитаем время станций для пар смежных станций. 
Мы можем вычислить это значение без использования оконной функции SQL, 
но это может быть очень сложно. Проще это сделать с помощью оконной функции LEAD . 
Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить результат. 
В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу после нее.
*/

DROP TABLE IF EXISTS trains;
create table trains 
(   train_id int,
	station VARCHAR(40),
	station_time time
);

INSERT INTO trains (train_id, station, station_time)
VALUES(110,"San Francisco","10:00:00");
INSERT INTO trains (train_id, station, station_time)
VALUES(110,"redwood","10:54:00");
INSERT INTO trains (train_id, station, station_time)
VALUES(120,"redwood","10:54:00");
INSERT INTO trains (train_id, station, station_time)
VALUES(120,"redwood","11:40:00");

SELECT train_id, station, station_time,
       TIMEDIFF(LEAD(station_time) OVER (ORDER BY station_time), station_time) AS time_to_next_station
FROM trains;

