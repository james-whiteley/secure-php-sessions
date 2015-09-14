<?php
require_once(__DIR__ . '/../vendor/predis/predis/autoload.php');
require_once(__DIR__ . '/RedisSessionHandler.php');

$db = new Predis\Client();
$sessHandler = new RedisSessionHandler($db);
session_set_save_handler($sessHandler);
session_start();