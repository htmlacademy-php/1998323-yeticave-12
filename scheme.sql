CREATE TABLE `yeticave`.`user` ( `
user_id` INT(255) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор пользователя' , `
name` VARCHAR(50) NULL COMMENT 'Имя пользователя' , 
`password` VARCHAR(20) NOT NULL COMMENT 'Пароль пользователя' ,
 `data_registration` DATETIME NOT NULL COMMENT 'Дата регистрации пользователя' , 
`email` VARCHAR(40) NOT NULL COMMENT 'email пользователя' , 
`contacts` VARCHAR(1000) NULL COMMENT 'Контакты пользователя' , 
 `lot_id` INT(100) NOT NULL,
 `bet_id` INT(100) NOT NULL,
PRIMARY KEY (`user_id`))
 ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci COMMENT = 'Пользователи';


CREATE TABLE `yeticave`.`category` ( 
`category_id` VARCHAR(100) NOT NULL COMMENT 'Идентификатор категории' , `
category_name` VARCHAR(100) NOT NULL COMMENT 'Название категории' , 
PRIMARY KEY (`category_id`(100))) 
ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci COMMENT = ' Категории';


CREATE TABLE `yeticave`.`bet` (
 `bet_id` INT(100) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор ставки' , 
`user_id` INT(255) NOT NULL,
`lot_id` INT(100) NOT NULL,
`date_bet` DATETIME NOT NULL COMMENT 'дата: дата и время размещения ставки' ,
 `summa_bet` INT(255) NOT NULL COMMENT 'сумма: цена, по которой пользователь готов приобрести лот' , 
PRIMARY KEY (`bet_id`)) 
ENGINE = InnoDB CHARSET=utf8 COLLATE utf8_general_ci COMMENT = 'Ставка';


CREATE TABLE `yeticave`.`lot`(
    `lot_id` INT(100) NOT NULL AUTO_INCREMENT,
    `data_lot` DATETIME NOT NULL COMMENT 'дата создания: дата и время, когда этот лот был создан пользователем',
    `name_lot` VARCHAR(100) NOT NULL COMMENT 'название: задается пользователем',
    `description_lot` VARCHAR(5000) NOT NULL COMMENT 'описание: задается пользователем',
    `price` MEDIUMINT NOT NULL,
    `end_time_lot` DATETIME NOT NULL,
    `category_id` VARCHAR(100) NOT NULL,
    `step_lot` INT(100) NOT NULL COMMENT 'шаг ставки',
    `user_id` INT(255) NOT NULL,
    `winner_id` INT(255) NOT NULL,
    `bet_id` INT(100) NOT NULL,
    PRIMARY KEY(`lot_id`)
) ENGINE = InnoDB CHARSET = utf8 COLLATE utf8_general_ci COMMENT = 'Лот';



