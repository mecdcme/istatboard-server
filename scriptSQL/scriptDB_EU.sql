-- ISTATBOARD-SERVER: If you have problems with istatboard-server connection to database
-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root'

create schema if not exists hack;
 
CREATE TABLE `hack`.`eu_cls_activities` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,
    `description` VARCHAR(500) NULL,
    PRIMARY KEY (`id`)
);

insert into `hack`.`eu_cls_activities`(description) value ('Personal care except eating');
insert into `hack`.`eu_cls_activities`(description) value ('Eating');
insert into `hack`.`eu_cls_activities`(description) value ('Work and study');
insert into `hack`.`eu_cls_activities`(description) value ('Household and family care and related travel');
insert into `hack`.`eu_cls_activities`(description) value ('Leisure, social and associative life except TV and video');
insert into `hack`.`eu_cls_activities`(description) value ('TV and video');
insert into `hack`.`eu_cls_activities`(description) value ('Travel to/from work/study');
insert into `hack`.`eu_cls_activities`(description) value ('Unspecified time use and travel');
insert into `hack`.`eu_cls_activities`(description) value ('Total');

CREATE TABLE `hack`.`eu_cls_sex` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,
    `description` VARCHAR(500) NULL,
    PRIMARY KEY (`id`)
);

insert into `hack`.`eu_cls_sex`(description) value ('Male');
insert into `hack`.`eu_cls_sex`(description) value ('Female');
insert into `hack`.`eu_cls_sex`(description) value ('Total');

CREATE TABLE `hack`.`eu_cls_countries` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,
    `description` VARCHAR(500) NULL,
    PRIMARY KEY (`id`)
);

insert into `hack`.`eu_cls_countries`(description) value ('Austria');
insert into `hack`.`eu_cls_countries`(description) value ('Belgium');
insert into `hack`.`eu_cls_countries`(description) value ('Bulgaria');
insert into `hack`.`eu_cls_countries`(description) value ('Croatia');
insert into `hack`.`eu_cls_countries`(description) value ('Cyprus');
insert into `hack`.`eu_cls_countries`(description) value ('Czech Republic');
insert into `hack`.`eu_cls_countries`(description) value ('Denmark');
insert into `hack`.`eu_cls_countries`(description) value ('Estonia');
insert into `hack`.`eu_cls_countries`(description) value ('Finland');
insert into `hack`.`eu_cls_countries`(description) value ('France');
insert into `hack`.`eu_cls_countries`(description) value ('Germany');
insert into `hack`.`eu_cls_countries`(description) value ('Greece');
insert into `hack`.`eu_cls_countries`(description) value ('Hungary');
insert into `hack`.`eu_cls_countries`(description) value ('Ireland');
insert into `hack`.`eu_cls_countries`(description) value ('Italy');
insert into `hack`.`eu_cls_countries`(description) value ('Latvia');
insert into `hack`.`eu_cls_countries`(description) value ('Lithuania');
insert into `hack`.`eu_cls_countries`(description) value ('Luxembourg');
insert into `hack`.`eu_cls_countries`(description) value ('Malta');
insert into `hack`.`eu_cls_countries`(description) value ('Netherlands');
insert into `hack`.`eu_cls_countries`(description) value ('Poland');
insert into `hack`.`eu_cls_countries`(description) value ('Portugal');
insert into `hack`.`eu_cls_countries`(description) value ('Romania');
insert into `hack`.`eu_cls_countries`(description) value ('Slovak Republic');
insert into `hack`.`eu_cls_countries`(description) value ('Slovenia');
insert into `hack`.`eu_cls_countries`(description) value ('Spain');
insert into `hack`.`eu_cls_countries`(description) value ('Sweden');
insert into `hack`.`eu_cls_countries`(description) value ('United Kingdom');

CREATE TABLE `hack`.`eu_cls_time` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NULL,
    `description` VARCHAR(500) NULL,
    PRIMARY KEY (`id`)
);

