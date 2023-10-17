<?php

$host = getenv("PMA_HOST");
$databaseName = getenv("MYSQL_DATABASE");
$user = "root";
$pass = getenv("MYSQL_ROOT_PASSWORD");

// create data source name and connect to database
$dsn = "mysql:host=$host;dbname=$databaseName;charset=utf8mb4";

try {
    $db = new PDO($dsn, $user, $pass);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (Exception $ex) {
    die("Database Connection Error !!!\n". $ex);
}
