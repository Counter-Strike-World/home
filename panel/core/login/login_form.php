<?php
function login_form() {
  require 'AuthMeController.php';
  require 'Sha256.php';

  $controller = new Sha256();

?>
    <div class="login-form">
        <h2>Panel użytkownika</h2>
        <span class="desc">Aby zalogować się do panelu podaj <strong>nick</strong> oraz <strong>hasło</strong>, którymi logujesz się na Naszym serwerze!</span>
        <form method="post">
          <div class="form-content">
            <label>Nick z gry</label>
            <input type="text" name="username" class="form-input"/>
          </div>
          <div class="form-content">
            <label>Hasło z gry</label>
            <input type="password" name="password" class="form-input"/>
          </div>
          <input type="submit" name="submit" value="Zaloguj się" class="form-submit"/>
        </form>
      </div>
        <?php
      if(isset($_POST['submit'])) {
        $user = htmlspecialchars($_POST['username']);
        $pass = htmlspecialchars($_POST['password']);

        if ($controller->checkPassword($user, $pass)) {
            $_SESSION['logged'] = TRUE;
            $_SESSION['user'] = $user;
            echo '<span class="alert alert-success"><strong>Gotowe!</strong> Zostałeś zalogowany poprawnie!</span>';
            header('refresh: 2;');
          } else {
            echo '<span class="alert alert-danger"><strong>Błąd!</strong> Nazwa gracza lub hasło są nieprawidłowe.</span>';
          }
          return false;
      }
    }
 ?>
