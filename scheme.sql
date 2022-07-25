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
  `description_lot` text NOT NULL COMMENT 'описание: задается пользователем',
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
  `name` varchar(255) DEFAULT NULL COMMENT 'Имя пользователя',
  `password` varchar(20) NOT NULL COMMENT 'Пароль пользователя',
  `data_registration` datetime NOT NULL COMMENT 'Дата регистрации пользователя',
  `email` varchar(255) NOT NULL COMMENT 'email пользователя',
  `contacts` varchar(255) DEFAULT NULL COMMENT 'Контакты пользователя',
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
