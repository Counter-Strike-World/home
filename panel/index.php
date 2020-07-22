<?php session_start(); ?>
<!DOCTYPE html>
<html>
 <head>
   <title>Wrotagier.eu - Panel Użytkownika</title>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <link rel="stylesheet" href="../css/style.css">
   <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,700" rel="stylesheet">
   <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
 </head>
 <body>
<?php
error_reporting(E_ALL);

require 'core/minecraftRcon.php';
require 'core/login/login_form.php';
require '../core/core.php';

use Thedudeguy\Rcon;

    if(isset($_SESSION['logged']) && $_SESSION['logged'] == TRUE) {
      $rcon = new Rcon($mc_host, $mc_port, $mc_password, $mc_timeout);
      include('home.php');
    } else {
      return login_form();
    }
    ?>
 </body>
</html>
