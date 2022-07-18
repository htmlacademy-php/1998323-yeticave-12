<?php require_once ('helpers.php'); 
$param_layout = ['mas_category' => $mas_category, 'user_name' => $user_name, 'title' => $title];
$layout = include_template('layout.php', $param_layout);
print($layout);
?>