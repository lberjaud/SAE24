<?php
include ("mysql.php");

function division_zero ($n, $d){ 
	if ($d == 0){
		return 0;					/*Deal with the devision by 0 -> return 0*/
	} else {
		return $n / $d;
	}
}
$id = 1;							/*Set the id of the first row*/
	for ($i = 1; $i <= 16; $i++)
	{								/*Double loop to fill the table with all possible x and y coordonate starting by x=1 -> x=i and y=j*/
		for ($j = 1; $j <= 16; $j++) 
		{
			
			$x = $i / 2 - 0.25;  	/*Our grid is made of 0.25 by 0.25 cell*/ 
			$y = $j / 2 - 0.25;
			$d1 = round(sqrt((0.25 - $x)**2 + (0.25 - $y)**2), 2);  
			$d2 = round(sqrt((0.25 - $x)**2 + (7.75 - $y)**2), 2); /*Calculate the distance of generated position with the three sensors */
			$d3 = round(sqrt((7.75 - $x)**2 + (7.75 - $y)**2), 2);
			$i1 = division_zero(1.0006, $d1**2)*100;				
			$i1 = bcdiv($i1, 1, 2);									/*Calculate the intensity for each distance with the i = k/d^2 formula*/
			$i2 = division_zero(1.0006, $d2**2)*100;				/*Only keep two digit after comma DO NOT ROUND*/
			$i2 = bcdiv($i2, 1, 2);
			$i3 = division_zero(1.0006, $d3**2)*100;
			$i2 = bcdiv($i3, 1, 2);
			$requete = "INSERT INTO position (x, y) VALUES ('$x', '$y')";  /*Insert x and y coordonate into the 'position' table */
				mysqli_query($id_bd, $requete)
					or die("Execution de la requete impossible : $requete");
			$requete = "INSERT INTO distance (C1, C2, C3, id_position) VALUES ('$d1', '$d2', '$d3', '$id')"; /*Insert the three sensors distances into the 'distance' table with the id*/
			mysqli_query($id_bd, $requete)
					or die("Execution de la requete impossible : $requete");
			$requete = "INSERT INTO amplitude (distance, intensite) VALUES ('$d1', '$i1')";	 /*Insert distance and matching ientensity into the 'amplitude' table, use only i1 variable to avoid some duplicate.*/
			mysqli_query($id_bd, $requete)
					or die("Execution de la requete impossible : $requete");			
			#printf("x: %s y: %s | d1: %s, d2: %s, d3: %s | i1: %s, i2: %s, i3: %s\n", $x, $y, $d1, $d2, $d3, $i1, $i2, $i3);
			$id = $id + 1; /*Increment the id value*/
		}
	}
?>