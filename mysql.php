<?php
/* Script de connexion à la base sae 23 */

  $id_bd = mysqli_connect("127.0.0.1","root","","sae24")
    or die("Connexion au serveur et/ou à la base de données impossible");

  /* Gestion de l'encodage des caractères */
  mysqli_query($id_bd, "SET NAMES 'utf8'");

?>
