<?php

$host = "localhost";
$user = "user";
$pass = "pass";
$db = "dbname";

  try {
      $db = new PDO("mysql:host=".$host.";dbname=".$db,$user,$pass);
      $db-> exec("SET CHARACTER SET utf8");
  } catch (PDOException $e) {
      print "Error!: " . $e->getMessage() . "<br/>";
      die();
  }
 ?>
