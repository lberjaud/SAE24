<?php
function decode_binary ($i){
	$i=bindec("$i");			/*Decode the binary payload and devide it by 100 (see gen_position.php)*/
	$i = $i / 100;
	return $i;
}

function get_distance ($d){
	include ("mysql.php");
	$requete = "SELECT distance FROM amplitude WHERE intensite = $d;";
	$resultat = mysqli_query($id_bd, $requete)
		or die("Execution de la requete impossible : $requete");			/*Get a distance with an intensity payload */
	$ligne = mysqli_fetch_array($resultat);
	extract($ligne);
	return $distance;
	mysqli_close($id_bd);
}

function get_coordonate ($d1, $d2, $d3){
	include ("mysql.php");
	$requete = "SELECT position.*, distance.C1, distance.C2, distance.C3 FROM position 
	LEFT JOIN distance ON distance.id_position = position.id
	WHERE distance.C1 = $d1 AND distance.C2 = $d2 AND distance.C3 = $d3;";					/*Get x and y coordonates with the three sensors distances*/
	$resultat = mysqli_query($id_bd, $requete)
		or die("Execution de la requete impossible : $requete");
	$ligne = mysqli_fetch_array($resultat);
	extract($ligne);
	return $ligne;
	mysqli_close($id_bd);
}

function insert_measure ($payload){
	include ("mysql.php");
	date_default_timezone_set('Europe/Paris');
	$x=$payload["x"];
	$y=$payload["y"];
	$requete = "SELECT position.id FROM position
				WHERE position.x = $x AND position.y = $y;";
	$resultat = mysqli_query($id_bd, $requete)
		or die("Execution de la requete impossible : $requete");	/*Send measurement on the 'mesure' table from a array payload including the x and y coordonates by parsing the matching id on the position table*/
	$ligne = mysqli_fetch_array($resultat);
	extract($ligne);			
	$date = date("Y-m-d");
	$time = date("H:i:s");
	$requete = "INSERT INTO mesure (date, heure, id_emplacement) VALUES ('$date', '$time', '$id');";
		mysqli_query($id_bd, $requete)
			or die("Execution de la requete impossible : $requete");
}

while (true) {												/*Run this loop until the script is stopped*/
	$str=shell_exec("mosquitto_sub -t iut/# -v -C 3");		/*Subscribe all the topics starting by 'iut' and output only three lines with the payload and topic*/
	$array = preg_split("/\r\n|\n|\r/", $str);				/*Create an array by separating the output by using line return of separators. */ 
	/*print_r($array);*/
	$space=' ';												/*Set separators variable*/
	$slash='/';
	$tp_cap=array();										/*Create two empty arrays.*/
	$distances=array();
	for ($i=0; $i < 3; $i++) { 								/*Run this loop for each generated array before*/
		array_push($tp_cap,explode($space, $array[$i]));	/*Add into the 'tp_cap' array an other array composed of the topic and payload rcovered from the MQTT broker.*/
		$tp_cap[$i][0]=explode($slash, $tp_cap[$i][0]);		/*Slice the array line that include the topic into an other array with three lines (iut, sae24, 'sensors name') using slash as separator */
		$tp_cap[$i][1]=decode_binary($tp_cap[$i][1]);		/*Transform the binary intensity into decimal numnber into the array*/ 
	}
	$distances=array("dc1"=>get_distance($tp_cap[0][1]), "dc2"=>get_distance($tp_cap[1][1]), "dc3"=>get_distance($tp_cap[2][1])); /*Create an associative array which include all the three sensors distances for the coordonates*/	
	$coord = get_coordonate($distances["dc1"], $distances["dc2"], $distances["dc3"]); /*Get the coordonates for theses distances*/
	insert_measure($coord); /*Insert these coordonates into the database*/
	printf("x : %s, y: %s\n", $coord["x"], $coord["y"]);
}

?>
