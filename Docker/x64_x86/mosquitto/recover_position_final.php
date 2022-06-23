<?php
/**
 * Execute a command and return it's output. Either wait until the command exits or the timeout has expired.
 *
 * @param string $cmd     Command to execute.
 * @param number $timeout Timeout in seconds.
 * @return string Output of the command.
 * @throws \Exception
 */
function exec_timeout($cmd, $timeout) {
  // File descriptors passed to the process.
  $descriptors = array(
    0 => array('pipe', 'r'),  // stdin
    1 => array('pipe', 'w'),  // stdout
    2 => array('pipe', 'w')   // stderr
  );

  // Start the process.
  $process = proc_open('exec ' . $cmd, $descriptors, $pipes);

  if (!is_resource($process)) {
    throw new \Exception('Could not execute process');
  }

  // Set the stdout stream to non-blocking.
  stream_set_blocking($pipes[1], 0);

  // Set the stderr stream to non-blocking.
  stream_set_blocking($pipes[2], 0);

  // Turn the timeout into microseconds.
  $timeout = $timeout * 1000000;

  // Output buffer.
  $buffer = '';

  // While we have time to wait.
  while ($timeout > 0) {
    $start = microtime(true);

    // Wait until we have output or the timer expired.
    $read  = array($pipes[1]);
    $other = array();
    stream_select($read, $other, $other, 0, $timeout);

    // Get the status of the process.
    // Do this before we read from the stream,
    // this way we can't lose the last bit of output if the process dies between these functions.
    $status = proc_get_status($process);

    // Read the contents from the buffer.
    // This function will always return immediately as the stream is non-blocking.
    $buffer .= stream_get_contents($pipes[1]);

    if (!$status['running']) {
      // Break from this loop if the process exited before the timeout.
      break;
    }

    // Subtract the number of microseconds that we waited.
    $timeout -= (microtime(true) - $start) * 1000000;
  }

  // Check if there were any errors.
  $errors = stream_get_contents($pipes[2]);

  if (!empty($errors)) {
    throw new \Exception($errors);
  }

  // Kill the process in case the timeout expired and it's still running.
  // If the process already exited this won't do anything.
  proc_terminate($process, 9);

  // Close all streams.
  fclose($pipes[0]);
  fclose($pipes[1]);
  fclose($pipes[2]);

  proc_close($process);

  return $buffer;
}

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

function get_coordonate ($distances){
	include ("mysql.php");
	$nbr_key=array_keys($distances);
	if (count($distances) == 3) {
		$d1=$distances["C1"];
		$d2=$distances["C2"];
		$d3=$distances["C3"];
		$requete = "SELECT position.*, distance.C1, distance.C2, distance.C3 FROM position 
		LEFT JOIN distance ON distance.id_position = position.id
		WHERE distance.C1 = $d1 AND distance.C2 = $d2 AND distance.C3 = $d3;";
	}
	elseif (count($distances) == 2) {
		$key0=$nbr_key[0];
		$key1=$nbr_key[1];
		$d1=$distances[$key0];
		$d2=$distances[$key1];
		$requete = "SELECT position.*, distance.C1, distance.C2, distance.C3 FROM position 
		LEFT JOIN distance ON distance.id_position = position.id
		WHERE distance.$key0 = $d1 AND distance.$key1 = $d2";
	}
	else {
		$key0=$nbr_key[0];
		$d1=$distances[$key0];
		$requete = "SELECT position.*, distance.C1, distance.C2, distance.C3 FROM position 
		LEFT JOIN distance ON distance.id_position = position.id
		WHERE distance.$key0 = $d1";
	}
	$resultat = mysqli_query($id_bd, $requete)
		or die("Execution de la requete impossible : $requete");
	for ($i=0; $i < mysqli_num_rows($resultat); $i++) { 
		$ligne[$i] = mysqli_fetch_array($resultat);
	}
	return $ligne;
	mysqli_close($id_bd);
}


function insert_measure ($payload){
	include ("mysql.php");
	date_default_timezone_set('Europe/Paris');
	$x=$payload[0]["x"];
	$y=$payload[0]["y"];
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

function insert_err_cap ($err, $position){
	include ("mysql.php");
	date_default_timezone_set('Europe/Paris');
	$date = date("Y-m-d");
	$time = date("H:i:s");
	$requete = "INSERT INTO journaux (date, heure, message, position) VALUES ('$date', '$time', '$err', '$position');";
		mysqli_query($id_bd, $requete)
			or die("Execution de la requete impossible : $requete");
}


$listecap=array("C1", "C2", "C3");

while (true) {																							/*Run this loop until the script is stopped*/
	$str=exec_timeout("mosquitto_sub -t iut/# -v -C 3", 3);		/*Subscribe all the topics starting by 'iut' and output only three lines with the payload and topic*/
	$array = preg_split("/\r\n|\n|\r/", $str);								/*Create an array by separating the output by using line return of separators. */ 
	$space=' ';																								/*Set separators variable*/
	$slash='/';
	$tp_cap=array();																					/*Create two empty arrays.*/
	$distances=array();
	for ($i=0; $i < count($array)-1; $i++) { 									/*Run this loop for each generated array before*/
		array_push($tp_cap,explode($space, $array[$i]));				/*Add into the 'tp_cap' array an other array composed of the topic and payload rcovered from the MQTT broker.*/
		$tp_cap[$i][0]=explode($slash, $tp_cap[$i][0]);					/*Slice the array line that include the topic into an other array with three lines (iut, sae24, 'sensors name') using slash as separator */
		$tp_cap[$i][1]=decode_binary($tp_cap[$i][1]);						/*Transform the binary intensity into decimal numnber into the array*/ 
	}
	$distances = array();
	for ($i=0; $i < count($tp_cap); $i++) { 
		$distances[$tp_cap[$i][0][2]] = get_distance($tp_cap[$i][1]);
	}
	if (count($distances) >= 1) {
		if (count($distances) == 3) {
			$coord=get_coordonate($distances);
			insert_measure($coord);
			/*printf("x : %s, y: %s\n", $coord[0]["x"], $coord[0]["y"]);		*/
		}
		elseif (count($distances) < 3) {
			$coord=get_coordonate($distances);
			$panne=array_values(array_diff($listecap, array_keys($distances)));
			$err_cap="Panne des capteurs : ";
			$err_cap .= implode( ', ', $panne);
			/*printf("%s\n", $err_cap);*/
			$poss_cord=array();
			$x="x";
			$y="y";
			for ($i=0; $i < count($coord); $i++) { 
				$poss_cord[$x] = $coord[$i]["x"];
				$poss_cord[$y] = $coord[$i]["y"];
				$x = "x" ;
				$x .= $i + 1;
				$y="y";
				$y .= $i + 1;
			}
			$list=[];
			foreach ($poss_cord as $key => $value) {
  		$list[] = "$key : $value";
			}
			$poss_cord=implode(', ', $list);
			/*printf("%s\n", $poss_cord);*/
			insert_err_cap($err_cap, $poss_cord);
	}
}
}
?>