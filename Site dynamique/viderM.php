<?php

	include("mysql.php");
	$sql = "TRUNCATE TABLE mesure";
	if(mysqli_query($db, $sql)){header("Location: ./"); exit;}else{header("Location: ./"); exit;}
	
?>