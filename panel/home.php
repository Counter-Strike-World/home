<?php
// Wczytaujemy sesję;
if($_SESSION['logged'] == TRUE) {
 ?>
<div id="nav_panel">
  <ul>
    <li><img src="https://minotar.net/avatar/<?php print $_SESSION['user'] ?>/24" /> <span class="username"><?php print $_SESSION['user']; ?></span></li>
    <li><a href="index.php"><i class="fa fa-home" aria-hidden="true"></i> Strona Główna</a></li>
    <li><a href="?shop"><i class="fa fa-shopping-cart" aria-hidden="true"></i> Sklep</a></li>
    <li><a href="#"><i class="fa fa-cogs" aria-hidden="true"></i> Twoje ustawienia</a></li>
    <li><a href="?logout"><i class="fa fa-sign-out" aria-hidden="true"></i> Wyloguj się</a></li>
  </ul>
</div>
<div id="content">
  <?php
  $page = $_GET['buy'];
  if($page == 'vip') {
    include("core/sms_vip.php");
  } else if($page == "supervip") {
    include("core/sms_svip.php");
  } else if($page == "monety") {
    include("core/sms_monety.php");
  } else if(isset($_GET['logout'])) {
    session_destroy();
    echo '<span class="alert alert-success"><strong>Gotowe!</strong> Zostałeś wylogowany poprawnie!</span>';
    header('refresh: 2;');
  } else if(isset($_GET['shop'])) {
?>
<ul>
  <li>
    <img src="https://cdn3.iconfinder.com/data/icons/minecraft-icons/512/Iron_Sword.png" width="100"/>
    <span class="title">Ranga VIP</span>
    <span class="time"><i class="fa fa-clock-o" aria-hidden="true"></i> 28 dni - 11.07zł</span>
    <span class="buy"><a href="index.php?buy=vip"><i class="fa fa-money" aria-hidden="true"></i> Kup teraz</a></span>
  </li>
  <li>
    <img src="https://cdn3.iconfinder.com/data/icons/minecraft-icons/512/Diamond_Sword.png" width="150" height="150" />
    <span class="title">Ranga SuperVIP</span>
    <span class="time"><i class="fa fa-clock-o" aria-hidden="true"></i> 28 dni - 24.60zł</span>
    <span class="buy"><a href="index.php?buy=supervip"><i class="fa fa-money" aria-hidden="true"></i> Kup teraz</a></span>
  </li>
  <li>
    <img src="https://media.forgecdn.net/avatars/107/96/636363839599071703.png" width="150" height="150" />
    <span class="title">Monety</span>
    <span class="time"><i class="fa fa-gamepad" aria-hidden="true"></i> 32 sztuki - 17.22zł</span>
    <span class="buy"><a href="index.php?buy=monety"><i class="fa fa-money" aria-hidden="true"></i> Kup teraz</a></span>
  </li>
</ul>
</div>
<?php } else {?>
  <div id="page">
    <h2>Witaj <strong><?=$name?></strong> w Panelu Użytkownika serwera WrotaGier.eu</h2>
    <p>Kilka informacji przed korzystaniem z panelu:</p>
    <ol>
      <li>-uważnie czytaj każdą rzecz, która robisz w panelu,</li>
      <li>- jeżeli nie jesteś czegoś pewien, skontaktuj się z administracją,</li>
      <li>- cały sklep działa automatycznie, więc czy jesteś na serwerze lub Cię nie ma ranga zostanie nadana,</li>
      <li>- panel jest ciągle rozbudowywany, a każda zmiana pojawi się tutaj,</li>
    </ol>
    <p>Jeżeli wszystko jest jasne to zapraszamy do korzystania z panelu, w razie wątpliwości pisz do nas <a href="mailto:kontakt@wrotagier.eu">kontakt@wrotagier.eu</a> lub na fanpage <a href="https://www.facebook.com/wrotagier/">Facebook - Wrotagier.eu</a>.
      <h3>@Changelog 26.08-2018</h3>
      <ol>
        <li>- serwer został przenisiony na nową, lepszą i wydajniejszą maszynę,</li>
        <li>- od teraz jest dostępna nowa zbroja, którą można wydropić z bossów,</li>
        <li>- pojawiły się 4 nowe bossy, z których można wydropić nową zbroję,</li>
        <li>- na tyle ile możliwe to było przywróciliśmy stare dobre PVP,</li>
        <li>- od teraz serwer jest dostępny tylko pod wersją <strong>1.12.2</strong>,</li>
        <li>- wprowadziliśmy <strong>CobbleX</strong>, od teraz za 9 stacków cobblestone, można otrzymać blok CobbleX, z którego wypada losowy przedmiot,</li>
        <li>- została zmieniona konfiguracja gildii, mianowicie:</li>
          <ol>
            <li>1. koszt powiekszenia terenu gildii został zmieniony na większy,</li>
            <li>2. po <strong>24h</strong> od założenia gidlii zostanie zdjęta ochrona gildii,</li>
            <li>3. aby zrestartować ranking gildii wymagane są <strong>64 diamenty</strong></li>
          </ol>
        <li></li>
      </ol>
  </div>
<?php } ?>

























<?php
} else {
  exit;
}

 ?>
