<?php
function get_distance ($x, $y){
	include ("mysql.php");
	$requete = "SELECT distance.C1, distance.C2, distance.C3
			FROM position 
			LEFT JOIN distance ON distance.id_position = position.id
			WHERE position.x = $x AND position.y = $y;";
	$resultat = mysqli_query($id_bd, $requete)
		or die("Execution de la requete impossible : $requete");
	$ligne = mysqli_fetch_array($resultat);
	return $ligne;
	mysqli_close($id_bd);
}

function get_intensity ($d){
	include ("mysql.php");
	$requete = "SELECT intensite FROM amplitude WHERE distance = $d;";
	$resultat = mysqli_query($id_bd, $requete)
		or die("Execution de la requete impossible : $requete");
	$ligne=mysqli_fetch_assoc($resultat);
	extract($ligne);
	return $intensite;
	mysqli_close($id_bd);
}

function convert_binary ($i){
	$i = $i * 100;
	return decbin("$i");
}

function send_to_mqtt ($payload, $capteur){
	$broker = "127.0.0.1";
	$topic = "iut/sae24/$capteur";
	shell_exec("mosquitto_pub -h $broker -t $topic -m $payload");
}


$x = 0.25;
$y = 0.25;
while (($x < 7.75) && ($y < 7.75)){
	$random = shell_exec("shuf -i 0-1 -n 1");
	if ($random == 0) {
		$x = $x + 0.5;
	} else {
		$y = $y + 0.5;
	}
	echo "$x, $y \n";
    $dis=get_distance($x, $y);
    for ($i = 0; $i <= 2; $i++){
    	$intens=get_intensity($dis[$i]);
    	$bin=convert_binary($intens);
    	if ($i == 0) {
    		$cap = "C1";
    	}
    	elseif ($i == 1) {
    		$cap = "C2";
    	}
    	else {
    		$cap = "C3";
    	}
    	send_to_mqtt($bin, $cap);
    }
    sleep(5);
}



/*$final=get_intensity(9.99);
echo "$final\n";*/

/*$final2=get_distance(2.25, 5.25);
echo $final2[2];*/

/*$bin=convert_binary(400.24);
echo "$bin\n";
echo bindec($bin)/100;*/
/*$cap="C1";
send_to_mqtt(23, $cap);*/
?>