insert into `hack`.`eu_cls_time`(description) value ('From 04:00 to 04:09');
insert into `hack`.`eu_cls_time`(description) value ('From 04:10 to 04:19');
insert into `hack`.`eu_cls_time`(description) value ('From 04:20 to 04:29');
insert into `hack`.`eu_cls_time`(description) value ('From 04:30 to 04:39');
insert into `hack`.`eu_cls_time`(description) value ('From 04:40 to 04:49');
insert into `hack`.`eu_cls_time`(description) value ('From 04:50 to 04:59');
insert into `hack`.`eu_cls_time`(description) value ('From 05:00 to 05:09');
insert into `hack`.`eu_cls_time`(description) value ('From 05:10 to 05:19');
insert into `hack`.`eu_cls_time`(description) value ('From 05:20 to 05:29');
insert into `hack`.`eu_cls_time`(description) value ('From 05:30 to 05:39');
insert into `hack`.`eu_cls_time`(description) value ('From 05:40 to 05:49');
insert into `hack`.`eu_cls_time`(description) value ('From 05:50 to 05:59');
insert into `hack`.`eu_cls_time`(description) value ('From 06:00 to 06:09');
insert into `hack`.`eu_cls_time`(description) value ('From 06:10 to 06:19');
insert into `hack`.`eu_cls_time`(description) value ('From 06:20 to 06:29');
insert into `hack`.`eu_cls_time`(description) value ('From 06:30 to 06:39');
insert into `hack`.`eu_cls_time`(description) value ('From 06:40 to 06:49');
insert into `hack`.`eu_cls_time`(description) value ('From 06:50 to 06:59');
insert into `hack`.`eu_cls_time`(description) value ('From 07:00 to 07:09');
insert into `hack`.`eu_cls_time`(description) value ('From 07:10 to 07:19');
insert into `hack`.`eu_cls_time`(description) value ('From 07:20 to 07:29');
insert into `hack`.`eu_cls_time`(description) value ('From 07:30 to 07:39');
insert into `hack`.`eu_cls_time`(description) value ('From 07:40 to 07:49');
insert into `hack`.`eu_cls_time`(description) value ('From 07:50 to 07:59');
insert into `hack`.`eu_cls_time`(description) value ('From 08:00 to 08:09');
insert into `hack`.`eu_cls_time`(description) value ('From 08:10 to 08:19');
insert into `hack`.`eu_cls_time`(description) value ('From 08:20 to 08:29');
insert into `hack`.`eu_cls_time`(description) value ('From 08:30 to 08:39');
insert into `hack`.`eu_cls_time`(description) value ('From 08:40 to 08:49');
insert into `hack`.`eu_cls_time`(description) value ('From 08:50 to 08:59');
insert into `hack`.`eu_cls_time`(description) value ('From 09:00 to 09:09');
insert into `hack`.`eu_cls_time`(description) value ('From 09:10 to 09:19');
insert into `hack`.`eu_cls_time`(description) value ('From 09:20 to 09:29');
insert into `hack`.`eu_cls_time`(description) value ('From 09:30 to 09:39');
insert into `hack`.`eu_cls_time`(description) value ('From 09:40 to 09:49');
insert into `hack`.`eu_cls_time`(description) value ('From 09:50 to 09:59');
insert into `hack`.`eu_cls_time`(description) value ('From 10:00 to 10:09');
insert into `hack`.`eu_cls_time`(description) value ('From 10:10 to 10:19');
insert into `hack`.`eu_cls_time`(description) value ('From 10:20 to 10:29');
insert into `hack`.`eu_cls_time`(description) value ('From 10:30 to 10:39');
insert into `hack`.`eu_cls_time`(description) value ('From 10:40 to 10:49');
insert into `hack`.`eu_cls_time`(description) value ('From 10:50 to 10:59');
insert into `hack`.`eu_cls_time`(description) value ('From 11:00 to 11:09');
insert into `hack`.`eu_cls_time`(description) value ('From 11:10 to 11:19');
insert into `hack`.`eu_cls_time`(description) value ('From 11:20 to 11:29');
insert into `hack`.`eu_cls_time`(description) value ('From 11:30 to 11:39');
insert into `hack`.`eu_cls_time`(description) value ('From 11:40 to 11:49');
insert into `hack`.`eu_cls_time`(description) value ('From 11:50 to 11:59');
insert into `hack`.`eu_cls_time`(description) value ('From 12:00 to 12:09');
insert into `hack`.`eu_cls_time`(description) value ('From 12:10 to 12:19');
insert into `hack`.`eu_cls_time`(description) value ('From 12:20 to 12:29');
insert into `hack`.`eu_cls_time`(description) value ('From 12:30 to 12:39');
insert into `hack`.`eu_cls_time`(description) value ('From 12:40 to 12:49');
insert into `hack`.`eu_cls_time`(description) value ('From 12:50 to 12:59');
insert into `hack`.`eu_cls_time`(description) value ('From 13:00 to 13:09');
insert into `hack`.`eu_cls_time`(description) value ('From 13:10 to 13:19');
insert into `hack`.`eu_cls_time`(description) value ('From 13:20 to 13:29');
insert into `hack`.`eu_cls_time`(description) value ('From 13:30 to 13:39');
insert into `hack`.`eu_cls_time`(description) value ('From 13:40 to 13:49');
insert into `hack`.`eu_cls_time`(description) value ('From 13:50 to 13:59');
insert into `hack`.`eu_cls_time`(description) value ('From 14:00 to 14:09');
insert into `hack`.`eu_cls_time`(description) value ('From 14:10 to 14:19');
insert into `hack`.`eu_cls_time`(description) value ('From 14:20 to 14:29');
insert into `hack`.`eu_cls_time`(description) value ('From 14:30 to 14:39');
insert into `hack`.`eu_cls_time`(description) value ('From 14:40 to 14:49');
insert into `hack`.`eu_cls_time`(description) value ('From 14:50 to 14:59');
insert into `hack`.`eu_cls_time`(description) value ('From 15:00 to 15:09');
insert into `hack`.`eu_cls_time`(description) value ('From 15:10 to 15:19');
insert into `hack`.`eu_cls_time`(description) value ('From 15:20 to 15:29');
insert into `hack`.`eu_cls_time`(description) value ('From 15:30 to 15:39');
insert into `hack`.`eu_cls_time`(description) value ('From 15:40 to 15:49');
insert into `hack`.`eu_cls_time`(description) value ('From 15:50 to 15:59');
insert into `hack`.`eu_cls_time`(description) value ('From 16:00 to 16:09');
insert into `hack`.`eu_cls_time`(description) value ('From 16:10 to 16:19');
insert into `hack`.`eu_cls_time`(description) value ('From 16:20 to 16:29');
insert into `hack`.`eu_cls_time`(description) value ('From 16:30 to 16:39');
insert into `hack`.`eu_cls_time`(description) value ('From 16:40 to 16:49');
insert into `hack`.`eu_cls_time`(description) value ('From 16:50 to 16:59');
insert into `hack`.`eu_cls_time`(description) value ('From 17:00 to 17:09');
insert into `hack`.`eu_cls_time`(description) value ('From 17:10 to 17:19');
insert into `hack`.`eu_cls_time`(description) value ('From 17:20 to 17:29');
insert into `hack`.`eu_cls_time`(description) value ('From 17:30 to 17:39');
insert into `hack`.`eu_cls_time`(description) value ('From 17:40 to 17:49');
insert into `hack`.`eu_cls_time`(description) value ('From 17:50 to 17:59');
insert into `hack`.`eu_cls_time`(description) value ('From 18:00 to 18:09');
insert into `hack`.`eu_cls_time`(description) value ('From 18:10 to 18:19');
insert into `hack`.`eu_cls_time`(description) value ('From 18:20 to 18:29');
insert into `hack`.`eu_cls_time`(description) value ('From 18:30 to 18:39');
insert into `hack`.`eu_cls_time`(description) value ('From 18:40 to 18:49');
insert into `hack`.`eu_cls_time`(description) value ('From 18:50 to 18:59');
insert into `hack`.`eu_cls_time`(description) value ('From 19:00 to 19:09');
insert into `hack`.`eu_cls_time`(description) value ('From 19:10 to 19:19');
insert into `hack`.`eu_cls_time`(description) value ('From 19:20 to 19:29');
insert into `hack`.`eu_cls_time`(description) value ('From 19:30 to 19:39');
insert into `hack`.`eu_cls_time`(description) value ('From 19:40 to 19:49');
insert into `hack`.`eu_cls_time`(description) value ('From 19:50 to 19:59');
insert into `hack`.`eu_cls_time`(description) value ('From 20:00 to 20:09');
insert into `hack`.`eu_cls_time`(description) value ('From 20:10 to 20:19');
insert into `hack`.`eu_cls_time`(description) value ('From 20:20 to 20:29');
insert into `hack`.`eu_cls_time`(description) value ('Total (24 hours)');

