<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Wrotagier.eu | Innowacyjność i profesjonalizm</title>
    <meta name="description" content="Wrotagier to projekt stwrzony od graczy dla graczy, którzy znajdą u Nas serwer gier dostosowany do Twoich potrzeb!" />
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,700" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <script src="js/scripts.js"></script>
  </head>
  <?php include_once("core/core.php"); ?>
  <body>
    <header>
      <div class="container">
        <a href="index.php"><img src="images/logo-wrotagier.png" alt="Wrotagier.eu" /></a>
      </div>
    </header>
    <nav id="nav">
      <div class="container">
        <ul class="nav-left">
          <li><a href="/panel" class="sign-in"><i class="fa fa-sign-in" aria-hidden="true"></i> Panel Gracza</a></li>
        </ul>
        <ul class="nav-right">
          <li><a href="#"><i class="fa fa-home" aria-hidden="true"></i> Strona Główna</a></li>
          <li><a href="#"><i class="fa fa-users" aria-hidden="true"></i> O nas</a></li>
          <li><a href="#"><i class="fa fa-ban" aria-hidden="true"></i> Lista banów</a></li>
          <li><a href="/panel/?shop"><i class="fa fa-shopping-basket" aria-hidden="true"></i> Sklep</a></li>
          <li><a href="https://forum.wrotagier.eu"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></i> Forum</a></li>
          <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i> Kontakt</a></li>
        </ul>
      </div>
    </nav>
    <main>
      <div class="container">
        <div class="ranking">
        <div class="leftHand">
          <h2 class="rankTitle">TOP 10 Graczy</h2>
            <table align="center" border="0" width="390" style="width:390px">
              <tr>
                <th>Miejsce</th>
                <th colspan="2">Gracz</th>
                <th>ELO</th>
              </tr>
              <?php
                $size = 24; //wielkość głowy minecraftowej na stronie
                $i = 1;
                foreach($users as $user) {
                  print "<tr>";
                    print "<td>" . $i++ . "</td>";
                    print "<td><img src='https://minotar.net/avatar/" . $user['name'] . "/" . $size . "'alt=".$user['name']."'/></td>";
                    print "<td>" . $user['name'] . "</td>";
                    print "<td>" . $user['points'] . "</td>";
                  print "</tr>";
                }
               ?>
           </table>
        </div>
        <div class="rightHand">
          <h2 class="rankTitle">TOP 10 Gildii</h2>
          <table align="center" border="0" width="390" style="width:390px">
            <tr>
              <th>Miejsce</th>
              <th>Nazwa</th>
              <th>Punkty</th>
            </tr>
            <?php
              $i = 1;
              foreach($guilds as $guild) {
                print "<tr>";
                  print "<td>" . $i++ . "</td>";
                  print "<td>" . $guild['name'] . "</td>";
                  print "<td>" . $guild['points'] . "</td>";
                print "</tr>";
              }
             ?>
         </table>
        </div>
      </div>
      <div class="navbar">
        <ul>
          <li class="status">
            <span class="title">Status serwera</span>
            <div>
              <?php
              if(isset($Error)) {
              	echo'Status: <font color="red">Offline</font><br>';
              	echo'Nie udało połączyć się z serwerem.';
              } else {
              	echo'Status: <font color="green">Online</font><br>';
              	echo'Graczy: '.$Info[ 'Players' ] . " / " . $Info['MaxPlayers'];
              	echo'<br>IP: '.MQ_SERVER_ADDR;
              	echo'<br>Wersja: '.$Info['Version'];
              	echo'<br>Port: '.$Info['HostPort'];
              }
              ?>
            </div>
          </li>
          <li class="vote">
            <span class="title">Zagłosuj na Nas!</span>
            <div>
              <span><a href="http://www.mclista.pl/41614">MCLista.pl</a></span>
              <span><a href="http://listaserwerowmc.pl/server.php?id=2944">ListaSerwerowMc.pl</a></span>
              <span><a href="https://mserwery.pl/server/138">Mserwery.pl</a></span>
              <span><a href="http://www.minecraft-list.pl/?page=list&id=6715">Minecraft-lista.pl</a></span>
            </div>
          </li>
        </ul>
      </div>
    </div>
    </main>
    <footer>
      <div class="container">
        <span class="copy">Copyright &copy; Wrotagier.eu <?php print date("Y"); ?></span>
      </div>
    </footer>
  </body>
</html>
