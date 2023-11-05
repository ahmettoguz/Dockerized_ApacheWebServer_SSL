<?php
require_once __DIR__ . "/assets/controller/sql_functions.php";
// header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");

echo "<h1>" . getenv("MY_NAME") . "</h1>";