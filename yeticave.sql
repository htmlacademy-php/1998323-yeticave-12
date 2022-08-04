-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 02 2022 г., 12:29
-- Версия сервера: 5.7.38
-- Версия PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `yeticave`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bet`
--

CREATE TABLE `bet` (
  `bet_id` int(100) NOT NULL COMMENT 'Идентификатор ставки',
  `date_bet` datetime NOT NULL COMMENT 'дата: дата и время размещения ставки',
  `summa_bet` int(255) NOT NULL COMMENT 'сумма: цена, по которой пользователь готов приобрести лот',
  `user_id` int(255) NOT NULL,
  `lot_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ставка';

--
-- Дамп данных таблицы `bet`
--

INSERT INTO `bet` (`bet_id`, `date_bet`, `summa_bet`, `user_id`, `lot_id`) VALUES
(1, '2022-07-26 11:12:55', 12000, 4, 16),
(2, '2022-07-26 11:12:55', 170000, 4, 17),
(3, '2022-07-26 11:12:55', 13000, 3, 16),
(4, '2022-07-26 11:12:55', 6000, 1, 21),
(5, '2022-07-26 11:12:55', 8000, 4, 20),
(6, '2022-07-26 11:12:55', 12000, 4, 16),
(7, '2022-07-26 11:12:55', 170000, 4, 17),
(8, '2022-07-26 11:12:55', 13000, 3, 16),
(9, '2022-07-26 11:12:55', 6000, 1, 21),
(10, '2022-07-26 11:12:55', 8000, 4, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `category_id` varchar(100) NOT NULL COMMENT 'Идентификатор категории',
  `category_name` varchar(100) NOT NULL COMMENT 'Название категории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='  Категории';

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
('attachment', 'Крепления'),
('boards', 'Доски и лыжи'),
('boots', 'Ботинки '),
('clothing', 'Одежда '),
('other', 'Разное '),
('tools', 'Инструменты ');

-- --------------------------------------------------------

--
-- Структура таблицы `lot`
--

CREATE TABLE `lot` (
  `lot_id` int(100) NOT NULL,
  `data_lot` datetime NOT NULL COMMENT 'дата создания: дата и время, когда этот лот был создан пользователем',
  `name_lot` varchar(100) NOT NULL COMMENT 'название: задается пользователем',
  `description_lot` text NOT NULL COMMENT 'описание: задается пользователем',
  `price` mediumint(9) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `end_time_lot` datetime NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `step_lot` int(100) NOT NULL COMMENT 'шаг ставки',
  `user_id` int(255) NOT NULL,
  `winner_id` int(255) DEFAULT NULL,
  `bet_id` int(100) DEFAULT NULL,
  `price_now` int(255) DEFAULT NULL,
  `open_lot` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Лот';

--
-- Дамп данных таблицы `lot`
--

INSERT INTO `lot` (`lot_id`, `data_lot`, `name_lot`, `description_lot`, `price`, `img_url`, `end_time_lot`, `category_id`, `step_lot`, `user_id`, `winner_id`, `bet_id`, `price_now`, `open_lot`) VALUES
(16, '2022-07-26 10:59:55', '2014 Rossignol District Snowboard', '2014 Rossignol District Snowboard', 10999, 'img/lot-1.jpg', '2022-07-29 10:59:55', 'boards', 100, 1, NULL, NULL, NULL, 1),
(17, '2022-07-30 10:59:55', 'DC Ply Mens 2016/2017 Snowboard', 'DC Ply Mens 2016/2017 Snowboard', 159999, 'img/lot-2.jpg', '2022-07-28 10:59:55', 'boards', 1000, 1, NULL, NULL, NULL, 1),
(18, '2022-07-26 10:59:55', 'Крепления', 'Крепления Union Contact Pro 2015 года размер L/XL', 8000, 'img/lot-3.jpg', '2022-07-27 10:59:55', 'attachment', 200, 2, NULL, NULL, NULL, 1),
(19, '2022-07-26 10:59:55', 'Ботинки для сноуборда DC Mutiny Charocal', 'Ботинки для сноуборда DC Mutiny Charocal', 10999, 'img/lot-4.jpg', '2022-07-29 10:59:55', 'boots', 1000, 3, NULL, NULL, NULL, 1),
(20, '2022-07-26 10:59:55', 'Куртка для сноуборда DC Mutiny Charocal', 'Куртка для сноуборда DC Mutiny Charocal', 7500, 'img/lot-5.jpg', '2022-07-30 10:59:55', 'clothing', 500, 3, NULL, NULL, NULL, 1),
(21, '2022-07-26 10:59:55', 'Маска Oakley Canopy', 'Маска Oakley Canopy', 5400, 'img/lot-6.jpg', '2022-08-26 10:59:55', 'other', 150, 4, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `user_id` int(255) NOT NULL COMMENT 'Идентификатор пользователя',
  `name` varchar(255) DEFAULT NULL COMMENT 'Имя пользователя',
  `password` varchar(20) NOT NULL COMMENT 'Пароль пользователя',
  `data_registration` datetime NOT NULL COMMENT 'Дата регистрации пользователя',
  `email` varchar(255) NOT NULL COMMENT 'email пользователя',
  `contacts` varchar(255) DEFAULT NULL COMMENT 'Контакты пользователя',
  `lot_id` int(100) DEFAULT NULL,
  `bet_id` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`user_id`, `name`, `password`, `data_registration`, `email`, `contacts`, `lot_id`, `bet_id`) VALUES
(1, 'user1', 'Password1', '2022-07-25 20:56:36', 'user1@user.ru', 'Отсюда', NULL, NULL),
(2, 'user2', 'Password2', '2022-07-25 20:56:36', 'user2@user.ru', 'Оттуда', NULL, NULL),
(3, 'user3', 'Password3', '2022-07-25 20:56:36', 'user3@user.com', 'innet', NULL, NULL),
(4, 'user4', 'Password4', '2022-07-25 20:56:36', 'user4@user.com', 'Internet', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bet`
--
ALTER TABLE `bet`
  ADD PRIMARY KEY (`bet_id`),
  ADD KEY `bet_ibfk_1` (`user_id`),
  ADD KEY `bet_ibfk_2` (`lot_id`);

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Индексы таблицы `lot`
--
ALTER TABLE `lot`
  ADD PRIMARY KEY (`lot_id`),
  ADD KEY `lot_ibfk_1` (`category_id`),
  ADD KEY `lot_ibfk_2` (`user_id`),
  ADD KEY `lot_ibfk_3` (`bet_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_ibfk_1` (`bet_id`),
  ADD KEY `user_ibfk_2` (`lot_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bet`
--
ALTER TABLE `bet`
  MODIFY `bet_id` int(100) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор ставки', AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `lot`
--
ALTER TABLE `lot`
  MODIFY `lot_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор пользователя', AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bet`
--
ALTER TABLE `bet`
  ADD CONSTRAINT `bet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bet_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `lot` (`lot_id`) ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `lot`
--
ALTER TABLE `lot`
  ADD CONSTRAINT `lot_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `lot_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `lot_ibfk_3` FOREIGN KEY (`bet_id`) REFERENCES `bet` (`bet_id`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`bet_id`) REFERENCES `bet` (`bet_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `lot` (`lot_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
