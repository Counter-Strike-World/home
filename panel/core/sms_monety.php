<?php

	error_reporting(E_ALL);

	ini_set('error_reporting', E_ALL);
	ini_set("display_errors", 1);

	$settings = array(
		/*
			@nazwa:	userid
			@opis: numer identyfikacyjny partnera nadawany po zarejestrowaniu konta (dostępny po zalogowaniu).
		*/
		'userid' => 'xxx',
		/*
			@nazwa: serviceid
			@opis: numer identyfikacyjny kanału SKS dostępny w sekcji "Kanały SMS Premium"
		*/
		'serviceid' => 'xxxx',
		/*
			@nazwa: text
			@opis: treść wiadomości, która zostaje zainicjowana przez partnera w panelu. Pamiętaj, że błąd powoduje nierozliczenie płatności!
		*/
		'text' => 'XXX.XX',
		/*
			@nazwa: number
			@opis: numer z gamy zainicjowanych w panelu partnera
		*/
		'number' => '91400',
		/*
			@nazwa: cost
			@opis: koszt wiadomości netto jaki poniesie klient podczas zakupu produktu.
		*/
		'cost' => '14'
		);
	/*
		Weryfikujemy, czy formularz został wysłany
	*/
	if (isset($_POST['send']) && isset($_POST['code'])) {

		$code = addslashes($_POST['code']);

		/*
			Weryfikujemy poprawność kodu
		*/
		if (preg_match("/^[A-Za-z0-9]{8}$/", $code)) {
			/*
				Łączymy się z serwerem MicroSMS
			*/
			$api = @file_get_contents("http://microsms.pl/api/v2/index.php?userid=" . $settings['userid'] . "&number=" . $settings['number'] . "&code=" . $code . '&serviceid=' . $settings['serviceid']);

			/*
				Jeśli wystąpi problem z połączeniem, skrypt wyświetli błąd.
			*/
			if (!isset($api)) {
				$errormsg = 'Nie można nawiązać połączenia z serwerem płatności.';
			} else {
				/*
					Dekodujemy odpowiedź serwera do formatu json
				*/
				$api = json_decode($api);

				/*
					Sprawdzamy czy odpowiedź na pewno jest w formacie json
				*/
				if (!is_object($api)) {
					$errormsg = 'Nie można odczytać informacji o płatności.';
				}

				/*
					W przypadku błędów informujemy o tym klienta
				*/
				if (isset($api->error) && $api->error) {
					$errormsg = 'Kod błędu: ' . $api->error->errorCode . ' - ' . $api->error->message;
				} else if ($api->connect == FALSE) {
					$errormsg = 'Kod błędu: ' . $api->data->errorCode . ' - ' . $api->data->message;
				}
			}

			if (!isset($errormsg) && isset($api->connect) && $api->connect == TRUE) {
				/*
					Jeśli kod jest prawidłowy, wydajemy produkt
				*/
				if ($api->data->status == 1) {
					$nick = $_SESSION['user'];
					$przedmiot = "Monety"; // EDYTUJ NAZWĘ USŁUGI JAK DODAJESZ NOWĄ
					$data = date("d/m/Y H:i");

					$query = $db->prepare("INSERT INTO buy_list (id, nick, przedmiot, kod, data) VALUES (null,:nick,:przedmiot,:kod,:data)");
					$query->bindValue(":nick", $nick, PDO::PARAM_STR);
					$query->bindValue(":przedmiot", $przedmiot, PDO::PARAM_STR);
					$query->bindValue(":kod", $code, PDO::PARAM_STR);
					$query->bindValue(":data", $data, PDO::PARAM_STR);
					$query->execute();

					if ($rcon->connect()){
					  $rcon->sendCommand("give $nick 175 32 durability:1 name:&aMoneta");
					  $rcon->sendCommand("msg $nick 32 monety zostaly dodane do Twojego ekwipunku.");
					} else {
						echo "<div class='alert alert-danger'>Błąd połączenia z serwerem. Monety nie mogły zostać dodane. Skontaktuj się z administratorem!</div>";
					}
					$okmsg = "<div class='alert alert-success'>Twój kod jest prawidłowy. Monety zostały dodane do ekwipunku.</div>";
				} else {
					$errormsg = "<div class='alert alert-danger'>Przesłany kod jest nieprawidłowy, spróbuj ponownie.";
				}
			}
		} else {
			$errormsg = "<div class='alert alert-danger'>Przesłany kod jest nieprawidłowy, spróbuj ponownie.";
		}
	}

?>
<div id="page">
     <div class="center">
			 <h2>Kupujesz 32 szutki monet serwerowych.</h2>
			 <h3 style="color:red;">Pamiętaj, że kupując monety <u>MUSISZ</u> być na serwerze.</h3>
        W celu zakupu produktu proszę wysłać SMS na numer <strong><?php echo $settings['number']; ?></strong> o treści <strong><?php echo $settings['text']; ?></strong><br/>
        Koszt wysłania wiadomości <?php echo $settings['cost']; ?>zł netto (<?php echo number_format($settings['cost'] * ( 1 + 23 / 100 ), 2); ?> zł z vat).

	<?php if(isset($okmsg)) { ?><div class="msg ok"><?php echo $okmsg; ?></div><?php } ?>
	<?php if(isset($errormsg)) { ?><div class="msg error"><?php echo $errormsg; ?></div><?php } ?>

        <form method="post">
           <input type="hidden" name="send" value="" />
           <input type="text" name="code" placeholder="Kod sms" class="form-input" style="width:50%; margin: 0 auto;" />
           <button id="button" class="form-submit" type="submit" name="submit">Sprawdź kod</button>
        </form>
        Płatności zapewnia firma <a href="http://microsms.pl/">MicroSMS</a>. <br/>
        Korzystanie z serwisu jest jednozanczne z akceptacją <a href="http://microsms.pl/partner/documents/">regulaminów</a>.<br/>
        Jeśli nie dostałeś kodu zwrotnego w ciągu 30 minut skorzystaj z <a href="http://microsms.pl/customer/complaint/">formularza reklamacyjnego</a><br/><br/>
        <img src="http://microsms.pl/public/cms/img/banner.png" alt="MicroSMS.pl" class="img-responsive">
     </div>
</div>
