<?php
$is_auth = rand(0, 1);
$con = mysqli_connect("localhost", "root", "root", "yeticave");
mysqli_set_charset($con, "utf8");
// $mas_category = ['Доски и лыжи', 'Крепления', 'Ботинки', 'Одежда', 'Инструменты', 'Разное'];
// $mmas_ad = [
//     [
//         'name' => '2014 Rossignol District Snowboard',
//         'category' => 'Доски и лыжи',
//         'price' => '10999',
//         'img_url' => 'img/lot-1.jpg',
//         'dtime' => '2022-07-20'
//     ],
//     [
//         'name' => 'DC Ply Mens 2016/2017 Snowboard',
//         'category' => 'Доски и лыжи',
//         'price' => '159999',
//         'img_url' => 'img/lot-2.jpg',
//         'dtime' => '2022-07-22'
//     ],
//     [
//         'name' => 'Крепления Union Contact Pro 2015 года размер L/XL',
//         'category' => 'Крепления',
//         'price' => '8000',
//         'img_url' => 'img/lot-3.jpg',
//         'dtime' => '2022-08-10'
//     ],
//     [
//         'name' => 'Ботинки для сноуборда DC Mutiny Charocal',
//         'category' => 'Ботинки',
//         'price' => '10999',
//         'img_url' => 'img/lot-4.jpg',
//         'dtime' => '2022-08-01'
//     ],
//     [
//         'name' => 'Куртка для сноуборда DC Mutiny Charocal',
//         'category' => 'Одежда',
//         'price' => '7500',
//         'img_url' => 'img/lot-5.jpg',
//         'dtime' => '2022-07-29'
//     ],
//     [
//         'name' => 'Маска Oakley Canopy',
//         'category' => 'Разное',
//         'price' => '5400',
//         'img_url' => 'img/lot-6.jpg',
//         'dtime' => '2022-09-22'
//     ]

// ];
$title = 'Главная';
$user_name = 'Natasha'; // укажите здесь ваше имя
?>