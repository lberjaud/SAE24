<?php
include ("mysql.php");

function division_zero ($n, $d){
	if ($d == 0){
		return 0;
	} else {
		return $n / $d;
	}
}
$id = 1;
	for ($i = 1; $i <= 16; $i++)
	{
		for ($j = 1; $j <= 16; $j++)
		{
			
			$x = $i / 2 - 0.25; 
			$y = $j / 2 - 0.25;
			$d1 = round(sqrt((0.25 - $x)**2 + (0.25 - $y)**2), 2);
			$d2 = round(sqrt((0.25 - $x)**2 + (7.75 - $y)**2), 2);
			$d3 = round(sqrt((7.75 - $x)**2 + (7.75 - $y)**2), 2);
			$i1 = round(division_zero(1.0006, $d1**2)*100, 2);
			$i2 = round(division_zero(1.0006, $d2**2)*100, 2);
			$i3 = round(division_zero(1.0006, $d3**2)*100, 2);
			$requete = "INSERT INTO position (x, y) VALUES ('$x', '$y')";
				mysqli_query($id_bd, $requete)
					or die("Execution de la requete impossible : $requete");
			$requete = "INSERT INTO distance (C1, C2, C3, id_position) VALUES ('$d1', '$d2', '$d3', '$id')";
			mysqli_query($id_bd, $requete)
					or die("Execution de la requete impossible : $requete");
			$requete = "INSERT INTO amplitude (distance, intensite) VALUES ('$d1', '$i1')";	
			mysqli_query($id_bd, $requete)
					or die("Execution de la requete impossible : $requete");			
			#printf("x: %s y: %s | d1: %s, d2: %s, d3: %s | i1: %s, i2: %s, i3: %s\n", $x, $y, $d1, $d2, $d3, $i1, $i2, $i3);
			$id = $id + 1;
		}
	}
?>