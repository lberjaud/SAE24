<?php

	include("mysql.php");

	if(isset($_POST['1']) && !isset($_POST['2']) && !isset($_POST['3'])){
		$sql = "UPDATE mode set nbr_capteur = '1'";
		if(mysqli_query($db, $sql)){header("Location: ./"); exit;}
	}
	elseif(!isset($_POST['1']) && isset($_POST['2']) && !isset($_POST['3'])){
		$sql = "UPDATE mode set nbr_capteur = '2'";
		if(mysqli_query($db, $sql)){header("Location: ./"); exit;}
	}
	elseif(!isset($_POST['1']) && !isset($_POST['2']) && isset($_POST['3'])){
		$sql = "UPDATE mode set nbr_capteur = '3'";
		if(mysqli_query($db, $sql)){header("Location: ./"); exit;}
	}
	else
	{
		header("Location: ./");
		exit;
	}

?>