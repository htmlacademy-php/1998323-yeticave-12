
<?php require_once ('helpers.php'); ?>
<?php require_once ('templates/data.php'); ?>

<? /**
 * Подключает шаблон, передает туда данные и возвращает итоговый HTML контент
 * @param string $name Путь к файлу шаблона относительно папки templates
 * @param array $data Ассоциативный массив с данными для шаблона
 * @return string Итоговый HTML
 */
use function helpers\include_template as include_template;

$param_layout = ['mas_category' => $mas_category, 'user_name' => $user_name, 'title' => $title];
$layout = include_template('layout.php', $param_layout);
print($layout);
?>