CREATE TABLE `hack`.`mart_eu_main_activity_rate` (
  `activity` VARCHAR(100) NULL,
  `start_time` VARCHAR(100) NULL,
  `unit` VARCHAR(100) NULL,
  `sex` VARCHAR(15) NULL,
  `country` VARCHAR(45) NULL,
  `year` VARCHAR(45) NULL,
  `value` DECIMAL(5,2) NULL
  );

-- RUN FILE ACTIVITY_RATE_DUMP.SQL
create or replace view `hack`.`eu_activity_time` as
SELECT 
    start_time,
     avg(case  when activity = 'Personal care except eating' then  value end) as val_pers_care,
     avg(case  when  activity = 'Eating' then  value end)  as val_eating,
      avg(case  when  activity = 'Work and study' then  value  end) as val_work_study,
       avg(case  when  activity = 'Household and family care and related travel' then  value end)  as val_family_care,
        avg(case  when  activity = 'Leisure, social and associative life except TV and video' then  value end)  as val_leisure,
         avg(case  when  activity = 'TV and video' then  value end)  as val_tv,
          avg(case  when  activity = 'Travel to/from work/study' then  value  end) as val_travel,
           avg(case  when  activity = 'Unspecified time use and travel' then  value end)  as val_unspec   
      from hack.mart_eu_main_activity_rate 
      where sex = 'Males' and country = 'Romania'
 group by start_time;
 
