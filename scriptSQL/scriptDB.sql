create schema `hack`;
use `hack`;
CREATE TABLE `hack`.`cls_activities` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,
    `description` VARCHAR(500) NULL,
    PRIMARY KEY (`id`)
);

insert into `hack`.`cls_activities`(description) value ('Slepping');
insert into `hack`.`cls_activities`(description) value ('Eating');
insert into `hack`.`cls_activities`(description) value ('Doing personal care');
insert into `hack`.`cls_activities`(description) value ('Working');
insert into `hack`.`cls_activities`(description) value ('Studying');
insert into `hack`.`cls_activities`(description) value ('Doing housework');
insert into `hack`.`cls_activities`(description) value ('Caring for children');

CREATE TABLE `hack`.`cls_places` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,
    `description` VARCHAR(500) NULL,
    PRIMARY KEY (`id`)
);

insert into `hack`.`cls_places`(description) value ('Home');
insert into `hack`.`cls_places`(description) value ('Workplace or school');
insert into `hack`.`cls_places`(description) value ('Other people\'s home');
insert into `hack`.`cls_places`(description) value ('Restaurant or canteen');
insert into `hack`.`cls_places`(description) value ('Cafe or pub');
insert into `hack`.`cls_places`(description) value ('Shopping centres, markets..');

CREATE TABLE `hack`.`cls_persons` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,
    `description` VARCHAR(500) NULL,
    PRIMARY KEY (`id`)
);
  
insert into `hack`.`cls_persons`(description) value ('Nobody');
insert into `hack`.`cls_persons`(description) value ('Partner');
insert into `hack`.`cls_persons`(description) value ('Other relative(s) who live with me');
insert into `hack`.`cls_persons`(description) value ('Other relative(s) who do not live with me');
insert into `hack`.`cls_persons`(description) value ('Friend(s)');
insert into `hack`.`cls_persons`(description) value ('Work colleague(s)');
insert into `hack`.`cls_persons`(description) value (' Other person(s) known to the respondent');

CREATE TABLE `hack`.`cls_moods` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,
    `description` VARCHAR(500) NULL,
    PRIMARY KEY (`id`)
);
   
insert into `hack`.`cls_moods`(description) value ('The best'); 
insert into `hack`.`cls_moods`(description) value ('Good'); 
insert into `hack`.`cls_moods`(description) value ('Normal'); 
insert into `hack`.`cls_moods`(description) value ('Poor'); 
insert into `hack`.`cls_moods`(description) value ('Very bad');

CREATE TABLE `hack`.`users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nickname` VARCHAR(100) NULL,
    `sex` VARCHAR(1) NULL,
    `age` INT(2),
    PRIMARY KEY (`id`)
);
  
insert into `hack`.`users`(nickname,sex,age) value ('Francesco18','M',18); 
insert into `hack`.`users`(nickname,sex,age) value ('Fabrizio40','M',40); 
insert into `hack`.`users`(nickname,sex,age) value ('Mauro40','M',40); 
insert into `hack`.`users`(nickname,sex,age) value ('Paolino30','M',30);
insert into `hack`.`users`(nickname,sex,age) value ('Pina20','F',20); 
insert into `hack`.`users`(nickname,sex,age) value ('Raffa22','F',22);
  
CREATE TABLE `ilogdiary` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `user` INT(11) DEFAULT NULL,
    `activity` INT(11) DEFAULT NULL,
    `mood` INT(11) DEFAULT NULL,
    `place` INT(11) DEFAULT NULL,
    `person` INT(11) DEFAULT NULL,
    `timepoint` DATETIME DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `fk_users_idx` (`user`),
    KEY `fk_activity_idx` (`activity`),
    KEY `fk_mood_idx` (`mood`),
    KEY `fk_place_idx` (`place`),
    KEY `fk_person_idx` (`person`),
    CONSTRAINT `fk_activity` FOREIGN KEY (`activity`)
        REFERENCES `cls_activities` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_mood` FOREIGN KEY (`mood`)
        REFERENCES `cls_moods` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_person` FOREIGN KEY (`person`)
        REFERENCES `cls_persons` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_place` FOREIGN KEY (`place`)
        REFERENCES `cls_places` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_users` FOREIGN KEY (`user`)
        REFERENCES `users` (`id`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);

DROP PROCEDURE if exists `hack`.`populate`;

delimiter //
CREATE procedure `hack`.populate()
BEGIN
  declare useri  INT default 0;
  declare hourj  INT default 0;
  declare dayk   INT default 0;
  declare act    INT default 0;
  declare mood   INT default 0;
  declare pers   INT default 0;
  declare place  INT default 0;
  declare timejk VARCHAR(255) default '';

  -- disable foreign keys
  SET FOREIGN_KEY_CHECKS=0;
  
  SET useri = 1;
  WHILE useri <= 6 DO
    SET dayk = 1;
  WHILE dayk <= 7 DO
   SET hourj = 0;
  WHILE hourj <= 23 DO
   SET timejk=CONCAT('2019-01-',dayk,' ',hourj,':08:00');
   SET act =   FLOOR(RAND()*(7)) + 1;
   SET mood =  FLOOR(RAND()*(5)) + 1;
   SET pers =  FLOOR(RAND()*(7)) + 1;
   SET place = FLOOR(RAND()*(5)) + 1;
    
    -- log
    -- select concat('act ', act);
    -- select concat('mood ', mood);
    -- select concat('pers ', pers);
    -- select concat('place ', place);
    
   insert into `hack`.`ilogdiary` (user,activity,mood,place,person,timepoint) value (useri,act,mood,place,pers,timejk); 

   SET hourj = hourj + 1;
  END WHILE;
   SET dayk = dayk + 1;
  END WHILE;
   SET useri =useri+1;
  END WHILE;
  
  -- enable foreign keys
  SET FOREIGN_KEY_CHECKS=1;
  
END//

call `hack`.populate();

CREATE or REPLACE VIEW `hack`.`view_user_week` AS
SELECT user, activity, mood, place, person, COUNT(*) AS hours
FROM hack.ilogdiary 
GROUP BY user, activity, mood, place, person;

CREATE or REPLACE VIEW `hack`.`view_user_week_join` AS
SELECT 
    users.nickname AS username,
    act.description AS activity,
    moods.description AS mood,
    places.description AS place,
    persons.description AS person,
    COUNT(*) AS hours
FROM
    hack.ilogdiary AS log
        INNER JOIN
    cls_activities AS act ON log.activity = act.id
        INNER JOIN
    cls_moods AS moods ON log.mood = moods.id
        INNER JOIN
    cls_persons AS persons ON log.person = persons.id
        INNER JOIN
    cls_places AS places ON log.place = places.id
        INNER JOIN
    users ON log.user = users.id
GROUP BY users.nickname, act.description, moods.description, places.description, persons.description;

 
  
  CREATE or REPLACE VIEW `hack`.`view_user_mood_time` AS
   
SELECT
 user,  JSON_ARRAYAGG(JSON_OBJECt('mood' ,mood,'timepoint', timepoint) )AS moods
FROM    hack.ilogdiary
 GROUP BY
  user;

  
  