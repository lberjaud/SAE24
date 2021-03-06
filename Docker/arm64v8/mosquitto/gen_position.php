<?php
function get_distance ($x, $y){
	include ("mysql.php");
	$requete = "SELECT distance.C1, distance.C2, distance.C3
			FROM position 
			LEFT JOIN distance ON distance.id_position = position.id 				/*Return an array with the three sensors distance with an x and y coordonate*/
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
		or die("Execution de la requete impossible : $requete");					/*Return signal intensity of the input distance*/
	$ligne=mysqli_fetch_assoc($resultat);
	extract($ligne);
	return $intensite;
	mysqli_close($id_bd);
}

function convert_binary ($i){
	$i = $i * 100;																	/*Multiply by 100 (to avoid floating number) and convert into binary the signal intensity */
	return decbin("$i");
}

function send_to_mqtt ($payload, $capteur){
	$broker = "127.0.0.1";
	$topic = "iut/sae24/$capteur";													/*Publish a payload to the mqtt broker on a topic including the sensor name*/
	shell_exec("mosquitto_pub -h $broker -t $topic -m $payload");
}


function get_sensor_mode () {
		include ("mysql.php");
		$requete = "SELECT mode.nbr_capteur FROM mode;";
		$resultat = mysqli_query($id_bd, $requete)
			or die("Execution de la requete impossible : $requete");	
		$ligne=mysqli_fetch_assoc($resultat);
		extract($ligne);
		mysqli_close($id_bd);
		if($nbr_capteur == 1){
	    		$random = shell_exec("shuf -i 0-2 -n 1");
	    		echo "Switching to one sensor mode\n";
	    		echo "-------------------------------\n";	
				if ($random == 0) {
					$t1 = 0;
	    			$t2 = 0;							
				} elseif ($random == 1) {
					$t1 = 1;
	    			$t2 = 1;
				} else {
					$t1 = 2;
	    			$t2 = 2;	
				}
			}
			elseif($nbr_capteur == 2){
				$random = shell_exec("shuf -i 0-2 -n 1");
				echo "Switching to two sensors mode\n";
				echo "-------------------------------\n";	
				if ($random == 0) {
					$t1 = 0;
	    			$t2 = 1;							
				} elseif ($random == 1) {
					$t1 = 0;
	    			$t2 = 2;
				} else {
					$t1 = 1;
	    			$t2 = 2;	
				}
			}
			elseif($nbr_capteur == 3){
				echo "Switching to three sensors mode\n";
				echo "-------------------------------\n";
				$t1 = 0;
				$t2 = 2;
			}
		$result=array("t1"=>$t1, "t2"=>$t2);
		return $result;
}

while (true){
	$x = 0.25;	/*Initial coordonate */
	$y = 0.25;
	while (($x < 7.75) && ($y < 7.75)){				/*Run this loop until the generated coordonates reach the end of the grid */
		$random = shell_exec("shuf -i 0-1 -n 1");	
		if ($random == 0) {
			$x = $x + 0.5;							/*Move forward of one cell on the x axis one in two else move on the y axis. Take ramdomly the number 0 or 1 to make the choice*/
		} else {
			$y = $y + 0.5;
		}
	    $dis=get_distance($x, $y);
	    $t1_t2=get_sensor_mode();	                                          /*Get sensors distances for the generated coordonates*/
	    for ($i = $t1_t2["t1"]; $i <= $t1_t2["t2"]; $i++){				/*Run the loop for the three distances*/
	    	$intens=get_intensity($dis[$i]);		/*Get the intensity of the 'i' distance */
	    	$bin=convert_binary($intens);			/*Convert it to binary*/
	    	if ($i == 0) {
	    		$cap = "C1";
	    	}
	    	elseif ($i == 1) {						/*Set the sensors name according to i*/
	    		$cap = "C2";
	    	}
	    	else {
	    		$cap = "C3";
	    	}
	    	send_to_mqtt($bin, $cap);			/*Send the payload to the MQTT broker with the sensor name */
	    	printf("FSK %d : %d \n", $i+1, $bin); /*Logging*/ 

	    }
	    printf("x : %f, y : %f\n",$x, $y);
	    printf("----------------------------------------------\n");
	sleep(10);

}
}
?>