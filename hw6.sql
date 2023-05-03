
use db; 
delimiter //
create function hello(s int) returns varchar(100)
DETERMINISTIC 
begin
	declare d int;
    declare h int;
    declare m int;
    declare sec int;
    declare res varchar(100);
    
    set d = floor(s/86400);
    set s = mod(s, 86400); 
    set h = floor(s/3600);
    set s = mod(s, 3600);
    set m = floor(s / 60);
    set sec = mod(s, 60);
    
    set res = concat(d, ' days ', h, ' hours ', m, ' minutes ', sec, ' seconds');
    return res;
end //
delimiter ;


select hello(123456);

delimiter $$
create function chetnie() returns VARCHAR(100)
DETERMINISTIC
BEGIN
    declare result VARCHAR(100) default '';
    DECLARE i INT DEFAULT 1;
    WHILE (i <= 10) DO
        IF (i % 2 = 0) THEN
            SET result = CONCAT(result, i, ',');
        END IF;
        SET i = i + 1;
    END WHILE;
    SET result = TRIM(TRAILING ',' FROM result);
    RETURN result;
END$$
delimiter ;

SELECT chetnie();
