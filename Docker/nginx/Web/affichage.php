<!DOCTYPE html>
<html lang="fr">
<head>
		<meta charset="UTF-8" /> <!-- The charset attribute specifies the character encoding for the HTML document. -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0" /> <!-- The browser viewport is the area of the window in which web content can be viewed. -->
		<link rel="stylesheet" href="style/style.css" /> <!-- Allow to link the style page-->
        <link rel="shortcut icon" type="image/png" href="image/logosae.png"/> <!-- favicon= tab icon on browser-->
        <title>Affichage</title> <!--Tab title-->
	</head>

	<body>
	<nav> <!--Navigation bar-->
			<div class="profile">
			<img src="image/logosae.png" alt="logo SAE24" title="Logo SAE24" />
			<h1>Localiser une source sonore dans un environnement intérieur</h1>
			</div>
			<ul>
				<li><a style="text-decoration:none" href="index.html" class="button">Accueil</a></li>
				<li><a style="text-decoration:none" href="html/contexte.html" class="button">Contexte du projet</a></li>
				<li><a style="text-decoration:none" href="html/mentions.html" class="button">Mentions légales</a></li>
			</ul>
		</nav>

		<div>
		<?php

		$db_user = "sae24";
		$db_pass = "sae24pass";
		$db_name = "sae24";
		$db_host = "db";

		$db = mysqli_connect($db_host, $db_user, $db_pass, $db_name);


		//-----------------Génération du tableau vide-----------------//
		
		$hb = "+ - - - - - - - - - - - - - - - - +";
		$tab = array();
		$i = 0;
		$j = 0;

		$sql = "SELECT mesure.*, position.* FROM mesure LEFT JOIN position ON mesure.id_emplacement = position.id ORDER BY mesure.id DESC LIMIT 5";
		$query = mysqli_query($db, $sql);
		//$tab = $query
		$nb_lig = mysqli_num_rows($query);

		for($i = 0; $i < mysqli_num_rows($query); $i++){

			$row = mysqli_fetch_assoc($query);
			$x[$i] = $row["x"];
			$y[$i] = $row["y"];

		}

		//-----------------Génération du tableau vide-----------------//

		for($i = 1; $i < 17; $i++)
		{
			$tab[$i][0] = "| ";
			$tab[$i][17] = "|";

			for($j = 1; $j < 17; $j++)
			{
				$tab[$i][$j] = "• ";
			}
		}

		//-----------------Remplissage du tableau-----------------//
		
		if(isset($x)){
			for($j = 0; $j < count($x); $j++){
				$X = ($x[$j] * 2) + 0.5;
				$Y = ($y[$j] * 2) + 0.5;
				$tab[17 - $Y][$X] = count($x) - $j . " ";
			}
		}

		//-----------------Affichage du tableau-----------------//

			echo("<div class='contenu'><div class='tableau'>" . $hb . "<br />");

			for($i = 1; $i < 17; $i++)
			{
				for($j = 0; $j < 18; $j++)
				{
					if ($tab[$i][$j] == 5 ){
						$tab[$i][$j] = "<img class=point1 src=image/red1.png>";
					}
					elseif ($tab[$i][$j] == 4 ){
						$tab[$i][$j] = "<img class='point2' src=image/red1.png>";
					}
					elseif ($tab[$i][$j] == 3 ){
						$tab[$i][$j] = "<img class='point3' src=image/red1.png>";
					}
					elseif ($tab[$i][$j] == 2 ){
						$tab[$i][$j] = "<img class='point4' src=image/red1.png>";
					}
					elseif ($tab[$i][$j] == 1 ){
						$tab[$i][$j] = "<img class='point5' src=image/red1.png>";
					}
					echo($tab[$i][$j]);
				}
				echo("<br />");
			}

			echo($hb . "</div>");

		if(isset($x)){

			echo("<div class='grille'>Historique des valeurs<br />");
		    echo("<table><tr><th>TTL</th><th>Date</th><th>Hour</th><th>X</th><th>Y</th></tr>");
		    $tab = mysqli_query($db, $sql);
		    for ($i = 0; $i < count($x); $i++) {
		        $row = mysqli_fetch_assoc($tab);
		        $posx = $row["x"];
		        $posy = $row["y"];
		        $date = $row["date"];
		        $heure = $row["heure"];
		        $ttl = count($x) - $i; 
		        echo "<tr><td>$ttl</td><td>$date</td><td>$heure</td><td>$posx</td><td>$posy</td></tr>";
		    }
		    echo "</table></div>";

		}
		else
		{
			echo("Aucune mesure pour le moment.<br />");
		}

	    $sql = "SELECT nbr_capteur FROM mode";
	    $query = mysqli_query($db, $sql);
	    $row = mysqli_fetch_assoc($query);
	    $nbCap = $row["nbr_capteur"];

	    echo("<div class='panne'><strong>Simulation de panne : (Ne sélectionnez qu'une seule option à la fois)<br />" . $nbCap .  " capteurs actifs</strong><br />")

	?>

		<form action="post.php" method="POST">
			<input type="checkbox" name="1" value="1"> Un seul capteur fonctionnel<br />
			<input type="checkbox" name="2" value="2"> Deux capteurs fonctionnels<br />
			<input type="checkbox" name="3" value="3"> Troix capteurs fonctionnels<br />
			<input type="submit" name="submit" value="Appliquer">
			<br />
			<br />

			<?php

				$sql = "SELECT * FROM journaux ORDER BY id DESC";
				$query = mysqli_query($db, $sql);
				if(mysqli_num_rows($query) != 0){
					echo("<table><tr><th>Date</th><th>Heure</th><th>Message</th><th>Positions potentielles</th></tr>");
					for($i = 0; $i < mysqli_num_rows($query); $i++){

						$row = mysqli_fetch_assoc($query);
						$date = $row["date"];
						$heure = $row["heure"];
						$mess = $row["message"];
						$pos = $row["position"];
						echo("<tr><td>$date</td><td>$heure</td><td>$mess</td><td>$pos</td></tr>");
					}
					echo("</table>");
				}
				else
				{
					echo("Aucun message d'erreur à afficher<br />");
				}
				

			?>

			<button type="submit" name="viderJ" formaction="viderJ.php">Vider les journaux</button>
			<button type="submit" name="viderM" formaction="viderM.php">Vider les mesures</button>
			<button type="submit" name="reload" formaction="affichage.php">Actualiser les données</button>
			<br />
			<br />
			<br />
			<br />
		</form>

	</div>
	</div>

</body>
</html>