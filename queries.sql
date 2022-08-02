INSERT INTO `category` (`category_id`, `category_name`) VALUES ('boards', 'Доски и лыжи'), ('attachment', 'Крепления'), ('boots', 'Ботинки '), ('clothing', 'Одежда '), ('tools', 'Инструменты '), ('other', 'Разное ');
INSERT INTO `user` (`user_id`, `name`, `password`, `data_registration`, `email`, `contacts`, `lot_id`, `bet_id`) VALUES (NULL, 'user1', 'Password1', '2022-07-26 11:08:46.000000', 'user1@user.ru', 'cont', NULL, NULL),(NULL, 'user2', 'Password2', '2022-07-26 11:08:46.000000', 'user2@user.ru', 'cont', NULL, NULL), (NULL, 'user3', 'Password3', '2022-07-26 11:08:46.000000', 'user3@user.ru', 'cont', NULL, NULL), (NULL, 'user4', 'Password4', '2022-07-26 11:08:46.000000', 'user4@user.ru', 'cont', NULL, NULL)
INSERT INTO `lot` (`lot_id`, `data_lot`, `name_lot`, `description_lot`, `price`, `img_url`, `end_time_lot`, `category_id`, `step_lot`, `user_id`, `winner_id`, `bet_id`) VALUES (NULL, '2022-07-26 10:59:55.000000', '2014 Rossignol District Snowboard', '2014 Rossignol District Snowboard', '10999', 'img/lot-1.jpg', '2022-07-29 10:59:55.000000', 'boards', '100', '1', NULL, NULL), (NULL, '2022-07-30 10:59:55.000000', 'DC Ply Mens 2016/2017 Snowboard', 'DC Ply Mens 2016/2017 Snowboard', '159999', 'img/lot-2.jpg', '2022-07-28 10:59:55.000000', 'boards', '1000', '1', NULL, NULL), (NULL, '2022-07-26 10:59:55.000000', 'Крепления Union Contact Pro 2015 года размер L/XL', 'Крепления Union Contact Pro 2015 года размер L/XL', '8000', 'img/lot-3.jpg', '2022-07-27 10:59:55.000000', 'attachment', '200', '2', NULL, NULL), (NULL, '2022-07-26 10:59:55.000000', 'Ботинки для сноуборда DC Mutiny Charocal', 'Ботинки для сноуборда DC Mutiny Charocal', '10999', 'img/lot-4.jpg', '2022-07-29 10:59:55.000000', 'boots', '1000', '3', NULL, NULL), (NULL, '2022-07-26 10:59:55.000000', 'Куртка для сноуборда DC Mutiny Charocal', 'Куртка для сноуборда DC Mutiny Charocal', '7500', 'img/lot-5.jpg', '2022-07-30 10:59:55.000000', 'clothing', '500', '3', NULL, NULL), (NULL, '2022-07-26 10:59:55.000000', 'Маска Oakley Canopy', 'Маска Oakley Canopy', '5400', 'img/lot-6.jpg', '2022-08-26 10:59:55.000000', 'other', '150', '4', NULL, NULL)
INSERT INTO `bet` (`bet_id`, `date_bet`, `summa_bet`, `user_id`, `lot_id`) VALUES (NULL, '2022-07-26 11:12:55.000000', '12000', '4', '16'), (NULL, '2022-07-26 11:12:55.000000', '170000', '4', '17'), (NULL, '2022-07-26 11:12:55.000000', '13000', '3', '16'), (NULL, '2022-07-26 11:12:55.000000', '6000', '1', '21'), (NULL, '2022-07-26 11:12:55.000000', '8000', '4', '20')

-- получить все категории;
select category_name from category;

-- получить самые новые, открытые лоты. Каждый лот должен включать название, стартовую цену, ссылку на изображение, цену, название категории;
select name_lot, price, img_url, price_now, category_id from lot where open_lot='1' sort by date_lot desc;

-- показать лот по его ID. Получите также название категории, к которой принадлежит лот;
SELECT lot_id, category_name FROM `lot` LEFT JOIN category ON lot.category_id = category.category_id  

-- обновить название лота по его идентификатору;
UPDATE lot SET name_lot = 'Крепления' WHERE lot_id=18

-- получить список ставок для лота по его идентификатору с сортировкой по дате.
SELECT bet.lot_id, date_bet FROM bet  LEFT JOIN lot ON bet.lot_id = lot.lot_id WHERE  bet.lot_id=16 ORDER BY bet.date_bet