create or replace view `hack`.`eu_activity_time_hour` as
SELECT 
    EXTRACT(hour FROM SUBSTRING(start_time, 5, 6))  as hour,
     avg(case  when activity = 'Personal care except eating' then  value end) as val_pers_care,
     avg(case  when  activity = 'Eating' then  value end)  as val_eating,
      avg(case  when  activity = 'Work and study' then  value  end) as val_work_study,
       avg(case  when  activity = 'Household and family care and related travel' then  value end)  as val_family_care,
        avg(case  when  activity = 'Leisure, social and associative life except TV and video' then  value end)  as val_leisure,
         avg(case  when  activity = 'TV and video' then  value end)  as val_tv,
          avg(case  when  activity = 'Travel to/from work/study' then  value  end) as val_travel,
           avg(case  when  activity = 'Unspecified time use and travel' then  value end)  as val_unspec   
      from hack.mart_eu_main_activity_rate
      where sex = 'Males' and country = 'Romania' 
      and start_time like 'From%'
 group by hour
 
delimiter //
CREATE procedure `hack`.`proc_eu_activity_time_hour`(IN in_country VARCHAR(100), IN in_sex VARCHAR(10))
BEGIN
  SELECT 
    EXTRACT(hour FROM SUBSTRING(start_time, 5, 6))  as hour,
     avg(case  when activity = 'Personal care except eating' then  value end) as val_pers_care,
     avg(case  when  activity = 'Eating' then  value end)  as val_eating,
      avg(case  when  activity = 'Work and study' then  value  end) as val_work_study,
       avg(case  when  activity = 'Household and family care and related travel' then  value end)  as val_family_care,
        avg(case  when  activity = 'Leisure, social and associative life except TV and video' then  value end)  as val_leisure,
         avg(case  when  activity = 'TV and video' then  value end)  as val_tv,
          avg(case  when  activity = 'Travel to/from work/study' then  value  end) as val_travel,
           avg(case  when  activity = 'Unspecified time use and travel' then  value end)  as val_unspec   
      from hack.mart_eu_main_activity_rate
      where sex = in_sex and country = in_country
      and start_time like 'From%'
 group by hour;
END//

-- call proc_eu_activity_time_hour('Romania', 'Males');

create or replace view `hack`.`eu_sex_time` as
SELECT 
	start_time,
    avg(case  when sex = 'Males' then  value end) as val_male,
    avg(case  when sex = 'Females' then  value end) as val_female    
from hack.mart_eu_main_activity_rate 
      where activity = 'Eating' and country = 'Romania'
group by start_time;

create or replace view `hack`.`eu_sex_time_hour` as
SELECT 
	EXTRACT(hour FROM SUBSTRING(start_time, 5, 6))  as hour,
    avg(case  when sex = 'Males' then  value end) as val_male,
    avg(case  when sex = 'Females' then  value end) as val_female    
from hack.mart_eu_main_activity_rate 
      where activity = 'Eating' and country = 'Romania'
      and start_time like 'From%'
group by hour;

DROP PROCEDURE IF EXISTS `hack`.`proc_eu_sex_time_hour`
delimiter //
CREATE procedure `hack`.`proc_eu_sex_time_hour`(IN in_country int(11), IN in_activity int(11))
BEGIN
  SELECT 
	EXTRACT(hour FROM SUBSTRING(start_time, 5, 6))  as hour,
    avg(case  when sex = 'Males' then  value end) as val_male,
    avg(case  when sex = 'Females' then  value end) as val_female    
from hack.mart_mart_eu_main_activity_rate  eu
join cls_eu_activities act on eu.activity =act.description
join cls_eu_countries cnt on eu.country =cnt.description
      where act.id = in_activity and cnt.id = in_country
      and start_time like 'From%'
group by hour;
END//

-- call proc_eu_sex_time_hour('Romania', 'Eating');
  call proc_eu_sex_time_hour(23, 1);
 
 CREATE TABLE `pivots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(45) DEFAULT NULL,
  `table` varchar(45) DEFAULT NULL,
  `config` varchar(2000) DEFAULT NULL,
  `source` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT='Pivots'
 