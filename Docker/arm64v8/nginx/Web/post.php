<?php

	$db_user = "sae24";
	$db_pass = "sae24pass";
	$db_name = "sae24";
	$db_host = "db";

	$db = mysqli_connect($db_host, $db_user, $db_pass, $db_name);
	if(isset($_POST['1']) && !isset($_POST['2']) && !isset($_POST['3'])){
		$sql = "UPDATE mode set nbr_capteur = '1'";
		if(mysqli_query($db, $sql)){header("Location: affichage.php"); exit;}
	}
	elseif(!isset($_POST['1']) && isset($_POST['2']) && !isset($_POST['3'])){
		$sql = "UPDATE mode set nbr_capteur = '2'";
		if(mysqli_query($db, $sql)){header("Location: affichage.php"); exit;}
	}
	elseif(!isset($_POST['1']) && !isset($_POST['2']) && isset($_POST['3'])){
		$sql = "UPDATE mode set nbr_capteur = '3'";
		if(mysqli_query($db, $sql)){header("Location: affichage.php"); exit;}
	}
	else
	{
		header("Location: affichage.php");
		exit;
	}

?>