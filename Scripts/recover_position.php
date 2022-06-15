<?php
function decode_binary ($i){
	$i=bindec("$i");
	$i = $i / 100;
	return $i;
}

function get_distance ($d){
	include ("mysql.php");
	$requete = "SELECT distance FROM amplitude WHERE intensite = $d;";
	$resultat = mysqli_query($id_bd, $requete)
		or die("Execution de la requete impossible : $requete");
	$ligne = mysqli_fetch_array($resultat);
	extract($ligne);
	return $distance;
	mysqli_close($id_bd);
}

function get_coordonate ($d1, $d2, $d3){
	include ("mysql.php");
	$requete = "SELECT position.*, distance.C1, distance.C2, distance.C3 FROM position 
	LEFT JOIN distance ON distance.id_position = position.id
	WHERE distance.C1 = $d1 AND distance.C2 = $d2 AND distance.C3 = $d3;";
	$resultat = mysqli_query($id_bd, $requete)
		or die("Execution de la requete impossible : $requete");
	$ligne = mysqli_fetch_array($resultat);
	extract($ligne);
	return $ligne;
	mysqli_close($id_bd);
}

function insert_measure ($payload){
	include ("mysql.php");
	$x=$payload["x"];
	$y=$payload["y"];
	$requete = "SELECT position.id FROM position
				WHERE position.x = $x AND position.y = $y;";
	$resultat = mysqli_query($id_bd, $requete)
		or die("Execution de la requete impossible : $requete");
	$ligne = mysqli_fetch_array($resultat);
	extract($ligne);			
	$date = date("Y-m-d");
	$time = date("H:i:s");
	$requete = "INSERT INTO mesure (date, heure, id_emplacement) VALUES ('$date', '$time', '$id');";
		mysqli_query($id_bd, $requete)
			or die("Execution de la requete impossible : $requete");
}

while (true) {
	$str=shell_exec("mosquitto_sub -t iut/# -v -C 3");
	$array = preg_split("/\r\n|\n|\r/", $str);
	/*print_r($array);*/
	$space=' ';
	$slash='/';
	$tp_cap=array();
	$distances=array();
	for ($i=0; $i < 3; $i++) { 
		array_push($tp_cap,explode($space, $array[$i]));
		$tp_cap[$i][0]=explode($slash, $tp_cap[$i][0]);
		$tp_cap[$i][1]=decode_binary($tp_cap[$i][1]);
	}
	$distances=array("dc1"=>get_distance($tp_cap[0][1]), "dc2"=>get_distance($tp_cap[1][1]), "dc3"=>get_distance($tp_cap[2][1]));
	$coord = get_coordonate($distances["dc1"], $distances["dc2"], $distances["dc3"]);
	insert_measure($coord);
	printf("x : %s, y: %s\n", $coord["x"], $coord["y"]);
}

?>