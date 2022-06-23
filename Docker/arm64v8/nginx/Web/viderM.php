<?php

	$db_user = "sae24";
	$db_pass = "sae24pass";
	$db_name = "sae24";
	$db_host = "db";

	$db = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
	$sql = "TRUNCATE TABLE mesure";
	if(mysqli_query($db, $sql)){header("Location: affichage.php"); exit;}else{header("Location: affichage.php"); exit;}
	
?>