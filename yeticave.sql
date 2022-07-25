-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 25 2022 г., 10:52
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

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `category_id` varchar(100) NOT NULL COMMENT 'Идентификатор категории',
  `category_name` varchar(100) NOT NULL COMMENT 'Название категории'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='  Категории';

-- --------------------------------------------------------

--
-- Структура таблицы `lot`
--

CREATE TABLE `lot` (
  `lot_id` int(100) NOT NULL,
  `data_lot` datetime NOT NULL COMMENT 'дата создания: дата и время, когда этот лот был создан пользователем',
  `name_lot` varchar(100) NOT NULL COMMENT 'название: задается пользователем',
  `description_lot` varchar(5000) NOT NULL COMMENT 'описание: задается пользователем',
  `price` mediumint(9) NOT NULL,
  `end_time_lot` datetime NOT NULL,
  `category_id` varchar(100) NOT NULL,
  `step_lot` int(100) NOT NULL COMMENT 'шаг ставки',
  `user_id` int(255) NOT NULL,
  `winner_id` int(255) NOT NULL,
  `bet_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Лот';

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `user_id` int(255) NOT NULL COMMENT 'Идентификатор пользователя',
  `name` varchar(50) DEFAULT NULL COMMENT 'Имя пользователя',
  `password` varchar(20) NOT NULL COMMENT 'Пароль пользователя',
  `data_registration` datetime NOT NULL COMMENT 'Дата регистрации пользователя',
  `email` varchar(40) NOT NULL COMMENT 'email пользователя',
  `contacts` varchar(1000) DEFAULT NULL COMMENT 'Контакты пользователя',
  `lot_id` int(100) NOT NULL,
  `bet_id` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bet`
--
ALTER TABLE `bet`
  ADD PRIMARY KEY (`bet_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `lot_id` (`lot_id`);

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
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `bet_id` (`bet_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `bet_id` (`bet_id`),
  ADD KEY `lot_id` (`lot_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bet`
--
ALTER TABLE `bet`
  MODIFY `bet_id` int(100) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор ставки';

--
-- AUTO_INCREMENT для таблицы `lot`
--
ALTER TABLE `lot`
  MODIFY `lot_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор пользователя';

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `bet`
--
ALTER TABLE `bet`
  ADD CONSTRAINT `bet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `bet_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `lot` (`lot_id`);

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
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`bet_id`) REFERENCES `bet` (`bet_id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`lot_id`) REFERENCES `lot` (`lot_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
