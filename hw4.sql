/*
создаём таблице из ссылки https://drive.google.com/file/d/1PQn576YVakvlWrIgIjSP9YEf5id4cqYs/view?usp=sharing
*/


INSERT INTO AUTO1 (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');


INSERT INTO AUTO1 (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');


INSERT INTO AUTO1 (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');


INSERT INTO AUTO1 (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');


INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');


INSERT INTO AUTO1 (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');


INSERT INTO AUTO1 (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);


INSERT INTO AUTO1 (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);


INSERT INTO AUTO1 (REGNUM, MARK, COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);


/*
1.Вывести на экран, сколько машин каждого цвета  для машин марок BMW и LADA
*/

SELECT MARK, COLOR, COUNT(*) AS count
FROM auto1
WHERE MARK IN ('BMW', 'LADA')
GROUP BY MARK, COLOR;

/*
2.Вывести на экран марку авто(количество) и количество авто не этой марки.
100 машин, их них 20 - BMW и 80 машин другой марки ,  AUDI - 30 и 70 машин другой марки, LADA - 15, 85 авто другой марки
*/

SELECT MARK, COUNT(*) as count,
(SELECT COUNT(*) FROM auto1 WHERE MARK <> a.MARK) as other_count -- тут я подглядел в интернете
FROM auto1 a -- тут я подглядел в интернете
GROUP BY MARK;

/*
Даны 2 таблицы, созданные следующим образом:
create table test_a (id INT, test varchar(10));
create table test_b (id INT);
*/

create table test_a (id INT, test varchar(10));
create table test_b (id INT);
/*
заполняем
*/
insert into test_a(id, test) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);
/*
запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
*/
select test_a.id from test_a
left join test_b on test_a.id = test_b.id
where test_b.id is null;