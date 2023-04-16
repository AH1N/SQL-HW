-- Создаём таблицу
CREATE TABLE `db`.`users` (
  `idUsers` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsers`));

-- Добавляем users
INSERT INTO `db`.`users` (`idUsers`, `name`, `age`, `email`, `login`, `password`) VALUES ('1', 'AAAA', '1', '1@1.1', '1a1a1a', '111');
INSERT INTO `db`.`users` (`idUsers`, `name`, `age`, `email`, `login`, `password`) VALUES ('2', 'BBBB', '2', '2@2.2', '2a2a2a', '222');
INSERT INTO `db`.`users` (`idUsers`, `name`, `age`, `email`, `login`, `password`) VALUES ('3', 'cccc', '3', '3@3.3', '3a3a3a', '333');

-- все данные из таблицы users
SELECT * FROM db.users;
-- из таблицы users все Логины
SELECT login FROM users ;
-- из таблицы users поля логин нужнве логины
SELECT login FROM users
where login like '%1%';
