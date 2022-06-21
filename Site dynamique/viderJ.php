<?php

	include("mysql.php");
	$sql = "TRUNCATE TABLE journaux";
	if(mysqli_query($db, $sql)){header("Location: ./"); exit;}
	
?>