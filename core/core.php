<?php
require_once("db_connect.php");
require_once("mc-status.php");
$name = $_SESSION['user'];
$guilds = $db->query("SELECT * FROM guilds ORDER BY points DESC LIMIT 10");
$users = $db->query("SELECT * FROM users ORDER BY points DESC LIMIT 10");
$user_info = $db->query("SELECT * FROM users WHERE name = $name");
$users->execute();
$guilds->execute();
 ?>
